terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "aabaa404-78d8-4e3b-8aa9-96d230044e2d"
}