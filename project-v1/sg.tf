resource "aws_security_group" "sgs" {
  count       = length(var.inputs)
  name        = "allow_${var.inputs[count.index]}"
  description = "Allow ${var.inputs[count.index]} inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    iterator    = objects
    for_each    = split("," , var.ports[count.index])
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
