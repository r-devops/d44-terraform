resource "aws_route_table" "r-table" {
  vpc_id          = aws_vpc.main.id

  route {
    cidr_block    = "0.0.0.0/0"
    gateway_id    = aws_internet_gateway.igw.id
  }

  tags            = {
    Name          = "route-table-${var.PROJECT}"
  }
}

resource "aws_route_table_association" "r-table-assoc" {
  count           = length(data.aws_availability_zones.available.names)
  subnet_id       = element(aws_subnet.subnets.*.id, count.index)
  route_table_id  = aws_route_table.r-table.id
}