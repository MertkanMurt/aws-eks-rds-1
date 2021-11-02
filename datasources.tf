data "aws_availability_zones" "available" {}
data "template_file" "management_public_cidrsubnet" {
  count    = var.management_vpc_subnet_count
  template = "$${cidrsubnet(vpc_cidr,newbits,current_count)}"
  vars = {
    vpc_cidr      = "${var.management_vpc_cidr_range}"
    current_count = "${count.index * 3}"
    newbits       = "${local.newbits_per_subnet}"
  }
}
data "template_file" "management_private_cidrsubnet" {
  count    = var.management_vpc_subnet_count
  template = "$${cidrsubnet(vpc_cidr,newbits,current_count)}"
  vars = {
    vpc_cidr      = "${var.management_vpc_cidr_range}"
    current_count = "${count.index * 3 + 1}"
    newbits       = "${local.newbits_per_subnet}"
  }
}
data "template_file" "public_cidrsubnet" {
  count    = var.application_vpc_subnet_count
  template = "$${cidrsubnet(vpc_cidr,newbits,current_count)}"
  vars = {
    vpc_cidr      = "${var.application_vpc_cidr_range}"
    current_count = "${count.index * 3}"
    newbits       = "${local.newbits_per_subnet}"
  }
}
data "template_file" "private_cidrsubnet" {
  count    = var.application_vpc_subnet_count
  template = "$${cidrsubnet(vpc_cidr,newbits,current_count)}"
  vars = {
    vpc_cidr      = "${var.application_vpc_cidr_range}"
    current_count = "${count.index * 3 + 1}"
    newbits       = "${local.newbits_per_subnet}"
  }
}
data "template_file" "data_cidrsubnet" {
  count    = var.application_vpc_subnet_count
  template = "$${cidrsubnet(vpc_cidr,newbits,current_count)}"
  vars = {
    vpc_cidr      = "${var.application_vpc_cidr_range}"
    current_count = "${count.index * 3 + 2}"
    newbits       = "${local.newbits_per_subnet}"
  }
}
