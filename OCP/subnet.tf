resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.prod-ocp-vpc.id
  count = "${length(var.public-subnet)}"
  cidr_block = "${element(var.public-subnet, count.index)}"
  availability_zone = "${element(var.avail-zone, count.index)}"
  map_public_ip_on_launch = true
  
  tags = {
    Name = "${var.env}-${var.project}-${element(var.public-subnet-name, count.index)}"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.prod-ocp-vpc.id
  count = "${length(var.private-subnet)}"
  cidr_block = "${element(var.private-subnet, count.index)}"
  availability_zone = "${element(var.avail-zone, count.index)}"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.env}-${var.project}-${element(var.private-subnet-name, count.index)}"
  }
}