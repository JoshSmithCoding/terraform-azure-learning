# Learning: "Terraform init" to initialise the back-end
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.91.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}

# Learning: Terraform specific alias
resource "azurerm_resource_group" "mtc-rg" {
  name     = "mtc-resources"
  location = "uksouth"
  tags = {
    environment = "dev"
  }
}