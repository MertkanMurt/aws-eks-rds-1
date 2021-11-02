terraform {
  backend "s3" {
    bucket = "aws-eks-rds"
    key    = "terraform/cluster.tfstate"
    region = "us-west-2"
  }
}