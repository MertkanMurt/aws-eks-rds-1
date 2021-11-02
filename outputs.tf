output "kubeconfig" {
  value = module.cluster.kubeconfig
}
output "kubeconfig_filename" {
  value = "./kubeconfig_${var.cluster_name}"
}
output "cluster_internal_endpoint" {
  value = module.cluster.cluster_endpoint
}
output "cluster_iam_role_arn" {
  value = module.cluster.cluster_iam_role_arn
}
output "cluster_iam_role_name" {
  value = module.cluster.cluster_iam_role_name
}
output "cluster_id" {
  value = module.cluster.cluster_id
}
output "cluster_security_group_id" {
  value = module.cluster.cluster_security_group_id
}
output "cluster_version" {
  value = module.cluster.cluster_version
}
output "config_map_aws_auth" {
  value = module.cluster.config_map_aws_auth
}
output "worker_iam_role_arn" {
  value = module.cluster.worker_iam_role_arn
}
output "worker_iam_role_name" {
  value = module.cluster.worker_iam_role_name
}
output "node_groups" {
  value = var.node_groups
}
output "azs" {
  value = module.application-vpc.azs
}
output "default_vpc_id" {
  value = module.application-vpc.default_vpc_id
}
output "vpc_id" {
  value = module.application-vpc.vpc_id
}
output "vpc_instance_tenancy" {
  value = module.application-vpc.vpc_instance_tenancy
}
output "vpc_main_route_table_id" {
  value = module.application-vpc.vpc_main_route_table_id
}
output "igw_id" {
  value = module.application-vpc.igw_id
}
output "service_subnets" {
  value = module.application-vpc.private_subnets
}
output "vpc_cidr_block" {
  value = module.application-vpc.vpc_cidr_block
}
output "service_subnets_cidr_blocks" {
  value = module.application-vpc.private_subnets_cidr_blocks
}
output "service_route_table_ids" {
  value = module.application-vpc.private_route_table_ids
}
output "public_subnets" {
  value = module.application-vpc.public_subnets
}
output "public_route_table_ids" {
  value = module.application-vpc.public_route_table_ids
}
output "backend_subnets" {
  value = module.application-vpc.database_subnets
}
output "master_db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.master.db_instance_address
}

output "master_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.master.db_instance_arn
}
output "master_db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.master.db_instance_availability_zone
}
output "master_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.master.db_instance_endpoint
}
output "master_db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = module.master.db_instance_hosted_zone_id
}
output "master_db_instance_id" {
  description = "The RDS instance ID"
  value       = module.master.db_instance_id
}
output "master_db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = module.master.db_instance_resource_id
}
output "master_db_instance_status" {
  description = "The RDS instance status"
  value       = module.master.db_instance_status
}
output "master_db_instance_name" {
  description = "The database name"
  value       = module.master.db_instance_name
}
output "master_db_instance_username" {
  description = "The master username for the database"
  value       = module.master.db_instance_username
  sensitive   = true
}
output "master_db_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = module.master.db_instance_password
  sensitive   = true
}
output "master_db_instance_port" {
  description = "The database port"
  value       = module.master.db_instance_port
}
output "master_db_subnet_group_id" {
  description = "The db subnet group name"
  value       = module.master.db_subnet_group_id
}
output "master_db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = module.master.db_subnet_group_arn
}
output "replica_db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.replica.db_instance_address
}
output "replica_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.replica.db_instance_arn
}
output "replica_db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.replica.db_instance_availability_zone
}
output "replica_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.replica.db_instance_endpoint
}
output "replica_db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = module.replica.db_instance_hosted_zone_id
}
output "replica_db_instance_id" {
  description = "The RDS instance ID"
  value       = module.replica.db_instance_id
}
output "replica_db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = module.replica.db_instance_resource_id
}
output "replica_db_instance_status" {
  description = "The RDS instance status"
  value       = module.replica.db_instance_status
}
output "replica_db_instance_name" {
  description = "The database name"
  value       = module.replica.db_instance_name
}
output "replica_db_instance_username" {
  description = "The replica username for the database"
  value       = module.replica.db_instance_username
  sensitive   = true
}
output "replica_db_instance_port" {
  description = "The database port"
  value       = module.replica.db_instance_port
}
