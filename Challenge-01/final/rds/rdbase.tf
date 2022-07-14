resource "aws_db_instance" "rds_mysql" {

    allocated_storage               = var.allocated_storage
    engine                          = var.engine
    engine_version                  = var.engine_version
    instance_class       	    = var.instance_class
    name                            = var.name
    username                        = var.username
    storage_type                    = var.storage_type
    password                        = var.password
    multi_az                        = var.multi_az
    port                            = var.port
    db_subnet_group_name            = var.out_rds_sgroup
    vpc_security_group_ids          = var.sec_group_ids
    tags                            = {
            name                    = "Test MySQL"
    }

  
}
