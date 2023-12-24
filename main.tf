resource "helm_release" "tailscale_operator" {
  name = "tailscale-operator"

  repository       = "https://pkgs.tailscale.com/helmcharts"
  chart            = "tailscale/tailscale-operator"
  version          = "1.56.1"
  create_namespace = true
  namespace        = "tailscale-operator"

  set_sensitive {
    name  = "oauth.clientId"
    value = var.tailscale_operator_id
  }
  set_sensitive {
    name  = "oauth.clientSecret"
    value = var.tailscale_operator_secret
  }
}