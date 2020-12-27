resource "aws_instance" "Public-EC2-FE-1" {
  ami           = "${var.AMI}"
  instance_type = "${var.t2micro}"
  subnet_id = "${aws_subnet.SIT-PSI-Public-SUBNET-1.id}"
  availability_zone = "${var.AZ1}"
  security_groups = ["${aws_security_group.allow_SIT_PSI_Services.id}"]
  tags = {
    Name = "Public-EC2-FE-1"
  }
  key_name = "ambi-keypair"
  associate_public_ip_address = "true"
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend I am public EC2 by ambi part-1!!!! : $(hostname -f)" > /var/www/html/index.html
                EOF
}

resource "aws_instance" "Public-EC2-FE-2" {
  ami           = "${var.AMI}"
  instance_type = "${var.t2micro}"
  subnet_id = "${aws_subnet.SIT-PSI-Public-SUBNET-2.id}"
  availability_zone = "${var.AZ2}"
  #vpc_security_group_ids = 
  security_groups = ["${aws_security_group.allow_SIT_PSI_Services.id}"]
  tags = {
    Name = "Public-EC2-FE-2"
  }
  key_name = "ambi-keypair"
  associate_public_ip_address = "true"
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend I am public EC2 by ambi part-2!!!! : $(hostname -f)" > /var/www/html/index.html
                EOF
}



resource "aws_instance" "private-EC2-BE-1" {
  ami           = "${var.AMI}"
  instance_type = "${var.t2micro}"
  subnet_id = "${aws_subnet.SIT-PSI-Private-SUBNET-1.id}"
  availability_zone = "${var.AZ1}"
  tags = {
    Name = "Private-EC2-BE-1"
  }
  key_name = "ambi-keypair"
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend I am public EC2 by ambi part-1!!!! : $(hostname -f)" > /var/www/html/index.html
                EOF
}


resource "aws_instance" "private-EC2-BE-2" {
  ami           = "${var.AMI}"
  instance_type = "${var.t2micro}"
  subnet_id = "${aws_subnet.SIT-PSI-Private-SUBNET-2.id}"
  availability_zone = "${var.AZ2}"
  tags = {
    Name = "Private-EC2-BE-2"
  }
  key_name = "ambi-keypair"
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend I am public EC2 by ambi part-2!!!! : $(hostname -f)" > /var/www/html/index.html
                EOF
}