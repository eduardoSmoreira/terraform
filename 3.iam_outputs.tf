resource "aws_iam_instance_profile" "role_acesso_ssm" {
    name        = "role-acesso-ssm"
    name_prefix = null
    path        = "/"
    role        = aws_iam_role.role_acesso_ssm.name
    tags        = {}
    tags_all    = {}
}

resource "aws_iam_role" "role_acesso_ssm" {
    assume_role_policy    = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"}}],\"Version\":\"2012-10-17\"}"
    description           = "Allows EC2 instances to call AWS services like CloudWatch and Systems Manager on your behalf."
    force_detach_policies = false
    managed_policy_arns   = ["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess", "arn:aws:iam::aws:policy/AmazonECS_FullAccess", "arn:aws:iam::aws:policy/AmazonS3FullAccess", "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
    max_session_duration  = 3600
    name                  = "role-acesso-ssm"
    name_prefix           = null
    path                  = "/"
    permissions_boundary  = null
    tags                  = {}
    tags_all              = {}

    /* inline_policy {
        name   = "policy-get-secret-rds"
        policy = jsonencode(
            {
                Statement = [
                    {
                        Action   = [
                            "secretsmanager:GetSecretValue",
                        ]
                        Effect   = "Allow"
                        Resource = [
                            "arn:aws:secretsmanager:us-east-1:961341523711:secret:rds!db-34395daa-9fab-446a-ad2e-3523fb432e10-HQN9v9",
                        ]
                    },
                ]
                Version   = "2012-10-17"
            }
        )
    } */
}
