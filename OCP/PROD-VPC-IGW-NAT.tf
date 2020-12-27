resource "aws_vpc" "prod-ocp-vpc" {
  cidr_block       = "10.40.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = "${var.env}-${var.project}-vpc"
  }
}

resource "aws_internet_gateway" "prod-ocp-igw" {
  vpc_id = aws_vpc.prod-ocp-vpc.id

  tags = {
    Name = "${var.env}-${var.project}-IGW"
  }
}

resource "aws_eip" "eip-natw" {
  vpc      = true
}


resource "aws_nat_gateway" "natw" {
  allocation_id = aws_eip.eip-natw.id
  subnet_id     = aws_subnet.public-subnet[0].id
  tags = {
    Name = "${var.env}-${var.project}-NGW"
  }
}