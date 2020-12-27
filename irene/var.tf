variable "vpc_cidr" {
    default = "10.0.0.0/16"
}
variable "env" {
    default = "SIT"
}
variable "project" {
    default = "irene"
}

variable "AZ" {
    type = "list"
}

variable "irene-public-subnet" {
    type = "list"
}
variable "irene-private-subnet" {
    type = "list"
}
variable "irene-public-subnet-names" {
    type = "list"

}
variable "irene-private-subnet-names" {
    type = "list"

}