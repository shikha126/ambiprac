resource "aws_route_table" "irene-public-route" {
  vpc_id = aws_vpc.irene-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.irene-gw.id
  }
}

resource "aws_route_table_association" "irene-public-route-a" {
    count = "${length(var.irene-public-subnet)}"
    subnet_id      = "${element(aws_subnet.irene-public-subnet.*.id, count.index)}"
    route_table_id = "${aws_route_table.irene-public-route.id}"
}      
 
resource "aws_route_table" "irene-private-route" {
  vpc_id = aws_vpc.irene-vpc.id

  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_nat_gateway.irene-nat-gw.id
  }
}

resource "aws_route_table_association" "irene-private-route-a" {
    count = "${length(var.irene-private-subnet)}"
    subnet_id      = "${element(aws_subnet.irene-private-subnet.*.id, count.index)}"
    route_table_id = "${aws_route_table.irene-private-route.id}"
}    