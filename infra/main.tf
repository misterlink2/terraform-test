terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.22"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}