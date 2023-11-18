variable "location-rg" {
  description = "This is variable for location"
  type        = string
  default     = "westeurope"
  
}
variable "docker_image_tag" {
  description = "this is the dockerimage for the application"
  type        = string
}

variable "docker_image" {
  description = "this is the dockerserver passwrd for the application"
  type        = string
}

