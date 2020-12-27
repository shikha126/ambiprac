resource "aws_vpc" "prod-income-vpc" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"
  
  tags = {
    Name = "${var.env1}-${var.project}-vpc"
  }
}

resource "aws_vpc" "uat-income-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = "${var.env2}-${var.project}-vpc"
  }
}
resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.prod-income-vpc.id
  
  tags = {
    Name = "prod-income-igw"
  }
}

resource "aws_internet_gateway" "uat-igw" {
  vpc_id = aws_vpc.uat-income-vpc.id
  
  tags = {
    Name = "uat-income-igw"
  }
}

resource "aws_eip" "prod-ngw-ip" {
  
  vpc      = true
}

resource "aws_eip" "uat-ngw-ip" {
  
  vpc      = true
}

resource "aws_nat_gateway" "prod-nat-gw" {
  allocation_id = aws_eip.prod-ngw-ip.id
  subnet_id     = aws_subnet.prod-public-subnet[0].id
}
resource "aws_nat_gateway" "uat-nat-gw" {
  allocation_id = aws_eip.uat-ngw-ip.id
  subnet_id     = aws_subnet.uat-public-subnet[0].id
}