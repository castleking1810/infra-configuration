terraform {
  backend "local" {
    path = "/etc/cicd/tf/tfstate/azure-aks.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.5.0"
    }

    # vault = {
    #   source = "hashicorp/vault"
    #   version = "3.14.0"
    # }
  }
}

# provider "vault" {
#   address = "https://vault.consolenetwork.com:8200"

#   ca_cert_file = "/etc/vault.d/certs/ca.crt"
# }

provider "azurerm" {
  features {}

}
