variable "resource_group_name" {
  default = "rg-webapp-deploy"
}

variable "location" {
  default = "Central US"
}

variable "app_service_plan_sku" {
  type    = string
  default = "B1"
}

variable "web_app_name" {
  type = string
}

variable "docker_registry_username" {
  type = string
}

variable "docker_registry_password" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "app_service_plan_name" {
  type        = string
  description = "Name of the App Service Plan"
}

variable "acr_name" {
  type        = string
  description = "Name of the Azure Container Registry"
}

variable "docker_image_tag" {
  type        = string
  description = "Tag of the Docker image to deploy"
  default     = "latest"  # Optional, if you want to avoid passing it every time
}

