resource "aws_subnet" "uat-public-subnets" {
    count = "${length(var.uat-public-subnets)}"
    vpc_id     = aws_vpc.UAT-VPC1.id
    cidr_block = "${element(var.uat-public-subnets, count.index)}"
    availability_zone = "${element(var.AZ, count.index)}"
    map_public_ip_on_launch = "true"
    

  tags = {
    Name = "${var.env}-${var.proj1}-${element(var.public-subnets-names, count.index)}"
  }
}

resource "aws_subnet" "uat-private-subnets" {
    count = "${length(var.uat-private-subnets)}"
    vpc_id     = aws_vpc.UAT-VPC1.id
    cidr_block = "${element(var.uat-private-subnets, count.index)}"
    availability_zone = "${element(var.AZ, count.index)}"
    
    

  tags = {
    Name = "${var.env}-${var.proj1}-${element(var.private-subnets-names, count.index)}"
  }
}

