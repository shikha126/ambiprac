resource "aws_route_table" "ocp-private-rt" {
  vpc_id = aws_vpc.prod-ocp-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natw.id
  }

  tags = {
    Name = "${var.env}-${var.project}-Private-RT"
  }
}
resource "aws_route_table" "ocp-public-rt" {
  vpc_id = aws_vpc.prod-ocp-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod-ocp-igw.id
  }

  tags = {
    Name = "${var.env}-${var.project}-Public-RT"
  }
}
resource "aws_route_table_association" "ocp-priv-rt-assoc" {
    count = "${length(var.private-subnet)}"
    subnet_id      = "${element(aws_subnet.private-subnet.*.id, count.index)}"
    route_table_id = aws_route_table.ocp-private-rt.id
}



resource "aws_route_table_association" "ocp-public-rt-assoc" {
    count = "${length(var.public-subnet)}"
    subnet_id      = "${element(aws_subnet.public-subnet.*.id, count.index)}"
    route_table_id = aws_route_table.ocp-public-rt.id
}





