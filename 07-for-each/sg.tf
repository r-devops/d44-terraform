variable "sample" {
  default = ["80,22", "22,333"]
}

resource "aws_security_group" "allow_tls" {
  count = 2
  name        = "allow_tls${count.index}"
  description = "Allow TLS inbound traffic${count.index}"

  dynamic "ingress" {
    iterator    = objects
    for_each    = split("," , var.sample[count.index])
    content {
      from_port  = objects.value
      to_port     = objects.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


provider "aws" {
  region = "us-east-2"
}
