resource "azurerm_resource_group" "azurerm_resource_group" {
  
  name = var.name
  location = var.location
}
resource "azurerm_storage_account" "azurerm_storage_account" {

  name = "azurerm-storage-account"
  resource_group_name = azurerm_resource_group.example.name
  location = azurerm_resource_group.example.location
  account_tier = var.account_tier
  account_replication_type = var.account_replication_type

  tags = {
    environment = "staging"
  }
}
resource "azurerm_service_plan" "azurerm_service_plan" {
  
  name = "azurerm-service-plan"
  resource_group_name = azurerm_resource_group.example.name
  location = azurerm_resource_group.example.location
  os_type = var.os_type
  sku_name = var.sku_name
}
resource "azurerm_linux_function_app" "azurerm_linux_function_app" {
  
  name = "azurerm-linux-function-app"
  location = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  service_plan_id  = azurerm_service_plan.example.id
  storage_account_name = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key

  site_config {
    application_stack {
      python_version = "3.9"
    }
  }
}
resource "azurerm_function_app_function" "azurerm_function_app_function" {
  
  name = "azurerm-function-app-function"
  function_app_id = azurerm_linux_function_app.example.id
  language = "Python"
  test_data = jsonencode({
    "name" = "Azure"
  })
  config_json = jsonencode({
    "bindings" = [
      {
        "authLevel" = "function"
        "direction" = "in"
        "methods" = [
          "get",
          "post",
        ]
        "name" = "req"
        "type" = "httpTrigger"
      },
      {
        "direction" = "out"
        "name" = "$return"
        "type" = "http"
      },
    ]
  })
}
terraform {
	backend "local" {
		path= "/terraform.tfstate"
		}
		}