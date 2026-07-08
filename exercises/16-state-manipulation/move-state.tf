/*
1. terraform state mv [OLD-REFERENCE] [NEW-REFERENCE]
*/


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

# moved {
#   from = aws_instance.new_list[0]
#   to = aws_instance.new_list["instance1"]
# }

# moved {
#   from = aws_instance.new_list[1]
#   to = aws_instance.new_list["instance2"]
# }

resource "aws_instance" "new_list" {
  count         = 2
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
}