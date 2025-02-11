resource "aws_instance" "bia-dev" {
    ami = "ami-085ad6ae776d8f09c"
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.bia_dev.id]
    tags = {
      Name = var.instance_name
      ambiente = "dev"
    }
    root_block_device {
      volume_size = 8
      volume_type = "gp3"
    }
    iam_instance_profile = aws_iam_instance_profile.role_acesso_ssm.name
    user_data = "${file("scripts/userdata-bia-dev.sh")}"
}   