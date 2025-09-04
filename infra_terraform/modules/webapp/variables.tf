
variable "location" {}
variable "resource_group_name" {}
variable "app_service_plan_name" {}
variable "webapp_name" {}
variable "docker_image" {}
variable "docker_registry_url" {}
variable "docker_registry_username" {}
variable "docker_registry_password" {}
variable "tags" {
  type = map(string)
  default = {
    owner = "nancy"
    project = "webapp"
  }
}
variable "docker_registry_password" {
  type      = string
  sensitive = true
  description = "Password for authenticating with Azure Container Registry"
}

