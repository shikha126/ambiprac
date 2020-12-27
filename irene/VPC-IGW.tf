resource "aws_vpc" "irene-vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "irene-VPC"
  }
}
resource "aws_internet_gateway" "irene-gw" {
  vpc_id = aws_vpc.irene-vpc.id

  tags = {
    Name = "irene-gw"
  }
}

resource "aws_eip" "EIP-1" {
  vpc      = true
}

resource "aws_nat_gateway" "irene-nat-gw" {
  allocation_id = aws_eip.EIP-1.id
  subnet_id     = aws_subnet.irene-public-subnet[0].id
}