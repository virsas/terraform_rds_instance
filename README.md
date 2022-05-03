# terraform_rds_instance

Terraform module to create rds instance. This module is not helpful for creating clusters for aurora DB. For that, please see <https://https://github.com/virsas/terraform_rds_cluster>

## Dependencies

- Paramteres - <https://github.com/virsas/terraform_rds_parameters>
- Subnets - <https://github.com/virsas/terraform_rds_subnet>
- Security groups - <https://github.com/virsas/terraform_vpc_sg>

## Terraform example

``` terraform
###################
# RDS variable
###################
variable "rds_instance" { 
  default = { 
    name = "rds_instance"
    engine = "postgres"
    engine_version = "12.10 R1"
    # In GB
    allocated_storage = 10
    # gp2 or io1
    storage_type = "gp2"
    password = "dbpassword"
    username = "dbname"
    backup_period = "7"
    backup_window = "02:01-03:00"
    maintenance = true
    maintenance_window = "sun:03:01-sun:04:00"
    instance_size = "db.t3.small"
    public = true
    encrypted = true
    multi = false
  } 
}

###################
# RDS module
###################
module "rds_instance" {
  source            = "github.com/virsas/terraform_rds_instance"
  instance          = var.rds_instance
  security_groups   = [ module.vpc_sg_admin.id, module.vpc_sg_sql.id ]
  params            = module.rds_example_params.id
  subnet            = module.rds_exmaple_subnet.id
}
```
