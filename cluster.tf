// Configure AWS EKS Cluster

module "cluster" {
  version                                            = "~> v17.1.0"
  source                                             = "terraform-aws-modules/eks/aws"
  cluster_name                                       = var.cluster_name
  cluster_version                                    = var.cluster_version
  subnets                                            = module.application-vpc.private_subnets
  vpc_id                                             = module.application-vpc.vpc_id
  enable_irsa                                        = var.enable_irsa
  worker_create_security_group                       = true
  cluster_create_security_group                      = true
  worker_create_cluster_primary_security_group_rules = true


  node_groups                    = var.node_groups
  cluster_delete_timeout         = var.cluster_delete_timeout
  cluster_create_timeout         = var.cluster_create_timeout
  manage_aws_auth                = var.manage_aws_auth
  write_kubeconfig               = var.write_kubeconfig
  kubeconfig_output_path         = var.kubeconfig_output_path
  cluster_enabled_log_types      = ["api", "controllerManager", "scheduler", "audit", "authenticator"]
  cluster_endpoint_public_access = "true"
  tags                           = local.tags
}
