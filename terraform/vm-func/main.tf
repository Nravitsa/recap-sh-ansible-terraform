

resource "azurerm_public_ip" "publicip" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = data.azurerm_resource_group.rg.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "privateip" {
  name                = var.name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}


resource "azurerm_network_interface_security_group_association" "nsg-attach" {
  network_interface_id      = azurerm_network_interface.privateip.id
  network_security_group_id = var.network_security_group_id
}


resource "azurerm_virtual_machine" "vm" {
  name                  = var.name
  location              = data.azurerm_resource_group.rg.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.privateip.id]
  vm_size               = "Standard_DS1_v2"
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true


  storage_image_reference {
    id = var.storage_image_reference
  }

  storage_os_disk {
    name              = var.name
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_Dsv2"
  }
  os_profile {
    computer_name  = var.name
    admin_username = "tushar"
    admin_password = "tushar@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}



resource "azurerm_dns_a_record" "frontend" {
  name                = "${var.name}-dev"
  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name
  ttl                 = 3
  records             = azurerm_network_interface.privateip.private_ip_address
}