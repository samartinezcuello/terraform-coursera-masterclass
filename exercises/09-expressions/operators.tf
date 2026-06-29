locals {
  math       = 2 * 2         # Math operators: *, /, %, +, -, -<number> (multiplication by - number ej. -2 = 2 negativo)  ##  Return number
  equiality  = 2 == 3        # Equality operators: ==, !=  ##  Return boolean
  comparison = 2 > 1         # Comparison operators: <, <=, >, >=  ##  Return boolean
  logical    = true || false # Logical operators: ||, &&  ##  Return boolean
}

output "operators" {

  value = {
    math       = local.math
    equiality  = local.equiality
    comparison = local.comparison
    logical    = local.logical
  }
}