terraform {
  backend "local" {
    path = "/etc/cicd/tf/tfstate/azure-aks.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.6.1"

    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 1.2.3"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_kubernetes_cluster" "aks_cluster" {
  depends_on          = [azurerm_kubernetes_cluster.aks] # refresh cluster state before reading
  name                = var.cluster_name
  resource_group_name = var.resource_group_name
}

provider "helm" {
  kubernetes {
    host                   = data.azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.aks_cluster.kube_config.0.cluster_ca_certificate)
  }
}

provider "kubernetes" {
  host                   = data.azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.aks_cluster.kube_config.0.cluster_ca_certificate)
}

