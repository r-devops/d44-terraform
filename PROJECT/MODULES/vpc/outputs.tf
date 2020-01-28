output "VPCID" {
  value = aws_vpc.main.id
}

output "SUBNETS" {
  value = aws_subnet.subnets.*.id
}