resource "aws_lb" "prod-web-alb" {
  name               = "prod-web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.aws_security_group_allow_HTTP_SSH_prod.id]
  subnets            = aws_subnet.prod-public-subnet.*.id

  enable_deletion_protection = false
  tags = {
    Name = "${var.env1}-${var.project}-${var.web}-alb"
  }
}
resource "aws_lb_target_group" "prod-web-alb-tg" {
  name     = "prod-web-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.prod-income-vpc.id
}
resource "aws_lb_target_group_attachment" "prod-web-alb-tga" {
  target_group_arn = aws_lb_target_group.prod-web-alb-tg.arn
  count = "${length(var.instance-name)}"
  target_id        = "${element(aws_instance.prod-web-1.*.id, count.index)}"
  port             = 80
}
resource "aws_lb_listener" "prod-listener-1" {
  load_balancer_arn = aws_lb.prod-web-alb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.prod-web-alb-tg.arn
  }
}


resource "aws_lb" "uat-web-alb" {
  name               = "uat-web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.aws_security_group_allow_HTTP_SSH_uat.id]
  subnets            = aws_subnet.uat-public-subnet.*.id

  enable_deletion_protection = false
  tags = {
    Name = "${var.env2}-${var.project}-${var.web}-alb"
  }
}
resource "aws_lb_target_group" "uat-web-alb-tg" {
  name     = "uat-web-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.uat-income-vpc.id
}
resource "aws_lb_target_group_attachment" "uat-web-alb-tga" {
  target_group_arn = aws_lb_target_group.uat-web-alb-tg.arn
  count = "${length(var.instance-name)}"
  target_id        = "${element(aws_instance.uat-web-1.*.id, count.index)}"
  port             = 80
}
resource "aws_lb_listener" "uat-listener-1" {
  load_balancer_arn = aws_lb.uat-web-alb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.uat-web-alb-tg.arn
  }
}

