resource "aws_security_group" "aws_security_group_allow_HTTP_SSH_UAT" {
  name        = "allow_HTTP_SSH_prod"
  description = "Allow HTTP-SSH inbound traffic"
  vpc_id      = aws_vpc.UAT-VPC1.id
  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH from VPC"
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
    Name = "UAT_http_ssh_traffic"
  }
}

