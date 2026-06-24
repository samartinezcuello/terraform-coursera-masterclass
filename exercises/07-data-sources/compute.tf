data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# This data source should be defined to return the identity of the caller.
data "aws_caller_identity" "current" {}

# Data to retrieve current region
data "aws_region" "current" {}

data "aws_vpc" "vpc" {
  tags = {
    Env = "Prod"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}


data "aws_iam_policy_document" "static_website" {
  statement {
    sid = "PublicReadGetObject"
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = ["arn:aws:s3:::*/*"]
  }
}

# Outputs
output "ubuntu_ami_data" {
  value = data.aws_ami.ubuntu.id
}

output "aws_caller_identity" {
  value = data.aws_caller_identity.current
}

output "aws_region_output" {
  value = data.aws_region.current
}

output "aws_vpc" {
  value = data.aws_vpc.vpc
}

output "azs" {
  value = data.aws_availability_zones.available
}

output "iam_policy" {
  value = data.aws_iam_policy_document.static_website.json
}
# # Instance with ubuntu retrieved AMI
# resource "aws_instance" "web" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t3.micro"

#   root_block_device {
#     delete_on_termination = true
#     volume_size           = 10
#     volume_type           = "gp3"
#   }

# }
