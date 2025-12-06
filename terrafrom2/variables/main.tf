variable "age" {
  default = 30
}

output "output_of_age" {
  value = var.age
}

variable "name" {
  default = "KAMKAMAS"
}

output "name" {
  value = var.name
}



variable "CurrentUSDtoINT" {
  default = 90
}

output "outputUSDtoINR" {
  value = "${var.CurrentUSDtoINT} is the current USD to INR price"
}




variable "list" {
  default = [
    1,
    2,
    false,
    true,
    "Sexy Boiii"
  ]
}


output "listOutput" {
  value = [
    var.list[0],
    var.list[1],
    var.list[2],
    var.list[3],
    var.list[4]
  ]
}


variable "map" {
  default = {
    name: "Tush"
    age: 70
    HasKids: false
    }
}


output "mapOutput" {
  value = [
    var.map["name"],
    var.map["age"],
    var.map["HasKids"]
  ]
}


