variable "lb_arn" {
  type    = string
  default = ""
}

variable "lb_name" {
  type    = string
  default = ""
}


variable "is_internal"{
	type=bool

}
variable load_balancer_type{
  type    = string
}

variable security_groups{
  type    = string

}
variable subnets{
  type    = list(string)
}


variable tg_name{
  type    = string
}

variable instance1_id{
  type    = string
}

variable instance1{
  type    = string

}
variable instance2_id{
  type    = string
}

variable instance2{
  type    = string

}
