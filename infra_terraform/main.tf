provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "webapp_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                = "acrwebappnb"  # 👈 Static name
  resource_group_name = azurerm_resource_group.webapp_rg.name
  location            = azurerm_resource_group.webapp_rg.location
  sku                 = "Basic"
  admin_enabled       = true

  tags = {
    owner       = "nancy-bethala"
    environment = "dev"
    managed_by  = "terraform"
  }
}

module "webapp" {
  source                    = "./modules/webapp"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  app_service_plan_name     = "nb-app-plan-dev"
  webapp_name               = "webapp-nb-dev"
  docker_image              = "nancyacr.azurecr.io/my-node-app:latest"
  docker_registry_url       = "https://nancyacr.azurecr.io"
  docker_registry_username  = var.docker_registry_username
  docker_registry_password  = var.docker_registry_password
  tags                      = var.tags
}
