# aws-eks-rds
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.45.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.7.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.3.2 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 1.4 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.1.0 |
| <a name="requirement_template"></a> [template](#requirement\_template) | >= 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.46.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.2.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 2.4.1 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.11.1 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_application-vpc"></a> [application-vpc](#module\_application-vpc) | terraform-aws-modules/vpc/aws | v3.1.0 |
| <a name="module_cluster"></a> [cluster](#module\_cluster) | terraform-aws-modules/eks/aws | ~> v17.1.0 |
| <a name="module_iam_assumable_role_admin"></a> [iam\_assumable\_role\_admin](#module\_iam\_assumable\_role\_admin) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | n/a |
| <a name="module_management-vpc"></a> [management-vpc](#module\_management-vpc) | terraform-aws-modules/vpc/aws | v3.1.0 |
| <a name="module_master"></a> [master](#module\_master) | terraform-aws-modules/rds/aws | ~> v3.1.0 |
| <a name="module_replica"></a> [replica](#module\_replica) | terraform-aws-modules/rds/aws | ~> v3.1.0 |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | terraform-aws-modules/security-group/aws | ~> v4.2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.aws_lb_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [helm_release.aws_ingress](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.alb_ingress_crds](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.game-2048-deployment](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.game-2048-ingress](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.game-2048-namespace](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.game-2048-service](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [http_http.alb_ingress_crds](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [http_http.game-2048](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [template_file.data_cidrsubnet](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.management_private_cidrsubnet](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.management_public_cidrsubnet](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.private_cidrsubnet](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.public_cidrsubnet](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_vpc_cidr_range"></a> [application\_vpc\_cidr\_range](#input\_application\_vpc\_cidr\_range) | n/a | `string` | `"10.10.0.0/16"` | no |
| <a name="input_application_vpc_subnet_count"></a> [application\_vpc\_subnet\_count](#input\_application\_vpc\_subnet\_count) | n/a | `string` | `"2"` | no |
| <a name="input_cluster_create_timeout"></a> [cluster\_create\_timeout](#input\_cluster\_create\_timeout) | n/a | `string` | `"60m"` | no |
| <a name="input_cluster_delete_timeout"></a> [cluster\_delete\_timeout](#input\_cluster\_delete\_timeout) | n/a | `string` | `"60m"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | `"k8s-playground"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | n/a | `string` | `"1.20"` | no |
| <a name="input_enable_irsa"></a> [enable\_irsa](#input\_enable\_irsa) | n/a | `bool` | `true` | no |
| <a name="input_iam_alb_role_name"></a> [iam\_alb\_role\_name](#input\_iam\_alb\_role\_name) | The name for aws load balancer controller | `string` | `"aws-load-balancer-controller"` | no |
| <a name="input_install_2048_game"></a> [install\_2048\_game](#input\_install\_2048\_game) | Install game-2048 (1 - yes ; 0 - no) | `bool` | `true` | no |
| <a name="input_kubeconfig_output_path"></a> [kubeconfig\_output\_path](#input\_kubeconfig\_output\_path) | n/a | `string` | `"./"` | no |
| <a name="input_manage_aws_auth"></a> [manage\_aws\_auth](#input\_manage\_aws\_auth) | n/a | `string` | `"true"` | no |
| <a name="input_management_vpc_cidr_range"></a> [management\_vpc\_cidr\_range](#input\_management\_vpc\_cidr\_range) | n/a | `string` | `"10.20.0.0/16"` | no |
| <a name="input_management_vpc_subnet_count"></a> [management\_vpc\_subnet\_count](#input\_management\_vpc\_subnet\_count) | n/a | `string` | `"2"` | no |
| <a name="input_mysql_allocated_storage"></a> [mysql\_allocated\_storage](#input\_mysql\_allocated\_storage) | n/a | `number` | `20` | no |
| <a name="input_mysql_engine"></a> [mysql\_engine](#input\_mysql\_engine) | n/a | `string` | `"mysql"` | no |
| <a name="input_mysql_engine_version"></a> [mysql\_engine\_version](#input\_mysql\_engine\_version) | n/a | `string` | `"8.0.20"` | no |
| <a name="input_mysql_family"></a> [mysql\_family](#input\_mysql\_family) | n/a | `string` | `"mysql8.0"` | no |
| <a name="input_mysql_instance_class"></a> [mysql\_instance\_class](#input\_mysql\_instance\_class) | n/a | `string` | `"db.t3.large"` | no |
| <a name="input_mysql_major_engine_version"></a> [mysql\_major\_engine\_version](#input\_mysql\_major\_engine\_version) | n/a | `string` | `"8.0"` | no |
| <a name="input_mysql_max_allocated_storage"></a> [mysql\_max\_allocated\_storage](#input\_mysql\_max\_allocated\_storage) | n/a | `number` | `100` | no |
| <a name="input_mysql_name"></a> [mysql\_name](#input\_mysql\_name) | n/a | `string` | `"k8s-playground"` | no |
| <a name="input_mysql_password"></a> [mysql\_password](#input\_mysql\_password) | n/a | `string` | `"YourPwdShouldBeLongAndSecure!"` | no |
| <a name="input_mysql_username"></a> [mysql\_username](#input\_mysql\_username) | n/a | `string` | `"playground"` | no |
| <a name="input_node_groups"></a> [node\_groups](#input\_node\_groups) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway) | n/a | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_write_kubeconfig"></a> [write\_kubeconfig](#input\_write\_kubeconfig) | n/a | `string` | `"true"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azs"></a> [azs](#output\_azs) | n/a |
| <a name="output_backend_subnets"></a> [backend\_subnets](#output\_backend\_subnets) | n/a |
| <a name="output_cluster_iam_role_arn"></a> [cluster\_iam\_role\_arn](#output\_cluster\_iam\_role\_arn) | n/a |
| <a name="output_cluster_iam_role_name"></a> [cluster\_iam\_role\_name](#output\_cluster\_iam\_role\_name) | n/a |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
| <a name="output_cluster_internal_endpoint"></a> [cluster\_internal\_endpoint](#output\_cluster\_internal\_endpoint) | n/a |
| <a name="output_cluster_log_group"></a> [cluster\_log\_group](#output\_cluster\_log\_group) | n/a |
| <a name="output_cluster_security_group_id"></a> [cluster\_security\_group\_id](#output\_cluster\_security\_group\_id) | n/a |
| <a name="output_cluster_version"></a> [cluster\_version](#output\_cluster\_version) | n/a |
| <a name="output_config_map_aws_auth"></a> [config\_map\_aws\_auth](#output\_config\_map\_aws\_auth) | n/a |
| <a name="output_default_vpc_id"></a> [default\_vpc\_id](#output\_default\_vpc\_id) | n/a |
| <a name="output_igw_id"></a> [igw\_id](#output\_igw\_id) | n/a |
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | n/a |
| <a name="output_kubeconfig_filename"></a> [kubeconfig\_filename](#output\_kubeconfig\_filename) | n/a |
| <a name="output_master_db_instance_address"></a> [master\_db\_instance\_address](#output\_master\_db\_instance\_address) | The address of the RDS instance |
| <a name="output_master_db_instance_arn"></a> [master\_db\_instance\_arn](#output\_master\_db\_instance\_arn) | The ARN of the RDS instance |
| <a name="output_master_db_instance_availability_zone"></a> [master\_db\_instance\_availability\_zone](#output\_master\_db\_instance\_availability\_zone) | The availability zone of the RDS instance |
| <a name="output_master_db_instance_endpoint"></a> [master\_db\_instance\_endpoint](#output\_master\_db\_instance\_endpoint) | The connection endpoint |
| <a name="output_master_db_instance_hosted_zone_id"></a> [master\_db\_instance\_hosted\_zone\_id](#output\_master\_db\_instance\_hosted\_zone\_id) | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| <a name="output_master_db_instance_id"></a> [master\_db\_instance\_id](#output\_master\_db\_instance\_id) | The RDS instance ID |
| <a name="output_master_db_instance_name"></a> [master\_db\_instance\_name](#output\_master\_db\_instance\_name) | The database name |
| <a name="output_master_db_instance_password"></a> [master\_db\_instance\_password](#output\_master\_db\_instance\_password) | The database password (this password may be old, because Terraform doesn't track it after initial creation) |
| <a name="output_master_db_instance_port"></a> [master\_db\_instance\_port](#output\_master\_db\_instance\_port) | The database port |
| <a name="output_master_db_instance_resource_id"></a> [master\_db\_instance\_resource\_id](#output\_master\_db\_instance\_resource\_id) | The RDS Resource ID of this instance |
| <a name="output_master_db_instance_status"></a> [master\_db\_instance\_status](#output\_master\_db\_instance\_status) | The RDS instance status |
| <a name="output_master_db_instance_username"></a> [master\_db\_instance\_username](#output\_master\_db\_instance\_username) | The master username for the database |
| <a name="output_master_db_subnet_group_arn"></a> [master\_db\_subnet\_group\_arn](#output\_master\_db\_subnet\_group\_arn) | The ARN of the db subnet group |
| <a name="output_master_db_subnet_group_id"></a> [master\_db\_subnet\_group\_id](#output\_master\_db\_subnet\_group\_id) | The db subnet group name |
| <a name="output_node_groups"></a> [node\_groups](#output\_node\_groups) | n/a |
| <a name="output_public_route_table_ids"></a> [public\_route\_table\_ids](#output\_public\_route\_table\_ids) | n/a |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | n/a |
| <a name="output_replica_db_instance_address"></a> [replica\_db\_instance\_address](#output\_replica\_db\_instance\_address) | The address of the RDS instance |
| <a name="output_replica_db_instance_arn"></a> [replica\_db\_instance\_arn](#output\_replica\_db\_instance\_arn) | The ARN of the RDS instance |
| <a name="output_replica_db_instance_availability_zone"></a> [replica\_db\_instance\_availability\_zone](#output\_replica\_db\_instance\_availability\_zone) | The availability zone of the RDS instance |
| <a name="output_replica_db_instance_endpoint"></a> [replica\_db\_instance\_endpoint](#output\_replica\_db\_instance\_endpoint) | The connection endpoint |
| <a name="output_replica_db_instance_hosted_zone_id"></a> [replica\_db\_instance\_hosted\_zone\_id](#output\_replica\_db\_instance\_hosted\_zone\_id) | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| <a name="output_replica_db_instance_id"></a> [replica\_db\_instance\_id](#output\_replica\_db\_instance\_id) | The RDS instance ID |
| <a name="output_replica_db_instance_name"></a> [replica\_db\_instance\_name](#output\_replica\_db\_instance\_name) | The database name |
| <a name="output_replica_db_instance_port"></a> [replica\_db\_instance\_port](#output\_replica\_db\_instance\_port) | The database port |
| <a name="output_replica_db_instance_resource_id"></a> [replica\_db\_instance\_resource\_id](#output\_replica\_db\_instance\_resource\_id) | The RDS Resource ID of this instance |
| <a name="output_replica_db_instance_status"></a> [replica\_db\_instance\_status](#output\_replica\_db\_instance\_status) | The RDS instance status |
| <a name="output_replica_db_instance_username"></a> [replica\_db\_instance\_username](#output\_replica\_db\_instance\_username) | The replica username for the database |
| <a name="output_service_route_table_ids"></a> [service\_route\_table\_ids](#output\_service\_route\_table\_ids) | n/a |
| <a name="output_service_subnets"></a> [service\_subnets](#output\_service\_subnets) | n/a |
| <a name="output_service_subnets_cidr_blocks"></a> [service\_subnets\_cidr\_blocks](#output\_service\_subnets\_cidr\_blocks) | n/a |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
| <a name="output_vpc_instance_tenancy"></a> [vpc\_instance\_tenancy](#output\_vpc\_instance\_tenancy) | n/a |
| <a name="output_vpc_main_route_table_id"></a> [vpc\_main\_route\_table\_id](#output\_vpc\_main\_route\_table\_id) | n/a |
| <a name="output_worker_iam_role_arn"></a> [worker\_iam\_role\_arn](#output\_worker\_iam\_role\_arn) | n/a |
| <a name="output_worker_iam_role_name"></a> [worker\_iam\_role\_name](#output\_worker\_iam\_role\_name) | n/a |