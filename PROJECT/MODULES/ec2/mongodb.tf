resource "aws_instance" "mongodb" {
  ami                       = data.aws_ami.ami-public.id
  instance_type             = var.INSTANCE_TYPE["mongodb"]
  subnet_id                 = var.SUBNETS[0]
  vpc_security_group_ids    = [var.SG-SSH, var.SG-MONGO]
}