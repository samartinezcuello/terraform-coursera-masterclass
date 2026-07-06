module "vpc" {
  source = "./modules/networking"
  #   vpc_cidr = "10.0.0.0/16"
  #   vpc_name = "13-local-modules"
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "13-local-modules"
  }

  subnet_config = {
    subnet_1 = {
      cidr_block = "10.0.0.0/24"
      # public     = true
      az = "eu-west-1a"
    }
    subnet_2 = {
      cidr_block = "10.0.1.0/24"
      public     = true
      az         = "eu-west-1b"
    }
  }
}
