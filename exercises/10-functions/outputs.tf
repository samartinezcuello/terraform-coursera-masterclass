output "example1" {
  value = startswith(lower(local.name), "john")
}

output "example2" {
  value = pow(local.age, 2)
}

output "example3" {
  value = yamldecode(file("${path.module}/users.yaml")).users[*].name
}

output "example4" {
  value = jsonencode(local.my_object)
}