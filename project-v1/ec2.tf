
resource "aws_instance" "servers" {
  count                     = length(var.inputs)
  ami                       = "ami-05e16c04136e2d247"
  instance_type             = "t2.micro"
  vpc_security_group_ids    = [aws_security_group.sgs[count.index].id]

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "root"
      password = "DevOps321"
      host     = self.private_ip
    }

    inline = [
      "cd /root",
      "git clone https://rkb03:password@gitlab.com/d44/shell-scripts.git",
      "cd /root/shell-scripts/PROJECT",
      "make ${var.inputs[count.index]}"
    ]


  }

  tags      = {
    Name  = "${var.inputs[count.index]}-node"
  }
}


/*
resource "aws_instance" "app" {
  ami                 = "ami-05e16c04136e2d247"
  instance_type       = "t2.micro"
}

resource "aws_instance" "db" {
  ami                 = "ami-05e16c04136e2d247"
  instance_type       = "t2.micro"
}
*/