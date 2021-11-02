resource "aws_iam_policy" "aws_lb_controller" {
  name_prefix = "AWSLoadBalancerController"
  description = "EKS ALB ingress controller"
  policy      = file("${path.module}/files/loadbalancercontroller.json")

  depends_on = [module.cluster]
}
module "iam_assumable_role_admin" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  create_role                   = true
  role_name                     = var.iam_alb_role_name
  provider_url                  = module.cluster.cluster_oidc_issuer_url
  role_policy_arns              = [aws_iam_policy.aws_lb_controller.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:kube-system:${var.iam_alb_role_name}"]

  depends_on = [aws_iam_policy.aws_lb_controller]
}
resource "kubectl_manifest" "alb_ingress_crds" {
  yaml_body  = data.http.alb_ingress_crds.body
  depends_on = [module.iam_assumable_role_admin]
}
resource "helm_release" "aws_ingress" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"
  wait       = true
  timeout    = 400

  values = [<<EOF
clusterName: ${var.cluster_name}
region: ${var.region}
serviceAccount:
  create: true
  annotations:
    eks.amazonaws.com/role-arn: arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.iam_alb_role_name}
  vpcId: ${module.application-vpc.vpc_id}
EOF
  ]
  depends_on = [kubectl_manifest.alb_ingress_crds]
}