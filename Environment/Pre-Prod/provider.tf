terraform {
  backend "azurerm" {
    resource_group_name  = "rg1"
    storage_account_name = "distorage1234"
    container_name       = "tfstate"
    key                  = "pre-prod.terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"
    }
  } 
}
provider "azurerm" {
  features {}
}
