variable "region" {}
variable "cluster_version" {
  default = "1.20"
}
variable "tags" {
  type = map(string)
  default = {
  }
}
variable "cluster_name" {
  type    = string
  default = "k8splayground"
}
variable "node_groups" {}
variable "cluster_create_timeout" {
  type    = string
  default = "60m"
}
variable "cluster_delete_timeout" {
  type    = string
  default = "60m"
}
variable "manage_aws_auth" {
  type    = string
  default = "true"
}
variable "write_kubeconfig" {
  type    = string
  default = "true"
}
variable "kubeconfig_output_path" {
  type    = string
  default = "./"
}
variable "enable_irsa" {
  type    = bool
  default = true
}
variable "application_vpc_cidr_range" {
  type    = string
  default = "10.10.0.0/16"
}
variable "application_vpc_subnet_count" {
  default = "2"
}
variable "management_vpc_cidr_range" {
  type    = string
  default = "10.20.0.0/16"
}
variable "management_vpc_subnet_count" {
  default = "2"
}
variable "single_nat_gateway" {
  type    = bool
  default = true
}
variable "mysql_engine" {
  type    = string
  default = "mysql"
}
variable "mysql_engine_version" {
  type    = string
  default = "8.0.20"
}
variable "mysql_family" {
  type    = string
  default = "mysql8.0"
}
variable "mysql_major_engine_version" {
  type    = string
  default = "8.0"
}
variable "mysql_instance_class" {
  type    = string
  default = "db.t3.large"
}
variable "mysql_allocated_storage" {
  type    = number
  default = 20
}
variable "mysql_max_allocated_storage" {
  type    = number
  default = 100
}
variable "mysql_name" {
  type    = string
  default = "k8splayground"
}
variable "mysql_username" {
  type    = string
  default = "k8splayground"
}
variable "mysql_password" {
  type    = string
  default = "YourPwdShouldBeLongAndSecure!"
}
variable "install_2048_game" {
  type        = bool
  default     = true
  description = "Install game-2048 (1 - yes ; 0 - no)"
}
variable "iam_alb_role_name" {
  default     = "aws-load-balancer-controller"
  description = "The name for aws load balancer controller"
}