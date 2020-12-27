resource "aws_route_table" "public-RT" {
  vpc_id = aws_vpc.UAT-VPC1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.UAT-IGW.id
  }
  tags = {
    Name = "${var.env}-${var.proj1}-public-RT"
  }
}

resource "aws_route_table_association" "public-RTA" {
  count = "${length(var.uat-public-subnets)}"
  subnet_id      = "${element(aws_subnet.uat-public-subnets.*.id, count.index)}"
  route_table_id = aws_route_table.public-RT.id
}

resource "aws_route_table" "private-RT" {
  vpc_id = aws_vpc.UAT-VPC1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.uatnatgw.id
  }
  tags = {
    Name = "${var.env}-${var.proj1}-private-RT"
  }
}
resource "aws_route_table_association" "private-RTA" {
  count = "${length(var.uat-private-subnets)}"
  subnet_id      = "${element(aws_subnet.uat-private-subnets.*.id, count.index)}"
  route_table_id = aws_route_table.private-RT.id
}
