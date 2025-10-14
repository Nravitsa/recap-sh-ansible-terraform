

variable "resource_group_name" {
  default = "project-ecom"
}


variable "location" {
  default = "East US"
}


variable "subnet_id" {
  default = "subscriptoon/828323323232323"
}


variable "network_security_group_id" {
  default = "subscription/fefddfdfd/dfdfdf"
}

variable "zone_name" {
   default = "tusharbytes.com"
 }

variable "storage_image_reference" {
  default = "someID"
}


variable "majorservice" {
  default = {
    mongodb = {}
    rabbitmq = {}
    mysql = {}
    redis = {}
  }
}

variable "microservice" {
  default = {
    payment = {}
    cart = {}
    dispatch = {}
    shipping = {}
  }

}