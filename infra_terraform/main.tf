provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "webapp_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_integer" "acr_suffix" {
  min = 100000
  max = 999999
}

resource "azurerm_container_registry" "acr" {
  name                = "acrwebapp${random_integer.acr_suffix.result}"
  resource_group_name = azurerm_resource_group.webapp_rg.name
  location            = azurerm_resource_group.webapp_rg.location
  sku                 = "Basic"
  admin_enabled       = true
}
