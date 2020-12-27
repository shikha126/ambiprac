resource "aws_instance" "prod-web-1" {
  ami           = "${var.ami}"
  instance_type = "${var.instance-type}"
  count = "${length(var.instance-name)}"
  availability_zone = "${element(var.avail-zone, count.index)}"
  subnet_id = "${element(aws_subnet.prod-private-subnet.*.id, count.index)}"
  security_groups = ["${aws_security_group.aws_security_group_allow_HTTP_SSH_prod.id}"]
  associate_public_ip_address = "true"
  
  tags = {
    Name = "${var.env1}-${var.project}-${var.web}-${element(var.instance-name, count.index)}"
  }
  key_name = "ambi-keypair"
  
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend--- public prod  EC2 by ambi part !!!! : $(hostname -f)" > /var/www/html/index.html
                EOF

}

resource "aws_instance" "uat-web-1" {
  ami           = "${var.ami}"
  instance_type = "${var.instance-type}"
  count = "${length(var.instance-name)}"
  availability_zone = "${element(var.avail-zone, count.index)}"
  subnet_id = "${element(aws_subnet.uat-private-subnet.*.id, count.index)}"
  security_groups = ["${aws_security_group.aws_security_group_allow_HTTP_SSH_uat.id}"]
  associate_public_ip_address = "true"
  
  tags = {
    Name = "${var.env2}-${var.project}-${var.web}-${element(var.instance-name, count.index)}"
  }
  key_name = "ambi-keypair"
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend--- public uat EC2 by ambi part !!!! : $(hostname -f)" > /var/www/html/index.html
                EOF
}
 