resource "aws_instance" "bia-terraform" {
    ami = "ami-085ad6ae776d8f09c"
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.bia_terraform.id]
    tags = {
      Name = var.instance_name
      ambiente = "terraform"
    }
    root_block_device {
      volume_size = 10
      volume_type = "gp3"
    }
    iam_instance_profile = aws_iam_instance_profile.role_acesso_ssm.name
    user_data = "${file("userdata-bia-terraform.sh")}"
}   