
 resource "azurerm_resource_group" "rg" {
  name     = "aquila-rg"
  location = var.location-rg
  tags = {
    "Application" = "Aquila"
  }
}


