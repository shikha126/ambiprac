resource "aws_subnet" "prod-private-subnet" {
  vpc_id     = aws_vpc.prod-income-vpc.id
  count = "${length(var.prod-private-subnet)}"
  cidr_block = "${element(var.prod-private-subnet, count.index)}"
  availability_zone = "${element(var.avail-zone, count.index)}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "${var.env1}-${var.project}-${element(var.income-private-subnet-name, count.index)}"
  }
}

resource "aws_subnet" "prod-public-subnet" {
  vpc_id     = aws_vpc.prod-income-vpc.id
  count = "${length(var.prod-public-subnet)}"
  cidr_block = "${element(var.prod-public-subnet, count.index)}"
  availability_zone = "${element(var.avail-zone, count.index)}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "${var.env1}-${var.project}-${element(var.income-public-subnet-name, count.index)}"
  }
}

resource "aws_subnet" "uat-private-subnet" {
  vpc_id     = aws_vpc.uat-income-vpc.id
  count = "${length(var.uat-private-subnet)}"
  cidr_block = "${element(var.uat-private-subnet, count.index)}"
  availability_zone = "${element(var.avail-zone, count.index)}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "${var.env2}-${var.project}-${element(var.income-private-subnet-name, count.index)}"
  }
}

resource "aws_subnet" "uat-public-subnet" {
  vpc_id     = aws_vpc.uat-income-vpc.id
  count = "${length(var.uat-public-subnet)}"
  cidr_block = "${element(var.uat-public-subnet, count.index)}"
  availability_zone = "${element(var.avail-zone, count.index)}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "${var.env2}-${var.project}-${element(var.income-public-subnet-name, count.index)}"
  }
}

