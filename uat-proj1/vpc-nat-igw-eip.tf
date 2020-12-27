resource "aws_vpc" "UAT-VPC1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"
  tags = {
    Name = "${var.env}-${var.proj1}"
  }
}

resource "aws_eip" "uatNATGW-EIP" {
  
  vpc      = true
}
resource "aws_nat_gateway" "uatnatgw" {
  allocation_id = aws_eip.uatNATGW-EIP.id
  subnet_id     = aws_subnet.uat-public-subnets[0].id

  tags = {
    Name = "gw NAT"
  }
}
resource "aws_eip" "ALB-EIP" {
  
  vpc      = true
}

resource "aws_internet_gateway" "UAT-IGW" {
  vpc_id = aws_vpc.UAT-VPC1.id

  tags = {
    Name = "UAT-IGW"
  }
}