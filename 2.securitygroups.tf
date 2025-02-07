resource "aws_security_group" "bia_terraform" {
  name        = "bia-terraform"
  description = "Regra para a instancia de trabalho bia-terraform"
  vpc_id      = var.vpc-name

  ingress {
    description = "Liberado 3001 para o mundo"
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}