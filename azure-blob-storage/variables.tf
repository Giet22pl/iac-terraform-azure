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
variable "container_access_type" {
  type = string
  default = "private"
}
variable "source" {
  type = string
  default = "some-local-file.zip"
}