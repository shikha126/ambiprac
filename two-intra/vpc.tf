#Create VPC in us-east-1
resource "aws_vpc" "vpc_prod-1" {
    provider = aws.region-prod-1
    cidr_block = "${var.vpc_prod-1-cidr}"
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
    Name = "${var.env}-${var.proj1}-vpc"
  }

}

resource "aws_internet_gateway" "vpc_prod-1-gw" {
    provider = aws.region-prod-1
    vpc_id = aws_vpc.vpc_prod-1.id

  tags = {
    Name = "vpc_prod-1-gw"
  }
}


#Create VPC in us-west-2
resource "aws_vpc" "vpc_prod-2" {
    provider = aws.region-prod-2
    cidr_block = "${var.vpc_prod-2-cidr}"
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
    Name = "${var.env}-${var.proj2}-vpc"
  }

}
resource "aws_internet_gateway" "vpc_prod-2-gw" {
    provider = aws.region-prod-2
    vpc_id = aws_vpc.vpc_prod-2.id

  tags = {
    Name = "vpc_prod-2-gw"
  }
}
