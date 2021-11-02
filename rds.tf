module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> v4.2.0"
  name    = var.mysql_name
  vpc_id  = module.application-vpc.vpc_id
  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "MySQL access from within VPC"
      cidr_blocks = module.application-vpc.vpc_cidr_block
    },
  ]

  tags = local.tags
}
module "master" {
  source     = "terraform-aws-modules/rds/aws"
  version    = "~> v3.1.0"
  identifier = "${var.mysql_name}-master"

  engine               = var.mysql_engine
  engine_version       = var.mysql_engine_version
  family               = var.mysql_family
  major_engine_version = var.mysql_major_engine_version
  instance_class       = var.mysql_instance_class

  allocated_storage     = var.mysql_allocated_storage
  max_allocated_storage = var.mysql_max_allocated_storage
  storage_encrypted     = false

  name     = var.mysql_name
  username = var.mysql_username
  password = var.mysql_password
  port     = 3306

  multi_az               = true
  create_db_subnet_group = false
  db_subnet_group_name   = module.application-vpc.database_subnet_group_name
  subnet_ids             = module.application-vpc.database_subnets
  vpc_security_group_ids = [module.security_group.security_group_id]

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["audit", "error", "slowquery"]

  backup_retention_period = 1
  skip_final_snapshot     = true
  deletion_protection     = false

  tags = local.tags
}

module "replica" {
  source               = "terraform-aws-modules/rds/aws"
  version              = "~> v3.1.0"
  identifier           = "${var.mysql_name}-replica"
  replicate_source_db  = module.master.db_instance_id
  engine               = var.mysql_engine
  engine_version       = var.mysql_engine_version
  family               = var.mysql_family
  major_engine_version = var.mysql_major_engine_version
  instance_class       = var.mysql_instance_class

  allocated_storage     = var.mysql_allocated_storage
  max_allocated_storage = var.mysql_max_allocated_storage
  storage_encrypted     = false

  username = null
  password = null
  port     = 3306

  multi_az               = false
  subnet_ids             = module.application-vpc.database_subnets
  vpc_security_group_ids = [module.security_group.security_group_id]

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["audit", "error", "slowquery"]

  backup_retention_period = 0
  skip_final_snapshot     = true
  deletion_protection     = false
  create_db_subnet_group  = false
  tags                    = local.tags
}
