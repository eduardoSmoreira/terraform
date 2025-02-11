terraform {
  backend "s3" {
    bucket  = "s3-bucket-terraform-states"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    profile = "terraform"
  }
}