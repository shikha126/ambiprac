/*resource "aws_launch_template" "aws-template" {
  name_prefix   = "aws-template"
  image_id      = "${var.ami}"
  instance_type = "${var.instance-type}"
  
  tags = {
    Name = "${var.env1}-${var.project}-${var.web}-Autoscaling"
  }
  key_name = "ambi-keypair"
  monitoring {
    enabled = true
  }
    
  user_data = filebase64("${path.module}/userdata.sh")
}

resource "aws_autoscaling_group" "as-grp" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 5
  min_size           = 1
  health_check_grace_period = 30
  health_check_type         = "ELB"
  force_delete              = true
  

  launch_template {
    id      = aws_launch_template.aws-template.id
    version = "$Latest"
  }
    
}
resource "aws_autoscaling_policy" "as-policy" {
  name                   = "as-policy"
  scaling_adjustment     = 4
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 30
  autoscaling_group_name = aws_autoscaling_group.as-grp.name
}

resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.as-grp.id
  alb_target_group_arn = aws_lb_target_group.prod-web-alb-tg.arn
}

*/

