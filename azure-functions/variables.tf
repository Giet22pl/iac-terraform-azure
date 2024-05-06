variable "name" {
  type = string
  default = "azurerm-resource-group"
}
variable "location" {
  type = string
  default = "West Europe"
}
variable "account_tier" {
  type = string
  default = "Standard"
}
variable "account_replication_type" {
  type = string
  default = "GRS"
}
variable "os_type" {
  type = string
  default = "Linux"
}
variable "sku_name" {
  type = string
  default = "P1v2"
}
