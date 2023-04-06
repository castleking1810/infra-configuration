output "kubeconfig_path" {
  value       = abspath("${path.root}/kubeconfig")
  sensitive   = true
  description = "kubeconfig file path"
}

output "cluster_name" {
  value = var.cluster_name
}
