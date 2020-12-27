resource "aws_instance" "uat-ocp-web-1" {
  ami           = "${var.ami}"
  instance_type = "${var.instance-type}"
  count = "${length(var.instance-name)}"
  availability_zone = "${element(var.AZ, count.index)}"
  subnet_id = "${element(aws_subnet.uat-public-subnets.*.id, count.index)}"
  security_groups = ["${aws_security_group.aws_security_group_allow_HTTP_SSH_UAT.id}"]
  associate_public_ip_address = "true"
  
  tags = {
    Name = "${var.env}-${var.proj1}-Public-${element(var.instance-name, count.index)}"
  }
  key_name = "ambi-keypair"
  
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend--- public UAT  EC2 by ambi part !!!! : $(hostname -f)" > /var/www/html/index.html
                EOF

}


resource "aws_instance" "uat-private-web" {
  ami           = "${var.ami}"
  instance_type = "${var.instance-type}"
  count = "${length(var.instance-name)}"
  availability_zone = "${element(var.AZ, count.index)}"
  subnet_id = "${element(aws_subnet.uat-private-subnets.*.id, count.index)}"
  security_groups = ["${aws_security_group.aws_security_group_allow_HTTP_SSH_UAT.id}"]
  
  
  tags = {
    Name = "${var.env}-${var.proj1}-Private-${element(var.instance-name, count.index)}"
  }
  key_name = "ambi-keypair"
  
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend--- Private UAT  EC2 by ambi part !!!! : $(hostname -f)" > /var/www/html/index.html
                EOF

}