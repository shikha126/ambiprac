
/*
resource "aws_launch_configuration" "aws_launch_configuration-income" {
  name          = "aws_launch_configuration-income"
  image_id = "ami-0b898040803850657"
  instance_type = "${var.instance-type}"
  security_groups = ["${aws_security_group.aws_security_group_allow_HTTP_SSH_prod.id}"]
  associate_public_ip_address = "true"
  key_name = "ambi-keypair"

  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend--- public UAT test EC2 by ambi part-autoscaling !!!! : $(hostname -f)" > /var/www/html/index.html
                EOF

}

resource "aws_autoscaling_group" "new-group-ambi" {
    name                 = "new-group-ambi"
    launch_configuration = "${aws_launch_configuration.aws_launch_configuration-income.name}"
    min_size             = 1
    max_size             = 5
    health_check_grace_period = 5
    #health_check_type         = "ELB"
    #force_delete              = true  
    count = "${length(var.uat-public-subnet)}"
    vpc_zone_identifier       = ["${element(aws_subnet.uat-public-subnet.*.id, count.index)}"]
           
}


resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = "aws_autoscaling_group.new-group-ambi[0].id"
  alb_target_group_arn   = "aws_lb_target_group_attachment.prod-web-alb-tga[0].arn"
  depends_on = [aws_launch_configuration.aws_launch_configuration-income, aws_autoscaling_group.new-group-ambi]
}
*/