resource "aws_lb" "prod-ocp-alb" {
  name               = "prod-ocp-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_HTTP-SSH.id]
  subnets            = aws_subnet.public-subnet.*.id

  enable_deletion_protection = true

  tags = {
    Environment = "${var.env}-${var.project}-alb"
  }
}

resource "aws_lb_target_group" "ocp-lb-tg" {
  name     = "ocp-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.prod-ocp-vpc.id
}

resource "aws_lb_target_group_attachment" "ocp-lb-tga" {
  count = "${length(var.instance-list-name)}"
  target_group_arn = aws_lb_target_group.ocp-lb-tg.arn
  target_id        = "${element(aws_instance.public-instance.*.id, count.index)}"
  port             = 80
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.prod-ocp-alb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ocp-lb-tg.arn
  }
}
