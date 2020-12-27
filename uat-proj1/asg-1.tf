resource "aws_launch_configuration" "UAT-WEB-ALC" {
  name_prefix = "aws_launch_configuration-OCP"

  image_id                    = "${var.ami}"
  instance_type               = "${var.instance-type}"
  security_groups             = ["${aws_security_group.aws_security_group_allow_HTTP_SSH_UAT.id}"]
  associate_public_ip_address = true
  key_name = "ambi-keypair"
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend I am ASG public EC2 launched from Autoscaling!!!! : $(hostname -f)" > /var/www/html/index.html
                EOF

  lifecycle {
    create_before_destroy = false
  }
}

resource "aws_autoscaling_group" "UAT-WEB-ASG1-new" {
  name = "AMBI-TF-NEW-_${aws_launch_configuration.UAT-WEB-ALC.name}"
  min_size             = 1
  max_size             = 1
  count = "${length(var.instance-name)}"
  target_group_arns = ["${aws_lb_target_group.UAT-OCP-WEB-TG.arn}"]
  
  vpc_zone_identifier             = "${aws_subnet.uat-public-subnets.*.id}"
  launch_configuration = "${aws_launch_configuration.UAT-WEB-ALC.name}"
  health_check_type    = "ELB"  
  
  default_cooldown = 10
  health_check_grace_period = 10
  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }
}

