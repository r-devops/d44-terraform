resource "aws_subnet" "subnets" {
  count                     = length(data.aws_availability_zones.available.names)
  vpc_id                    = aws_vpc.main.id
  cidr_block                = cidrsubnet(var.VPC_CIDR, 8, count.index)
  map_public_ip_on_launch   = true
  availability_zone         = element(data.aws_availability_zones.available.names, count.index)

  tags                      = {
    Name                    = "subnet${count.index+1}"
  }
}