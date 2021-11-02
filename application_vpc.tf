module "application-vpc" {
  version = "v3.1.0"
  source  = "terraform-aws-modules/vpc/aws"

  name = "${var.cluster_name}-application"

  cidr           = var.application_vpc_cidr_range
  azs            = slice(data.aws_availability_zones.available.names, 0, var.application_vpc_subnet_count)
  public_subnets = data.template_file.public_cidrsubnet.*.rendered

  private_subnets       = data.template_file.private_cidrsubnet.*.rendered
  private_subnet_suffix = "app"

  database_subnets       = data.template_file.data_cidrsubnet.*.rendered
  database_subnet_suffix = "db"

  enable_nat_gateway                = true
  single_nat_gateway                = var.single_nat_gateway
  one_nat_gateway_per_az            = !var.single_nat_gateway
  propagate_public_route_tables_vgw = true
  enable_dns_hostnames              = true
  enable_dns_support                = true
  tags                              = local.tags
  create_database_subnet_group      = true

  private_subnet_tags = merge(
    "${local.tags}",
    tomap({
      "kubernetes.io/role/internal-elb"           = "1",
      "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    })
  )

  public_subnet_tags = merge(
    "${local.tags}",
    tomap({
      "kubernetes.io/role/elb"                    = "1",
      "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    })
  )
}
