output "SG-SSH" {
  value = aws_security_group.sg-ssh.id
}

output "SG-MONGO" {
  value = aws_security_group.sg-mongo.id
}