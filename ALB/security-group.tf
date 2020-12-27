resource "aws_security_group" "allow_SIT_PSI_Services" {
  name        = "allow_allow_SIT_PSI_Services"
  description = "Allow allow_SIT_PSI_Services inbound traffic"
  vpc_id      = aws_vpc.SIT-PSI-VPC.id

  ingress {
    description = "Traffic to VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Traffic to VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_SIT_PSI_Services"
  }
}
