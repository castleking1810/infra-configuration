
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version

  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = var.vpc_id
  control_plane_subnet_ids = data.aws_subnets.private.ids

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true

  # access_entries = {
  #   # One access entry with a policy associated
  #   example = {
  #     kubernetes_groups = []
  #     principal_arn     = "arn:aws:iam::123456789012:role/something"

  #     policy_associations = {
  #       example = {
  #         policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
  #         access_scope = {
  #           namespaces = ["default"]
  #           type       = "namespace"
  #         }
  #       }
  #     }
  #   }
  # }

  # cluster encryption
  cluster_encryption_config                 = { "resources" : ["secrets"] }
  cluster_encryption_policy_name            = "${var.cluster_name}-encryption-policy"
  cluster_encryption_policy_use_name_prefix = false
  cluster_encryption_policy_tags = {
    Terraform = "true"
  }
  create_kms_key          = "true"
  enable_kms_key_rotation = false

  cluster_ip_family = "ipv4"

  #security group
  create_cluster_security_group           = true
  cluster_security_group_name             = "${var.cluster_name}-sg"
  cluster_security_group_description      = "Security Group for terraform provisioned EKS cluster"
  cluster_security_group_additional_rules = {}
  cluster_security_group_use_name_prefix  = false
  cluster_security_group_tags = {
    Terraform = "true"
  }

  # cludwatch
  create_cloudwatch_log_group = false

  # IAM
  create_iam_role              = true
  iam_role_description         = "IAM Role for EKS by tf"
  iam_role_name                = "role-for-${var.cluster_name}"
  iam_role_additional_policies = {}
  iam_role_use_name_prefix     = false
  iam_role_tags = {
    Terraform = "true"
  }

  # Node Group
  create_node_security_group = true


  create_cluster_primary_security_group_tags = true
  tags = {
    Terraform = "true"
  }
}
