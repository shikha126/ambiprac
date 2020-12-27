variable "vpc_cidr" {
    default = "10.0.0.0/16"
}
variable "env" {
    default = "SIT"
}
variable "project" {
    default = "PSI"
}

variable "Public-SUBNET-1" {
    default = "10.0.0.0/24"
}
variable "Public-SUBNET-2" {
    default = "10.0.1.0/24"
}
variable "AZ1" {
    default = "us-east-1a"
}
variable "Private-SUBNET-1" {
    default = "10.0.2.0/24"
}
variable "Private-SUBNET-2" {
    default = "10.0.3.0/24"
}

variable "AZ2" {
    default = "us-east-1b"
}

variable "AMI" {
    default = "ami-0b898040803850657"
}
variable "t2micro" {
    default = "t2.micro"
}

