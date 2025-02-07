variable "instance_name" {
  type        = string
  description = "Nome da instance ec2 de trabalho"
  default     = "bia-terraform"
}

variable "vpc-name" {
  type        = string
  description = "ID da VPC"
  default     = "vpc-0c1423d037d76a673"
}

variable "instance_type" {
  type        = string
  description = "Instance Type"
  default     = "t2.micro"
}