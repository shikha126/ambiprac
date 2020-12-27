resource "aws_route_table" "prod-public-rt" {
  vpc_id = aws_vpc.prod-income-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod-igw.id
  }
  tags = {
    Name = "${var.env1}-${var.project}-public-rt"
  }
}
resource "aws_route_table_association" "prod-public-rta" {
  count = "${length(var.prod-public-subnet)}"
  subnet_id      = "${element(aws_subnet.prod-public-subnet.*.id, count.index)}"
  route_table_id = aws_route_table.prod-public-rt.id
}

resource "aws_route_table" "prod-private-rt" {
  vpc_id = aws_vpc.prod-income-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.prod-nat-gw.id 
  }

  tags = {
    Name = "${var.env1}-${var.project}-private-rt"
  }
}
resource "aws_route_table_association" "prod-private-rta" {
  count = "${length(var.prod-private-subnet)}"
  subnet_id      = "${element(aws_subnet.prod-private-subnet.*.id, count.index)}"
  route_table_id = aws_route_table.prod-private-rt.id
}
resource "aws_route_table" "uat-private-rt" {
  vpc_id = aws_vpc.uat-income-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.uat-nat-gw.id 
  }

  tags = {
    Name = "${var.env2}-${var.project}-private-rt"
  }
}
resource "aws_route_table_association" "uat-private-rta" {
  count = "${length(var.uat-private-subnet)}"
  subnet_id      = "${element(aws_subnet.uat-private-subnet.*.id, count.index)}"
  route_table_id = aws_route_table.uat-private-rt.id
}


resource "aws_route_table" "uat-public-rt" {
  vpc_id = aws_vpc.uat-income-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.uat-igw.id
  }

  tags = {
    Name = "${var.env2}-${var.project}-public-rt"
  }
}
resource "aws_route_table_association" "uat-public-rta" {
  count = "${length(var.uat-public-subnet)}"
  subnet_id      = "${element(aws_subnet.uat-public-subnet.*.id, count.index)}"
  route_table_id = aws_route_table.uat-public-rt.id
}





