
variable "location" {}
variable "resource_group_name" {}
variable "app_service_plan_name" {}
variable "webapp_name" {}
variable "docker_image" {}
variable "docker_registry_url" {}
variable "docker_registry_username" {}
variable "tags" {
  type = map(string)
  default = {
    owner = "nancy"
    project = "webapp"
  }
}
# Docker registry credentials for pulling container image
variable "docker_registry_password" {
  type      = string
  sensitive = true
  description = "Password for authenticating with Azure Container Registry"
}

