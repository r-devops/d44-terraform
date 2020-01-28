provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "d44-terraform-resources"
    key    = "PROJECT/ENV/DEV/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "terraform-locking"
  }
}