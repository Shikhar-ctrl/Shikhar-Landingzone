terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "shikhartfstate2026"
    container_name       = "tfstate"
    key                  = "landingzone.tfstate"

    use_azuread_auth = true
  }
}

provider "azurerm" {
  features {}
  subscription_id = "CHANGE ME"
}
