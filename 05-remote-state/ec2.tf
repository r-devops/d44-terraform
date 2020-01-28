resource "aws_instance" "web" {
  ami                 = "ami-05e16c04136e2d247"
  instance_type       = "t2.micro"
}

resource "null_resource" "sleep" {
  provisioner "local-exec" {
    command = "sleep 300"
  }
}