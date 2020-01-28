terraform {
  backend "s3" {
    bucket = "d44-terraform-resources"
    key    = "PROJECT/DEV/SG"
    region = "us-east-2"
    dynamodb_table = "terraform-locking"
  }
}


data "terraform_remote_state" "remote" {
  backend = "s3"
  config    =  {
    bucket  = "d44-terraform-resources"
    key     = "PROJECT/DEV/VPC"
    region  = "us-east-2"
  }
}


// Module

module "SG" {
  source          = "../../../MODULES/sg"
  PROJECT         = var.PROJECT
  ENV             = var.ENV
  VPCID         = data.terraform_remote_state.remote.outputs.VPCID
}