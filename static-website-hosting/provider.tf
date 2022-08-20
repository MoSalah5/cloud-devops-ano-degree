terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
    }
  }
}

provider "aws" {
  region  = var.region_name
  profile = var.aws_profile_name

  default_tags {
    tags = {
      # put any needed tags
      Name    = var.bucket_name
      Project = var.project_name
    }
  }
}