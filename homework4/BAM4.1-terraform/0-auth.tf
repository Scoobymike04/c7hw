terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.17.0"
    }
  }
}

provider "aws" {
  # Configuration options

  region = "us-east-2"

  default_tags {
    tags = {
      ManageBy = "Terraform"
    }
  }
}