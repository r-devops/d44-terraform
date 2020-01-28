module "EC2" {
  source          = "../../../MODULES/ec2"
  INSTANCE_TYPE   = var.INSTANCE_TYPE
  PROJECT         = var.PROJECT
  ENV             = var.ENV
  AMI_ACCOUNT     = var.AMI_ACCOUNT
  SUBNETS         = data.terraform_remote_state.vpc.outputs.SUBNETS
  SG-SSH          = data.terraform_remote_state.sg.outputs.SG-SSH
  SG-MONGO        = data.terraform_remote_state.sg.outputs.SG-MONGO
}

terraform {
  backend "s3" {
    bucket = "d44-terraform-resources"
    key    = "PROJECT/DEV/EC2"
    region = "us-east-2"
    dynamodb_table = "terraform-locking"
  }
}

// Import Network State

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config    =  {
    bucket  = "d44-terraform-resources"
    key     = "PROJECT/DEV/VPC"
    region  = "us-east-2"
  }
}

data "terraform_remote_state" "sg" {
  backend = "s3"
  config    =  {
    bucket  = "d44-terraform-resources"
    key     = "PROJECT/DEV/SG"
    region  = "us-east-2"
  }
}
