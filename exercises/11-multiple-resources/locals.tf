locals {
  project = "11-multiple-resources"

  ami_ids = {
    ubuntu       = data.aws_ami.ubuntu.id
    amazon_linux = data.aws_ami.amazon_linux.id
  }
}