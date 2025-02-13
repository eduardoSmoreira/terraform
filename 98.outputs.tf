output "instance_id" {
  description = "ID da EC2"
  value       = aws_instance.bia-dev.id
}

output "instance_type" {
  description = "Tipo da EC2"
  value       = aws_instance.bia-dev.instance_type
}

output "instance_public_id" {
  description = "IP publico da EC2"
  value       = aws_instance.bia-dev.public_ip
}

output "rds_endpoint" {
  description = "Endpoint do RDS da BIA"
  value       = aws_db_instance.bia.endpoint
}

output "ECS_CLUSTER" {
  description = "ECS Cluster Name"
  value=aws_ecs_cluster.cluster-bia.name
}

output "bia_repo_url" {
  value = aws_ecr_repository.bia.repository_url
}

output "rds_secret_name" {
  description = "Nome do meu segredo"
  value = data.aws_secretsmanager_secret.bia_db.name
}