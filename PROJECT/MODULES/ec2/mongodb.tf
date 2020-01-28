resource "aws_instance" "mongodb" {
  ami                       = data.aws_ami.ami-public.id
  instance_type             = var.INSTANCE_TYPE["mongodb"]
}