resource "aws_route_table" "prod-1-public-rt" {
  vpc_id = aws_vpc.vpc_prod-1.id
  provider = aws.region-prod-1

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_prod-1-gw.id
  }
  route {
    cidr_block = "192.168.1.0/24"
    vpc_peering_connection_id = aws_vpc_peering_connection.useast1-uswest-2.id
  }
  
  tags = {
    Name = "${var.env}-${var.proj1}-public-rt"
  }
}
resource "aws_route_table_association" "prod-1-public-rta-1" {
  provider = aws.region-prod-1
  subnet_id      = aws_subnet.prod-1-public-subnet-1.id
  route_table_id = aws_route_table.prod-1-public-rt.id
}
resource "aws_route_table_association" "prod-1-public-rta-2" {
  provider = aws.region-prod-1
  subnet_id      = aws_subnet.prod-1-public-subnet-2.id
  route_table_id = aws_route_table.prod-1-public-rt.id
}

resource "aws_route_table" "prod-2-public-rt" {
  vpc_id = aws_vpc.vpc_prod-2.id
  provider = aws.region-prod-2

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_prod-2-gw.id
  }
  route {
    cidr_block = "10.0.2.0/24"
    vpc_peering_connection_id = aws_vpc_peering_connection.useast1-uswest-2.id

}
  route {
    cidr_block = "10.0.1.0/24"
    vpc_peering_connection_id = aws_vpc_peering_connection.useast1-uswest-2.id

}

  tags = {
    Name = "${var.env}-${var.proj2}-public-rt"
  }
}
resource "aws_route_table_association" "prod-2-public-rta-1" {
  provider = aws.region-prod-2
  subnet_id      = aws_subnet.prod-2-public-subnet-1.id
  route_table_id = aws_route_table.prod-2-public-rt.id
}