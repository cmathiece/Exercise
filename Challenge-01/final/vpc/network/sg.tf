# need to create differnt security groups
# To allow access to DB server from APP servers
# To allow the access from nat to  App server which are in PVT subnets
# To connect(ssh) to the jump server which is public subnet

# To allow web access to  resources  which resides in the private subnet

# Security group for External Application Load Balancer
# App load balancer  forwrds the requests to Web servers


# receives traffic from client and forwards the request to webserver

#A security group is a set of firewall rules that control the traffic to your load balancer.

# receives the request from Load balancer

resource "aws_security_group" "sec_group" {
    
    name            = var.sec_gname
    description     = var.description
    vpc_id          = var.vpc_id 

    ingress {
        from_port   = var.from_port
        to_port     = var.to_port
        protocol    = var.protocol
        cidr_blocks = [var.allowed_ip]
    }

    egress {
        from_port   = "0"
        to_port     = "0"
        protocol    = "-1"
        cidr_blocks = [var.allowed_ip]

    }
    tags            = {
    	Name            = var.sec_tag_name
    }

}

output "output_sec_group" {
  value = aws_security_group.sec_group.id
}
