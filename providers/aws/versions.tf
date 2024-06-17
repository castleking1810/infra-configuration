terraform {

  backend "s3" {
    bucket = "erel-dagan-basic"
    key    = "tf-states/eks-state"
    region = "il-central-1"
    #skip_region_validation = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.54"
    }
  }
}

provider "aws" {
  region = "il-central-1"
}
