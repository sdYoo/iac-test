terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "hpe-poc-rg" {
  name     = "hpe-poc-resources"
  location = "West Europe"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "hpe-poc-vnet" {
  name                = "hpe-poc-network"
  resource_group_name = azurerm_resource_group.hpe-poc-rg.name
  location            = azurerm_resource_group.hpe-poc-rg.location
  address_space       = ["10.0.0.0/16"]
}
