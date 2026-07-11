terraform {
  required_version = "1.15.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }

  cloud {

    organization = "santiago-martinez-lab"

    workspaces {
      name = "terraform-cli"
    }
  }
}


provider "aws" {
  region = "eu-west-1"
}