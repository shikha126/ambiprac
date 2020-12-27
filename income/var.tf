variable "env1" {
    default = "prod"
}
variable "env2" {
    default = "dev"
}
variable "web" {
    default = "web"
}
variable "project" {
    default = "income"
}
variable "avail-zone" {
    type = "list"
}
variable "full-cidr" {
    default = "192.168.0.0/16"
}
variable "prod-private-subnet" {
    type = "list"
}
variable "prod-public-subnet" {
    type = "list"
}
variable "income-private-subnet-name" {
    type = "list"
}
variable "income-public-subnet-name" {
    type = "list"
}
variable  "instance-type" {
    default = "t2.micro"
}

variable  "ami" {
    default = "ami-0b898040803850657"
}

variable "uat-private-subnet" {
    type = "list"
}
variable "uat-public-subnet" {
    type = "list"
}

variable "instance-name" {
    type = "list"
}