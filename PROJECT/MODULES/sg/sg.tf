resource "aws_security_group" "sg-ssh" {
  name                = "allow_ssh"
  description         = "Allow ssh inbound traffic"
  vpc_id              = var.VPCID

  ingress {
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
  }

  egress {
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    cidr_blocks       = ["0.0.0.0/0"]
  }
  tags                = {
    Name              = "sg-ssh-${var.PROJECT}-${var.ENV}"
  }
}

resource "aws_security_group" "sg-mongo" {
  name                = "allow_mongo"
  description         = "Allow Mongo inbound traffic"
  vpc_id              = var.VPCID

  ingress {
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = [var.VPC_CIDR]
  }

  egress {
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    cidr_blocks       = ["0.0.0.0/0"]
  }
  tags                = {
    Name              = "sg-Mongo-${var.PROJECT}-${var.ENV}"
  }
}

