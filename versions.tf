terraform {
  required_version = ">= 1.0.0"
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    aws        = ">= 3.45.0"
    local      = ">= 1.4"
    kubernetes = ">= 2.3.2"
    null       = ">= 3.1.0"
    template   = ">= 2.2.0"
  }
}
