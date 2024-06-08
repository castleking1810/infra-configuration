output "kubeconfig_path" {
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
  description = "kubeconfig file path"
}

output "cluster_name" {
  value = var.cluster_name
}
