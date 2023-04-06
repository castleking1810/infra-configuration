terraform {
  backend "local" {
    path = "/etc/cicd/tf/tfstate/azure-aks.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.5.0"
    }

  }
}

provider "azurerm" {
  features {}

  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
}
