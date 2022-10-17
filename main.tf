resource "yandex_vpc_security_group" "this" {
  network_id  = var.security-group-network-id
  name        = var.security-group-name
  description = var.security-group-description

  dynamic "ingress" {
    for_each    = { for k, v in var.security_group_ingress : k => v }
    iterator    = ingress
    content {
      protocol       = lookup(ingress.value, "protocol", null)
      description    = lookup(ingress.value, "description", null)
      labels         = lookup(ingress.value, "labels", null)
      from_port      = lookup(ingress.value, "from_port", null)
      to_port        = lookup(ingress.value, "to_port", null)
      port           = lookup(ingress.value, "port", null)
      v4_cidr_blocks = lookup(ingress.value, "v4_cidr_blocks", null)
      v6_cidr_blocks = lookup(ingress.value, "v6_cidr_blocks", null)
    }
  }

  dynamic "egress" {
    for_each    = { for k, v in var.security_group_egress : k => v }
    iterator    = egress
    content {
      protocol       = lookup(egress.value, "protocol", null)
      description    = lookup(egress.value, "description", null)
      labels         = lookup(egress.value, "labels", null)
      from_port      = lookup(egress.value, "from_port", null)
      to_port        = lookup(egress.value, "to_port", null)
      port           = lookup(egress.value, "port", null)
      v4_cidr_blocks = lookup(egress.value, "v4_cidr_blocks", null)
      v6_cidr_blocks = lookup(egress.value, "v6_cidr_blocks", null)
    }
  }
}
