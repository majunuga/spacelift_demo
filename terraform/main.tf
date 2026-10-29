terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Generate unique suffix
resource "random_id" "suffix" {
  byte_length = 4
}

# Generate SSH Key Pair
resource "tls_private_key" "demo_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Store Private Key in SSM Parameter Store
resource "aws_ssm_parameter" "private_key" {
  name        = "/ssh/demo-keypair/${random_id.suffix.hex}"
  description = "Private SSH key for EC2 demo"
  type        = "SecureString"
  value       = tls_private_key.demo_key.private_key_pem

  tags = {
    Environment = "demo"
  }
}

# Create AWS Key Pair
resource "aws_key_pair" "demo_keypair" 
  key_name   = "demo-keypair-$

