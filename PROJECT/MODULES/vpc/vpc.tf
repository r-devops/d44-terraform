resource "aws_vpc" "main" {
  cidr_block            = var.VPC_CIDR
  tags                  = {
    Name                = "vpc-${var.PROJECT}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id                = aws_vpc.main.id

  tags                  = {
    Name                = "igw-${var.PROJECT}"
  }
}