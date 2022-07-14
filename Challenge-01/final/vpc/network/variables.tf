variable "vpc_cdir_block" {

    default = "172.16.0.0/24" 
}


variable "sec_gname"{
	type=string
}

variable "description"{
	type=string
}

variable "from_port"{
	type=string
}

variable "to_port"{
	type=string
}

variable "protocol"{
	type=string
}

variable "sec_tag_name"{
	type=string
}

variable "vpc_id"{
	type=string
}

variable "gateway_id"{
	type=string
}

variable "subnet_id"{
	type=string
}

variable "route_table_id"{
	type=string
}
variable "pub_snet_1" {
    default = "172.16.1.0/24" 
  
}
variable "pub_snet_2" {

    default = "172.16.2.0/24" 
  
}


variable "pvt_snet_1" {

    default = "172.16.3.0/24" 
  
}

variable "pvt_snet_2" {

    default = "172.16.4.0/24" 
  
}

variable "pvt_snet_3" {

    default = "172.16.5.0/24" 
  
}

variable "pvt_snet_4" {

    default = "172.16.6.0/24" 
  
}
variable "avail_zone_1" {

    default = "ap-south-1a"
  
}


variable "avail_zone_2" {

    default = "ap-south-1b"
  
}

variable "allowed_ip" {

    default = "0.0.0.0/0"
  
}


