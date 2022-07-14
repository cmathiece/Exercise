variable "subnet_count" {
  type = number
}
variable "availability_zone"{
type=list(string)
default=["ap-south-1a","ap-south-1b","ap-south-1a","ap-south-1b","ap-south-1a"]
}

variable "vpc_id" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "newbits" {
  type = number
}

variable "netnum" {
  type = number
}



variable "routes" {
  type=list(map(string))
  default=[]

}

variable "nacl_rules" {
  type=map(map(string))
  default={}
}
