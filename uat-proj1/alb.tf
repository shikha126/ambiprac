resource "aws_lb" "UAT-OCP-WEB-1" {
  name               = "UAT-OCP-WEB-1"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.aws_security_group_allow_HTTP_SSH_UAT.id]
  subnets            = aws_subnet.uat-public-subnets.*.id


  tags = {
    Environment = "${var.env}-${var.proj1}-ALB-WEB-1"
  }
}

resource "aws_lb_target_group" "UAT-OCP-WEB-TG" {
  name     = "UAT-OCP-WEB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.UAT-VPC1.id
}

resource "aws_lb_listener" "UAT-OCP-WEB-front_end" {
  load_balancer_arn = aws_lb.UAT-OCP-WEB-1.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.UAT-OCP-WEB-TG.arn
  }
}

resource "aws_lb_target_group_attachment" "UAT-OCP-WEB-TGA" {
    count = "${length(var.instance-name)}"
    target_group_arn = aws_lb_target_group.UAT-OCP-WEB-TG.arn
    target_id        = "${element(aws_instance.uat-ocp-web-1.*.id, count.index)}"
    port             = 80
}




























resource "aws_lb" "UAT-OCP-private-ALB-1" {
  name               = "UAT-OCP-private-ALB-1"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.aws_security_group_allow_HTTP_SSH_UAT.id]
  subnets            = aws_subnet.uat-private-subnets.*.id


  tags = {
    Environment = "${var.env}-${var.proj1}-Private-ALB-WEB-1"
  }
}

resource "aws_lb_target_group" "UAT-OCP-priv-WEB-TG" {
  name     = "UAT-OCP-priv-WEB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.UAT-VPC1.id
}

resource "aws_lb_listener" "UAT-OCP-priv-WEB-backend" {
  load_balancer_arn = aws_lb.UAT-OCP-private-ALB-1.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.UAT-OCP-priv-WEB-TG.arn
  }
}

resource "aws_lb_target_group_attachment" "UAT-OCP-priv-WEB-TG" {
    count = "${length(var.instance-name)}"
    target_group_arn = aws_lb_target_group.UAT-OCP-priv-WEB-TG.arn
    target_id        = "${element(aws_instance.uat-private-web.*.id, count.index)}"
    port             = 80
}
