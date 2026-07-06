locals {
instance_type = "t3.micro"
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



module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.4.0"

  name = local.project_name

  instance_type = local.instance_type
  ami = data.aws_ami.ubuntu.id

  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id  = module.vpc.private_subnets[0]

  tags = local.common_tags
}