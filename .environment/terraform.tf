terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.98" }
  }
  backend "s3" {
    bucket  = var.S3_BUCKET
    key     = "state/terraform.tfstate"
    region  = "us-east-1"  # region must be static or provided via -backend-config
    encrypt = true
  }
  required_version = ">= 1.12.1"
}

provider "aws" {
  region = var.AWS_REGION
}