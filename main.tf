module "delegate" {
  source  = "harness/harness-delegate/kubernetes"
  version = "0.1.5"

  account_id = var.account_id
  # create_namespace = var.create_namespace
  delegate_token   = var.delegate_token
  delegate_name    = var.delegate_name
  namespace        = var.namespace
  manager_endpoint = var.manager_endpoint
  delegate_image   = var.delegate_image
  replicas         = 1
  upgrader_enabled = false

  # Additional optional values to pass to the helm chart
  values = yamlencode({
    initScript : ""
  })
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
