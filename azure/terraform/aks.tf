resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.cluster_name

  default_node_pool {
    name       = "prod"
    node_count = var.node_count
    vm_size    = "Standard_DS2_v2"

    tags = {
      "application" = "erel"
    }
  }

  linux_profile {
    admin_username = "aksuser"

    ssh_key {
      key_data = file("~/.ssh/id_rsa.pub")

    }
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control {
    enabled = true
  }

  network_profile {
    network_plugin     = "azure"
    dns_service_ip     = "10.0.0.10"
    service_cidr       = "10.0.0.0/16"
    pod_cidr           = "10.1.0.0/16"
    docker_bridge_cidr = "172.17.0.1/16"
  }

  tags = {
    "application" = "Erel"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "dev-pool" {
  name       = "dev"
  node_count = var.node_count
  vm_size    = "Standard_DS2_v2"

  tags = {
    "application" = "erel"
  }
}


