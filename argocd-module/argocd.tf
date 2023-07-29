resource "kubernetes_namespace_v1" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  values     = ["${file("${path.module}/values/argocd.yaml")}"]


}

resource "helm_release" "traefik" {
  name       = "traefik"
  namespace  = "argocd"
  repository = "https://helm.traefik.io/traefik"
  chart      = "traefik"
  values     = ["${file("${path.module}/values/traefik.yaml")}"]


}

#resource "helm_release" "argocd" {
#  repository = "https://github.com/argoproj/argo-helm/tree/main/charts/argo-cd"
#  namespace = "argocd"
#  chart = 
#}

