resource "aws_instance" "mongodb" {
  ami                       = data.aws_ami.ami-public.id
  instance_type             = var.INSTANCE_TYPE["mongodb"]
  subnet_id                 = var.SUBNETS[0]
  vpc_security_group_ids    = [var.SG-SSH, var.SG-MONGO]
  key_name                  = "devops"

  tags                      = {
    Name                    = "mongo-db-instance"
  }

  provisioner "remote-exec" {
    connection {
      host = self.public_ip
      user = "root"
      password = "DevOps321"
    }

    inline = [
      "yum install ansible -y",
      "echo localhost >/tmp/hosts",
      "ansible-pull -i /tmp/hosts -U https://rkb03:password@gitlab.com/d44/ansible.git playbooks/project.yml -t mongodb"
    ]
  }
}