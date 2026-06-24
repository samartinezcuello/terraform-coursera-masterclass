
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Own by myself, managed by my Terraform Proyect
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

# For external resources like external bucket. Manage for others, to use here.
data "aws_s3_bucket" "my_external_bucket" {
  bucket = "not-managed-by-us"
}

variable "bucket_name" {
  type        = string
  description = "Variable used to set bucket name"
  default     = "my_default_bucket_name"
}

output "bucket_id" {
  description = "ID of the S3 bucket"
  value       = aws_s3_bucket.my_bucket.id
}

# Local variables
locals {
  local_example = "This is a local variable"
}

# To import something to this proyect, for example this folder
module "my_module" {
  source = "./module-example"

}