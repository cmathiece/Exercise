
# Create Internet Gateway to access the internet

resource "aws_internet_gateway" "demoigw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Demo IntertGateWay"
  }
}

# Create Web layer route table which routes the request to internet gateway  

resource "aws_route_table" "demo_web_rt" {
  vpc_id = var.vpc_id 


  route {
    cidr_block = var.allowed_ip
    gateway_id = var.gateway_id  
  }

  tags = {
    Name = "Demo WebRouteTable"
  }
}

output "out_demo_web_rt"{

   value=aws_route_table.demo_web_rt
}

# Associate the subent with the route table

resource "aws_route_table_association" "sub_route" {
  subnet_id      = var.subnet_id
  route_table_id = var.route_table_id
}


# all private subnets uses default route table
