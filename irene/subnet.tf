resource "aws_subnet" "irene-public-subnet" {
  vpc_id     = "${aws_vpc.irene-vpc.id}"
  map_public_ip_on_launch = true
  count = "${length(var.irene-public-subnet)}"
  cidr_block = "${element(var.irene-public-subnet, count.index)}"
  availability_zone = "${element(var.AZ, count.index)}"

  tags = {
    Name = "${element(var.irene-public-subnet-names, count.index)}"
  }
  depends_on = ["aws_vpc.irene-vpc"]
}

resource "aws_subnet" "irene-private-subnet" {
  vpc_id     = "${aws_vpc.irene-vpc.id}"
  map_public_ip_on_launch = true
  count = "${length(var.irene-private-subnet)}"
  cidr_block = "${element(var.irene-private-subnet, count.index)}"
  availability_zone = "${element(var.AZ, count.index)}"

  tags = {
    Name = "${element(var.irene-private-subnet-names, count.index)}"
  }
  depends_on = ["aws_vpc.irene-vpc"]
}