# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "bia"
resource "aws_ecr_repository" "bia" {
  force_delete         = true
  image_tag_mutability = "MUTABLE"
  name                 = "bia"
  tags                 = {}
  tags_all             = {}
  encryption_configuration {
    encryption_type = "AES256"
    kms_key         = null
  }
  image_scanning_configuration {
    scan_on_push = false
  }
}
