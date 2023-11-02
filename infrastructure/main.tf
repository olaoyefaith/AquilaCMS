
 resource "azurerm_resource_group" "rg" {
  name     = "assignment-rg"
  location = var.location-rg
  tags = {
    "Application" = "Aquila"
  }
}


