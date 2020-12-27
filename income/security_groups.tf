resource "aws_security_group" "aws_security_group_allow_HTTP_SSH_prod" {
  name        = "allow_HTTP_SSH_prod"
  description = "Allow HTTP-SSH inbound traffic"
  vpc_id      = aws_vpc.prod-income-vpc.id
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
    Name = "prod_http_ssh_traffic"
  }
}

resource "aws_security_group" "aws_security_group_allow_HTTP_SSH_uat" {
  name        = "allow_HTTP_SSH_uat"
  description = "Allow HTTP-SSH inbound traffic"
  vpc_id      = aws_vpc.uat-income-vpc.id
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
    Name = "uat_http_ssh_traffic"
  }
}