module "majorservice" {
  for_each                  = var.majorservice
  source                    = "./vm-func"
  name                      = each.key
  subnet_id                 = var.subnet_id
  resource_group_name      = var.resource_group_name
  storage_image_reference  = var.storage_image_reference
  zone_name                = var.zone_name
  network_security_group_id = var.network_security_group_id
}







module "majorservice" {
  depends_on = [module.majorservice]
  for_each                  = var.microservice
  source                    = "./vm-func"
  name                      = each.key
  subnet_id                 = var.subnet_id
  resource_group_name      = var.resource_group_name
  storage_image_reference  = var.storage_image_reference
  zone_name                = var.zone_name
  network_security_group_id = var.network_security_group_id
}

