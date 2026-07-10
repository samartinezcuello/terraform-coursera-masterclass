module "database" {
  source = "./modules/rds"

  project_name = "proj04-rds-module"
  subnet_ids = [
    aws_subnet.private1.id,
    aws_subnet.private2.id
  ]
  security_group_ids = [
    aws_security_group.compliant.id
  ]
  credentials = {
    username = "dbadmin"
    password = "abcd_1234"
  }
}

