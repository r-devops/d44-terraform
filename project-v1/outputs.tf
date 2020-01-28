output "value1" {
  value = aws_security_group.sgs.*.id
}