resource "aws_instance" "web" {
  ami               = "ami-05e16c04136e2d247"
  instance_type     = "t2.small"
  vpc_security_group_ids = ["sg-036e539d47c90214d", "sg-01275060b874c6649"]
  key_name = "devops"

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >/tmp/hosts"
  }

  provisioner "remote-exec" {
    connection {
      user = "root"
      password = "DevOps321"
      host = self.private_ip
    }
    inline = ["uptime"]
  }

  provisioner "local-exec" {
    command = <<EOF
      cd /root/ansible
      ansible-playbook -i /tmp/hosts playbooks/project.yml
EOF
  }

}

provider "aws" {
  region = "us-east-2"
}