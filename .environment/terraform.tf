terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.98" }
  }
  backend "s3" {
    bucket  = var.BUCKET_S3           # Variável definida em terraform.tfvars
    key     = "state/terraform.tfstate"
    region  = "us-east-1"            # Região estática ou via -backend-config
    encrypt = true
  }
  required_version = ">= 1.4.0"  # Ajustado para suportar Terraform 1.4.0 do runner
}

provider "aws" {
  region = var.AWS_REGION
}