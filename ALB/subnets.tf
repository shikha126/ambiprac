resource "aws_subnet" "SIT-PSI-Private-SUBNET-1" {
  vpc_id     = "${aws_vpc.SIT-PSI-VPC.id}"
  cidr_block = "${var.Private-SUBNET-1}"
  availability_zone = "${var.AZ1}"
  tags = {
    Name = "${var.env}-${var.project}-Private-SUBNET-1"
  }
}
resource "aws_subnet" "SIT-PSI-Private-SUBNET-2" {
  vpc_id     = "${aws_vpc.SIT-PSI-VPC.id}"
  cidr_block = "${var.Private-SUBNET-2}"
  availability_zone = "${var.AZ2}"
  tags = {
    Name = "${var.env}-${var.project}-Private-SUBNET-2"
  }
}


resource "aws_subnet" "SIT-PSI-Public-SUBNET-1" {
  vpc_id     = "${aws_vpc.SIT-PSI-VPC.id}"
  cidr_block = "${var.Public-SUBNET-1}"
  availability_zone = "${var.AZ1}"
  tags = {
    Name = "${var.env}-${var.project}-Public-SUBNET-1"
  }
}
resource "aws_subnet" "SIT-PSI-Public-SUBNET-2" {
  vpc_id     = "${aws_vpc.SIT-PSI-VPC.id}"
  cidr_block = "${var.Public-SUBNET-2}"
  availability_zone = "${var.AZ2}"
  tags = {
    Name = "${var.env}-${var.project}-Public-SUBNET-2"
  }
}