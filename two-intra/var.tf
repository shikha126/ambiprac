variable "region-prod-1" {
    default = "us-east-1"
  
}
variable "region-prod-2" {
    default = "us-west-2"
  
}
variable "vpc_prod-1-cidr" {
    default = "10.0.0.0/16"
  
}
variable "prod-worker-1-public-subnet-1" {
    default = "10.0.1.0/24"
  
}
variable "prod-worker-1-public-subnet-2" {
    default = "10.0.2.0/24"
  
}
variable "prod-worker-2-public-subnet-1" {
    default = "192.168.1.0/24"
  
}
variable "vpc_prod-2-cidr" {
    default = "192.168.0.0/16"
  
}
variable "env" {
    default = "prod"
  
}
variable "proj1" {
    default = "worker-1"
  
}
variable "proj2" {
    default = "worker-2"
  
}


