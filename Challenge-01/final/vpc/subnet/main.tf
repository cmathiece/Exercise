

resource "aws_subnet" "subnet" {
  count                   = var.subnet_count
  vpc_id                  = var.vpc_id
  cidr_block              = cidrsubnet(var.vpc_cidr, var.newbits, var.netnum + count.index)
  map_public_ip_on_launch = false
  #availability_zone       = random_shuffle.public_az.result[count.index]
  #availability_zone       = availability_zone[count.index]
  availability_zone       = var.availability_zone[count.index]

  tags = {
    Name = join("_", [var.vpc_name, var.subnet_name, count.index + 1])
  }
}


output "out_subnet_list"{

	value=aws_subnet.subnet
}
