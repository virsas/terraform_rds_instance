provider "aws" {
  region = var.region
}

resource "aws_db_instance" "db" {
  allocated_storage      = var.instance.volume_size
  storage_type           = var.instance.volume_type
  engine                 = var.instance.engine_type
  engine_version         = var.instance.engine_version
  instance_class         = var.instance.instance_size
  name                   = var.instance.name
  identifier             = var.instance.name
  username               = var.instance.username
  password               = var.instance.password
  multi_az               = var.instance.multi 
  storage_encrypted      = var.instance.encrypted
  vpc_security_group_ids = var.security_groups
  db_subnet_group_name   = var.subnet
  parameter_group_name   = var.params
  backup_retention_period = var.instance.backup_period
  backup_window          = var.instance.backup_window
  auto_minor_version_upgrade = var.instance.maintenance
  maintenance_window     = var.instance.maintenance_window
  publicly_accessible    = var.instance.public
}
