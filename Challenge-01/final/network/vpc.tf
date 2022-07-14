
# create a vpc 
resource "aws_vpc" "vpc_mathi" {
    cidr_block = var.vpc_cdir_block
    enable_dns_hostnames = true
    enable_dns_support   = true
    tags = {
        Name = "Mathi Demo VPC" 
    }
  
}
output "output_vpc_id" {
  value = aws_vpc.vpc_mathi.id
}


# create a public subnet for web server-1
resource "aws_subnet" "web_pub_subnet_1" {
    
    vpc_id            = aws_vpc.vpc_mathi.id
    cidr_block        = var.pub_snet_1
    availability_zone = var.avail_zone_1

    tags              = {
    Name              = "Public Web Subnet-1"
    }
  
}

output "out_pub_subnet_1" {
  value = aws_subnet.pub_subnet_1.id
}


# create a public subnet for web server-2
resource "aws_subnet" "web_pub_subnet_2" {
    
    vpc_id            = aws_vpc.vpc_mathi.id
    cidr_block        = var.pub_snet_2
    availability_zone = var.avail_zone_2

    tags              = {
    Name              = "Public Web  Subnet-2"
    }
  
}

output "out_pub_subnet_2" {
  value = aws_subnet.web_pub_subnet_2.id
}


# Create Private Subnet for  Application server 1
resource "aws_subnet" "app_pvt_subnet_1" {
    
    vpc_id            = aws_vpc.vpc_mathi.id
    cidr_block        = var.pvt_snet_1
    availability_zone = var.avail_zone_1
    map_public_ip_on_launch = false

    tags              = {
    Name              = "Private App Subnet-1"
    }
  
}

output "out_prv_subnet_1" {
  value = aws_subnet.app_pvt_subnet_1.id
}

# Create Private Subnet for  Application server 2
resource "aws_subnet" "app_pvt_subnet_2" {
    
    vpc_id            = aws_vpc.vpc_mathi.id
    cidr_block        = var.pvt_snet_2
    availability_zone = var.avail_zone_2

    tags              = {
    Name              = "Private App  Subnet-2"
    }
  
}

output "out_prv_subnet_2" {
  value = aws_subnet.app_pvt_subnet_2.id

}


# Create Private Subnet for  Database  server 1
resource "aws_subnet" "db_pvt_subnet_1" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.pvt_snet_3
  availability_zone = var.avail_zone_1
  tags = { 
    Name = "Demo Database subnet_1"
  }
}
output "out_db_pvt_subnet_1" {
  value = aws_subnet.db_pvt_subnet_2.id

}

# Create Private Subnet for  Database  server 2
resource "aws_subnet" "db_pvt_subnet_2" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.pvt_snet_4
  availability_zone = var.avail_zone_2
  tags = { 
    Name = "Demo Database subnet_2"
  }
}
output "out_db_pvt_subnet_2" {
  value = aws_subnet.db_pvt_subnet_2.id

}

#Resource: aws_db_subnet_group Provides an RDS DB subnet group resource.

resource "aws_db_subnet_group" "defaultgroup" {
    
    name             = "mathi_db_subnet_group"
    # we need to provide front end and back end ids
    subnet_ids       = [aws_subnet.db_pvt_subnet_1.id, aws_subnet.db_pvt_subnet_2.id]

    tags             = {

    name             = "Mathi DB  SubnetGroup"
    }
  
}

output "out_rdssubnetgroup" {
  value = aws_db_subnet_group.defaultgroup.id
}



#-----------------------------------------------
