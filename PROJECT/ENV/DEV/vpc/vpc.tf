terraform {
  backend "s3" {
    bucket = "d44-terraform-resources"
    key    = "PROJECT/DEV/VPC"
    region = "us-east-2"
    dynamodb_table = "terraform-locking"
  }
}

module "VPC" {
  source    = "../../../MODULES/vpc"
  VPC_CIDR  = var.VPC_CIDR
  PROJECT   = var.PROJECT
}