output "VPCID" {
  value = aws_vpc.main.id
}

output "SUBNETS" {
  value = aws_subnet.subnets.*.id
}

output "VPC_CIDR" {
  value = var.VPC_CIDR
}