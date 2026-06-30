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

# Se usa Amazon_Linux porque está dada de baja NGINX bitnami
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# inst  sub
# 0 % 2 0
# 1 % 2 1
# 2 % 2 0
# 3 % 2 1

# inst  sub
# 0 % 3 0
# 1 % 3 1
# 2 % 3 2
# 3 % 3 0
# 4 % 3 1
# 5 % 3 2

resource "aws_instance" "from_count" {
  count         = var.ec2_instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.main[count.index % length(aws_subnet.main)].id

  tags = {
    Project = local.project
    Name    = "${(local.project)}-${count.index}"
  }

}


resource "aws_instance" "from_list" {
  count         = length(var.ec2_instance_config_list)
  ami           = local.ami_ids[var.ec2_instance_config_list[count.index].ami]
  instance_type = var.ec2_instance_config_list[count.index].instance_type

  #subnet_id = aws_subnet.main[count.index % length(aws_subnet.main)].id
  subnet_id = aws_subnet.main[var.ec2_instance_config_list[count.index].subnet_name].id

  tags = {
    Project = local.project
    Name    = "${(local.project)}-${count.index}"
  }
}


resource "aws_instance" "from_map" {
  # each.key   => holds the key of each key-value pair in the map 
  # each.value => holds the value of each key-value pair in the map
  for_each      = var.ec2_instance_config_map
  ami           = local.ami_ids[each.value.ami]
  instance_type = each.value.instance_type

  #subnet_id = aws_subnet.main[0].id
  subnet_id = aws_subnet.main[each.value.subnet_name].id

  tags = {
    Project = local.project
    Name    = "${(local.project)}-${each.key}"
  }
}