variable "location-rg" {
  description = "This is variable for location"
  type        = string
  default     = "westeurope"
  
}
variable "linux_fx_version" {
  description = "this is the dockerimage for the application"
  type        = string
}

# variable "DOCKER_REGISTRY_SERVER_PASSWORD" {
#   description = "this is the dockerserver passwrd for the application"
#   type        = string
# }

# variable "DOCKER_REGISTRY_SERVER_URL" {
#   description = "this is the docker server urlfor the application"
#   type        = string
# }

# variable "DOCKER_REGISTRY_SERVER_USERNAME" {
#   description = "this is the server username for the application"
#   type        = string
# }