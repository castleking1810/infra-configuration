variable "location" {
  default     = "ue"
  description = "azure location for aks cluster"
}
variable "resource_group_name" {
  default = "Erel-RG"
}
variable "cluster_name" {
  default     = "Erel-AKS"
  description = "name for aks cluster. affects dns as well"
}

variable "kubernetes_version" {
  default = "1.18"
}

variable "node_count" {
  default = "3"
}


