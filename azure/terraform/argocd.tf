locals {
  # Example annotations when using Nginx ingress controller as shown here https://argoproj.github.io/argo-cd/operator-manual/ingress/#option-1-ssl-passthrough
  argocd_ingress_annotations = {
    "kubernetes.io/ingress.class"                    = nginx
    "nginx.ingress.kubernetes.io/force-ssl-redirect" = "true"
    "nginx.ingress.kubernetes.io/ssl-passthrough"    = "true"
  }
  #argocd_repositories = [
  #  {
  #    url      = "https://repo.git"
  #    username = "hello"
  #    password = "bar"
  #  },
  #  {
  #    url          = "https://repo.git"
  #    access_token = var.argocd_access_token
  #  },
  #  {
  #    url  = "https://charts.jetstack.io"
  #    type = "helm"
  #  },
  #]

}


module "argocd" {
  source = "DeimosCloud/argocd/kubernetes"

  ingress_host        = "argocd.example.com"
  ingress_annotations = local.argocd_ingress_annotations
  repositories        = local.argocd_repositories
  # Argocd Config
  config = {
    "accounts.image-updater" = "apiKey"
  }

  # Argocd RBAC Config
  rbac_config = {
    "policy.default" = "role:readonly"
    "policy.csv"     = <<POLICY
  p, role:image-updater, applications, get, */*, allow
  p, role:image-updater, applications, update, */*, allow
  g, image-updater, role:image-updater
POLICY
  }

  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]
}