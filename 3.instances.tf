resource "aws_instance" "bia-terraform" {
    ami = "ami-085ad6ae776d8f09c"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.bia_terraform.id]
    tags = {
      Name = var.instance_name
      ambiente = "terraform"
    }
    root_block_device {
      volume_size = 8
      volume_type = "gp3"
    }
    
}   