resource "azurerm_resource_group" "example" {
  name     = var.name
  location = var.location
}
resource "azurerm_storage_account" "example" {
  name = "azurerm-storage-account"
  resource_group_name = azurerm_resource_group.example.name
  location = azurerm_resource_group.example.location
  account_tier = var.account_tier
  account_replication_type = var.account_replication_type

  tags = {
    environment = "staging"
  }
}
resource "azurerm_storage_container" "example" {
  name = "azurerm-storage-container"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = var.container_access_type
}

resource "azurerm_storage_blob" "example" {
  name = "azurerm-storage-blob.zip"
  storage_account_name = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type = "Block"
  source = var.source
}