/*
resource "aws_launch_template" "foobar" {
  name_prefix   = "foobar"
  image_id      = "${var.ami}"
  instance_type = "${var.instance-type}"
  tags = {
    Name = "${var.env2}-${var.project}-${var.web}-Autoscaling"
  }
  key_name = "ambi-keypair"
  monitoring {
    enabled = true
  }
  user_data = filebase64("${path.module}/userdata.sh")
}

resource "aws_autoscaling_group" "bar" {
    name                 = "abcd"
    min_size             = 1
    max_size             = 5
    health_check_grace_period = 5
    health_check_type         = "ELB"
      
    count = "${length(var.prod-public-subnet)}"
    vpc_zone_identifier       = ["${element(aws_subnet.uat-public-subnet.*.id, count.index)}"]
           

  launch_template {
    id      = aws_launch_template.foobar.id
    
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = "${aws_autoscaling_group.bar.id}"
  alb_target_group_arn   = "${aws_lb_target_group.uat-web-alb-tg.arn}"
}
*/