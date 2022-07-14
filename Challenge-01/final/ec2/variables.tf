# EC2 Instances
variable "amis" {
    
    default = "ami-0c6b1d09930fac512"
    # RHEL ami: ami-098bb5d92c8886ca1 
}


variable "instance_type"{
    default = "t2.nano"
    type =  string
}

variable "instance_name"{
    type =  string

}

variable "instance_count"{
	type=number
}
variable "sec_group_ids"{
    type =  list(string)
    default = ["default"]
}
variable "subnet_id"{

    type =  string
}

variable "key_name"{

    type =  string
}
