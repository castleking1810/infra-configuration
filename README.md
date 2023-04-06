# infra-configuration

terraform code for deploying managed k8s clusters for each of the major cloud providers, and installs usefull applications automatically.

supported cloud providers:

- Azure - AKS
- AWS - EKS (upcoming)
- GCP - GKE (upcoming)

installed applications:

- argocd - use gitops to manage resources in the k8s cluster. uses traefik ingress controller configured with ssl certs from hashicorp vault.
- prometheus operator - collect metrics and logs from the cluster and applications running on it.
- grafana - monitoring platform using metrics gathered by prometheus.
- sonarqube - code quality scanning (upcoming)
