locals {
  project_name           = "15-object-validation"
  allowed_instance_types = ["t3.micro", "t2.micro"]
}

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


resource "aws_instance" "this" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.this[0].id

  tags = {
    # Name    = local.project_name
    # Project = local.project_name
    CostCenter = "1234"
  }

  lifecycle {
    # precondition {
    #   condition     = contains(local.allowed_instance_types, var.instance_type)
    #   error_message = "Invalid instance type"
    # }
    postcondition {
      condition     = contains(local.allowed_instance_types, self.instance_type)
      error_message = "Invalid instance type"
    }
    create_before_destroy = true
  }
}

check "cost_center_check" {
  assert {
    condition     = can(aws_instance.this.tags["CostCenter"])
    error_message = "Your AWS Instance does not have a CostCenter tag."
  }
}