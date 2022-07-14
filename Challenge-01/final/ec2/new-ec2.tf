

resource "aws_instance" "test_instance" {
    # Creates four identical aws ec2 instances
    count = var.instance_count    
    ami                         = var.amis
    instance_type               = var.instance_type
    subnet_id                   = var.subnet_id
    key_name                    = "key-for-ec2"

    vpc_security_group_ids      = var.sec_group_ids
                                  
    tags                        = {
    	#Name = join("-", [var.instance_name, count.index ])
    	Name = join("-", [var.instance_name, count.index])
    }

}

