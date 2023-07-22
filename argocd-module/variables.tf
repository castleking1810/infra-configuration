variable "host" {
  description = "k8s host"
}

variable "client_certificate" {
  description = "client certificate for authenticating with the cluster"
}

variable "client_key" {
  description = "client certificate key"
}

variable "cluster_ca_certificate" {
  description = "ca certificate"
}