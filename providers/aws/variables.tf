variable "resource_group_name" {
  default = "Erel-RG"
}

variable "cluster_name" {
  default     = "my-tf-cluster"
  description = "name for eks cluster"
}

variable "kubernetes_version" {
  default     = "1.30"
  description = "k8s version for the cluster"
}

variable "vpc_id" {
  default     = "vpc-093c11df66ac7e6b7"
  description = "name of VPC where cluster will be created"
}



