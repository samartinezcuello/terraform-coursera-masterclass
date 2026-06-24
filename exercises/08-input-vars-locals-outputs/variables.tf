variable "aws_region" {
  type        = string
  description = "Region of AWS"
  default     = "eu-west-1"
}


variable "ec2_instance_type" {
  type        = string
  description = "EC2 Instance type"
  default     = "t3.micro"

  validation {
    condition     = contains(["t3.micro", "t2.micro"], var.ec2_instance_type)
    error_message = "Only t2.micro and t3.micro instances are supported"
  }
}

variable "ec2_volume_type" {
  type        = string
  description = "EC2 Volume type"
  default     = "gp3"
}

variable "ec2_volume_size" {
  type        = number
  description = "EC2 Volume Size"
  default     = 10
}