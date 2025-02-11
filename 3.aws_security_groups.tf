resource "aws_security_group" "bia_dev" {
  description = "acesso biad-dev"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "acesso porta 3001 para o mundo"
    from_port        = 3001
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 3001
  }]
  name                   = "bia-dev"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = var.vpc-name
}

resource "aws_security_group" "bia_alb" {
  description = "acesso bia-alb"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "acesso geral"
    from_port        = 443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 443
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "acesso geral"
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "ping liberado"
    from_port        = -1
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "icmp"
    security_groups  = []
    self             = false
    to_port          = -1
  }]
  name                   = "bia-alb"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = var.vpc-name
}

resource "aws_security_group" "bia_ec2" {
  description = "acesso bia-ec2"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = []
    description      = "acesso bia-alb"
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = [aws_security_group.bia_alb.id]
    self             = false
    to_port          = 0
  }]
  name                   = "bia-ec2"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = var.vpc-name
}

resource "aws_security_group" "bia_web" {
  description = "acesso bia-web"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "acesso para o mundo"
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
  }]
  name                   = "bia-web"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = var.vpc-name
}

resource "aws_security_group" "bia_db" {
  description = "acesso bia-db"
  egress = [{
    cidr_blocks      = []
    description      = "acesso bia-dev"
    from_port        = 5432
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = [aws_security_group.bia_dev.id]
    self             = false
    to_port          = 5432
    }, {
    cidr_blocks      = []
    description      = "acesso bia-ec2"
    from_port        = 5432
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = [aws_security_group.bia_ec2.id]
    self             = false
    to_port          = 5432
    }, {
    cidr_blocks      = []
    description      = "acesso bia-web"
    from_port        = 5432
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = [aws_security_group.bia_web.id]
    self             = false
    to_port          = 5432
  }]
  ingress = [{
    cidr_blocks      = []
    description      = "acceso do bia-beanstalk"
    from_port        = 5432
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-046e10758a4c39e7e"]
    self             = false
    to_port          = 5432
    }, {
    cidr_blocks      = []
    description      = "acesso do bia-build"
    from_port        = 5432
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = ["sg-0711c1f0aec9c2f04"]
    self             = false
    to_port          = 5432
    }, {
    cidr_blocks      = []
    description      = "acesso do bia-dev"
    from_port        = 5432
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = [aws_security_group.bia_dev.id]
    self             = false
    to_port          = 5432
    }, {
    cidr_blocks      = []
    description      = "acesso do bia-ec2"
    from_port        = 5432
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = [aws_security_group.bia_ec2.id]
    self             = false
    to_port          = 5432
    }, {
    cidr_blocks      = []
    description      = "acesso do bia-web"
    from_port        = 5432
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = [aws_security_group.bia_web.id]
    self             = false
    to_port          = 5432
  }]
  name                   = "bia-db"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = var.vpc-name
}

