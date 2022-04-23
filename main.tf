terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

data "aws_caller_identity" "current" {
}

data "template_file" "instance_setup" {
  template = file("instance_setup.yaml")

  vars = {
    region = var.region
  }
}