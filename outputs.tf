output "instance_id" {
  description = "ID da EC2"
  value       = aws_instance.bia-terraform.id
}

output "instance_type" {
  description = "Tipo da EC2"
  value       = aws_instance.bia-terraform.instance_type
}

output "instance_public_id" {
  description = "IP publico da EC2"
  value       = aws_instance.bia-terraform.public_ip
}

output "instance_tags" {
  description = "Tags da EC2"
  value       = aws_instance.bia-terraform.tags_all
}

output "instance_security_groups" {
  description = "SG da EC2"
  value       = aws_instance.bia-terraform.security_groups
}
