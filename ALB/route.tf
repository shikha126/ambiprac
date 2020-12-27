resource "aws_route_table" "SIT-public-RT" {
  vpc_id = aws_vpc.SIT-PSI-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "${var.env}-${var.project}-Public-RT"
  }
}

resource "aws_route_table_association" "public-associate1" {
  subnet_id      = aws_subnet.SIT-PSI-Public-SUBNET-1.id
 # subnet_id      = aws_subnet.SIT-PSI-Public-SUBNET-2.id
  route_table_id = aws_route_table.SIT-public-RT.id
}
resource "aws_route_table_association" "public-associate2" {
  #subnet_id      = aws_subnet.SIT-PSI-Public-SUBNET-1.id
  subnet_id      = aws_subnet.SIT-PSI-Public-SUBNET-2.id
  route_table_id = aws_route_table.SIT-public-RT.id
}

resource "aws_route_table" "SIT-private-RT" {
  vpc_id = aws_vpc.SIT-PSI-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.NATGW.id}"
  }

  tags = {
    Name = "${var.env}-${var.project}-Private-RT"
  }
}
resource "aws_route_table_association" "private-associate1" {
  subnet_id      = aws_subnet.SIT-PSI-Private-SUBNET-1.id
  #subnet_id      = aws_subnet.SIT-PSI-Private-SUBNET-2.id
  route_table_id = aws_route_table.SIT-private-RT.id
}
resource "aws_route_table_association" "private-associate2" {
  #subnet_id      = aws_subnet.SIT-PSI-Private-SUBNET-1.id
  subnet_id      = aws_subnet.SIT-PSI-Private-SUBNET-2.id
  route_table_id = aws_route_table.SIT-private-RT.id
}