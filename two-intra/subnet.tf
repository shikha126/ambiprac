resource "aws_subnet" "prod-1-public-subnet-1" {
  vpc_id     = aws_vpc.vpc_prod-1.id
  cidr_block = "${var.prod-worker-1-public-subnet-1}"
  provider = aws.region-prod-1

  tags = {
    Name = "${var.env}-${var.proj1}-public-subnet-1"
  }
}

resource "aws_subnet" "prod-1-public-subnet-2" {
  vpc_id     = aws_vpc.vpc_prod-1.id
  cidr_block = "${var.prod-worker-1-public-subnet-2}"
  provider = aws.region-prod-1

  tags = {
    Name = "${var.env}-${var.proj1}-public-subnet-2"
  }
}





resource "aws_subnet" "prod-2-public-subnet-1" {
  vpc_id     = aws_vpc.vpc_prod-2.id
  cidr_block = "${var.prod-worker-2-public-subnet-1}"
  provider = aws.region-prod-2

  tags = {
    Name = "${var.env}-${var.proj2}-public-subnet-1"
  }
}