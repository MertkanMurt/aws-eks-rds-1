############################################ S T A R T- I N P U T - P A R A M E T E R S ################################################
#####################
# Cluster Parameters#
#####################
region          = "us-west-2"
cluster_version = "1.20"
cluster_name    = "k8splayground"
tags            = { "Environment" = "k8splayground" }
node_groups = {
  playground-ng = {
    desired_capacity = 2
    max_capacity     = 10
    min_capacity     = 2
    instance_types   = ["t3.small"]
  }
}
#############################
# Application VPC Parameters#
#############################
application_vpc_subnet_count = "2"
application_vpc_cidr_range   = "10.10.0.0/16"
#############################
# Management VPC Parameters #
#############################
management_vpc_subnet_count = "2"
management_vpc_cidr_range   = "10.20.0.0/16"
##################
# RDS Parameters #
##################
mysql_name           = "k8splayground"
mysql_instance_class = "db.t3.large"
mysql_username       = "k8splayground"
mysql_password       = "YourPwdShouldBeLongAndSecure!"
########################################### E N D - I N P U T - P A R A M E T E R S ####################################################