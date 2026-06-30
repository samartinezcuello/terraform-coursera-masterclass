
variable "subnet_count" {
  default = 2
  type    = number
}

variable "ec2_instance_count" {
  default = 1
  type    = number
}

variable "ec2_instance_config_list" {
  default = []
  type = list(object({
    ami           = string
    instance_type = string
    subnet_name   = optional(string, "default")
  }))

  # Only T3 micro instances are allowed
  validation {
    condition     = alltrue([for config in var.ec2_instance_config_list : config.instance_type == "t3.micro"])
    error_message = "Only t3.micro instances are supported"
  }

  # Only Ubuntu or Amazon_Linux AMIs are allowed
  validation {
    condition     = alltrue([for config in var.ec2_instance_config_list : contains(["nginx", "ubuntu"], config.ami)])
    error_message = "At least one of the AMI providers are not supported. Only \"Ubuntu\" and \"Amazon_linux\" AMIs are supported"
  }
}


variable "ec2_instance_config_map" {
  default = {}
  type = map(object({
    instance_type = string
    ami           = string
    subnet_name   = optional(string, "default")
  }))

  # Only T3 micro instances are allowed
  validation {
    condition     = alltrue([for key, value in var.ec2_instance_config_map : value.instance_type == "t3.micro"])
    error_message = "Only t3.micro instances are supported"
  }

  # Only Ubuntu or Amazon_Linux AMIs are allowed
  validation {
    condition     = alltrue([for config in values(var.ec2_instance_config_map) : contains(["nginx", "ubuntu"], config.ami)])
    error_message = "At least one of the AMI providers are not supported. Only \"Ubuntu\" and \"Amazon_linux\" AMIs are supported"
  }
}


variable "subnet_config" {
  type = map(object({
    cidr_block = string
  }))

  # Can(X) function returns true if X is ok without error and false if X have errors.
  validation {
    condition     = alltrue([for config in values(var.subnet_config) : can(cidrnetmask(config.cidr_block))])
    error_message = "At least one of the provided CIDR blocks is not valid."
  }
}
