# Configure the Azure provider
provider "azurerm" {
  # use_oidc = true
  features {
    resource_group {
     prevent_deletion_if_contains_resources = false
   }
  }
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.7.0"
    }
  }
}
