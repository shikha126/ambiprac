resource "aws_instance" "public-instance" {
  ami           = "${var.ami}"
  instance_type = "${var.instance-type}"
  count = "${length(var.instance-list-name)}"
  availability_zone = "${element(var.avail-zone, count.index)}"
  subnet_id = "${element(aws_subnet.public-subnet.*.id, count.index)}"
  security_groups = ["${aws_security_group.allow_HTTP-SSH.id}"]

  tags = {
    Name = "${var.env}-${var.project}-public-${element(var.instance-list-name, count.index)}"
  }

  key_name = "ambi-keypair"
  associate_public_ip_address = "true"
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend--- public EC2 by ambi part !!!! : $(hostname -f)" > /var/www/html/index.html
                EOF

}

resource "aws_instance" "private-instance" {
  ami           = "${var.ami}"
  instance_type = "${var.instance-type}"
  count = "${length(var.instance-list-name)}"
  availability_zone = "${element(var.avail-zone, count.index)}"
  subnet_id = "${element(aws_subnet.private-subnet.*.id, count.index)}"
  security_groups = ["${aws_security_group.allow_HTTP-SSH.id}"]

  tags = {
    Name = "${var.env}-${var.project}-private-${element(var.instance-list-name, count.index)}"
  }

  key_name = "ambi-keypair"
  associate_public_ip_address = "true"
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend--- private EC2 by ambi part !!!! : $(hostname -f)" > /var/www/html/index.html
                EOF

}