variable proj1 {
  type        = string
  default     = "OCP"
}
variable env {
  type        = string
  default     = "UAT"
}
variable cidr_block {
  type        = string
  default     = "172.32.0.0/16"
  description = "cidr_block"
}

variable uat-public-subnets {
  type        = "list"
}
variable public-subnets-names {
  type        = "list"
}

variable AZ {
  type        = "list"
}
variable uat-private-subnets {
  type        = "list"
}
variable private-subnets-names {
  type        = "list"
}
variable ami {
  type        = string
  default     = "ami-0b898040803850657"
}
variable instance-type  {
  type        = string
  default     = "t2.micro"
}
variable instance-name  {
  type        = "list"
  
}


