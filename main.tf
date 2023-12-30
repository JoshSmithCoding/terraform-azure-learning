# Learning: "terraform init" to initialise the back-end
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

resource "azurerm_virtual_network" "mtc-vn" {
  name                = "mtc-network"
  resource_group_name = azurerm_resource_group.mtc-rg.name
  location            = "uksouth"
  address_space       = ["10.123.0.0/16"]

  tags = {
    environment = "dev"
  }
}

# Learning: "terraform state list <resource.alias>"
# Learning: "terraform plan destroy"
resource "azurerm_subnet" "mtc-subnet" {
  name                 = "mtc-subnet"
  resource_group_name  = azurerm_resource_group.mtc-rg.name
  virtual_network_name = azurerm_virtual_network.mtc-vn.name
  # Plural name for variable, probably expects list
  address_prefixes = ["10.123.1.0/24"]
}