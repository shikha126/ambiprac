resource "aws_vpc" "SIT-PSI-VPC" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = "${var.env}-${var.project}-VPC"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.SIT-PSI-VPC.id

  tags = {
    Name = "${var.env}-${var.project}-IGW"
  }
}

resource "aws_eip" "SIT-EIP-NATGW-IP" {
  
  vpc      = true
}

resource "aws_nat_gateway" "NATGW" {
  allocation_id = aws_eip.SIT-EIP-NATGW-IP.id
  subnet_id     = aws_subnet.SIT-PSI-Private-SUBNET-1.id
  tags = {
    Name = "NATGW"
  }
  depends_on = ["aws_eip.SIT-EIP-NATGW-IP", "aws_vpc.SIT-PSI-VPC"]
}



