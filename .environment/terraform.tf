terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.98"
    }
  }

  backend "s3" {
    bucket  = var.BUCKET_S3
    key     = "state/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }

  required_version = ">= 1.4.0"
}

provider "aws" {
  region = var.AWS_REGION
}