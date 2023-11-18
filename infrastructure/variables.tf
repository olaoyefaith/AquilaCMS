variable "location-rg" {
  description = "This is variable for location"
  type        = string
  default     = "westeurope"
  
}
variable "DOCKER_IMAGE" {
  description = "this is the dockerimage for the application"
  type        = string
}

variable "DOCKER_IMAGE_TAG" {
  description = "this is the dockerserver passwrd for the application"
  type        = string
}

