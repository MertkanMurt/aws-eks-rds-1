module "management-vpc" {
  version = "v3.1.0"
  source  = "terraform-aws-modules/vpc/aws"

  name = "${var.cluster_name}-management"

  cidr            = var.management_vpc_cidr_range
  azs             = slice(data.aws_availability_zones.available.names, 0, var.management_vpc_subnet_count)
  public_subnets  = data.template_file.management_public_cidrsubnet.*.rendered
  private_subnets = data.template_file.management_private_cidrsubnet.*.rendered

  single_nat_gateway                = var.single_nat_gateway
  one_nat_gateway_per_az            = !var.single_nat_gateway
  propagate_public_route_tables_vgw = true
  enable_dns_hostnames              = true
  enable_dns_support                = true
  tags                              = local.tags
  public_subnet_tags = merge(
    "${local.tags}"
  )
}