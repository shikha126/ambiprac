variable "env" {
    default = "PROD"
}

variable  "instance-type" {
    default = "t2.micro"
}

variable  "ami" {
    default = "ami-0b898040803850657"
}

variable "project" {
    default = "OCP"
}

variable "public-subnet" {
    type = "list"
}

variable "private-subnet" {
    type = "list"
}

variable "private-subnet-name" {
    type = "list"
}

variable "public-subnet-name" {
    type = "list"
}

variable  "instance-list-name" {
    type = "list"
}

variable  "avail-zone" {
    type = "list"
}
    

