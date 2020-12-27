resource "aws_security_group" "allow_HTTP-SSH-prod-1" {
  name        = "allow_allow_HTTP-SSH-prod-1"
  description = "Allow HTTP-SSH inbound traffic-prod-1"
  provider = aws.region-prod-1
  vpc_id      = aws_vpc.vpc_prod-1.id

  ingress {
    description = "HTTP from VPC-prod-1"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH from VPC-prod-1"
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
    Name = "allow_HTTP_SSH-prod-1"
  }
}

resource "aws_security_group" "allow_HTTP-SSH-prod-2" {
  name        = "allow_allow_HTTP-SSHprod-2"
  description = "Allow HTTP-SSH inbound trafficprod-2"
  provider = aws.region-prod-2
  vpc_id      = aws_vpc.vpc_prod-2.id

  ingress {
    description = "HTTP from VPCprod-2"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH from VPCprod-2"
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
    Name = "allow_HTTP_SSH-prod-2"
  }
}