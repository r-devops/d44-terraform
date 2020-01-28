provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "d44-terraform-resources"
    key    = "project-v1/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "terraform-locking"
  }
}