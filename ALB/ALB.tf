
resource "aws_lb" "PSI-ALB-1" {
  name               = "PSI-ALB-1"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.allow_SIT_PSI_Services.id}"]
  subnets            = ["${aws_subnet.SIT-PSI-Public-SUBNET-1.id}", "${aws_subnet.SIT-PSI-Public-SUBNET-2.id}"]

  enable_deletion_protection = true

  tags = {
    Environment = "SIT"
  }
}

resource "aws_lb_target_group" "PSI-ALB-TG" {
  name     = "PSI-ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.SIT-PSI-VPC.id
}


resource "aws_lb_listener" "PSI-ALB-1-LST" {
  load_balancer_arn = "${aws_lb.PSI-ALB-1.arn}"
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.PSI-ALB-TG.arn
  }
}

resource "aws_lb_target_group_attachment" "PSI-ALB-1-TGAT" {
  target_group_arn = "${aws_lb_target_group.PSI-ALB-TG.arn}"
  target_id        = "${aws_instance.Public-EC2-FE-1.id}"
  port             = 80
  depends_on = ["aws_eip.SIT-EIP-NATGW-IP", "aws_vpc.SIT-PSI-VPC", "aws_instance.Public-EC2-FE-1", "aws_lb_listener.PSI-ALB-1-LST", "aws_lb_target_group.PSI-ALB-TG", "aws_lb.PSI-ALB-1"]
}

