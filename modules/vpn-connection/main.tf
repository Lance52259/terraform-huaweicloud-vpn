resource "huaweicloud_vpn_connection" "this" {
  count = var.is_connection_create ? 1 : 0

  name                 = var.connection_name
  gateway_id           = var.connection_gateway_id
  gateway_ip           = var.connection_gateway_ip
  customer_gateway_id  = var.connection_customer_gateway_id
  vpn_type             = var.connection_vpn_type
  psk                  = var.connection_pre_shared_key
  peer_subnets         = var.connection_peer_subnets
  tunnel_local_address = var.connection_tunnel_local_address
  tunnel_peer_address  = var.connection_tunnel_peer_address
  enable_nqa           = var.connection_enable_nqa
  tags                 = var.connection_tags
  ha_role              = var.connection_ha_role

  dynamic "ikepolicy" {
    for_each = var.connection_ikepolicy

    content {
      authentication_algorithm = ikepolicy.value["authentication_algorithm"]
      encryption_algorithm     = ikepolicy.value["encryption_algorithm"]
      ike_version              = ikepolicy.value["ike_version"]
      lifetime_seconds         = ikepolicy.value["lifetime_seconds"]
      local_id_type            = ikepolicy.value["local_id_type"]
      local_id                 = ikepolicy.value["local_id"]
      peer_id_type             = ikepolicy.value["peer_id_type"]
      peer_id                  = ikepolicy.value["peer_id"]
      phase1_negotiation_mode  = ikepolicy.value["phase1_negotiation_mode"]
      authentication_method    = ikepolicy.value["authentication_method"]
      dh_group                 = ikepolicy.value["dh_group"]

      dynamic "dpd" {
        for_each = ikepolicy.value["dpd"] != null ? ikepolicy.value["dpd"] : []

        content {
          timeout  = dpd.value["timeout"]
          interval = dpd.value["interval"]
          msg      = dpd.value["msg"]
        }
      }
    }
  }

  dynamic "ipsecpolicy" {
    for_each = var.connection_ipsecpolicy

    content {
      authentication_algorithm = ipsecpolicy.value["authentication_algorithm"]
      encryption_algorithm     = ipsecpolicy.value["encryption_algorithm"]
      pfs                      = ipsecpolicy.value["pfs"]
      lifetime_seconds         = ipsecpolicy.value["lifetime_seconds"]
      transform_protocol       = ipsecpolicy.value["transform_protocol"]
      encapsulation_mode       = ipsecpolicy.value["encapsulation_mode"]
    }
  }

  dynamic "policy_rules" {
    for_each = var.connection_policy_rules

    content {
      rule_index  = ipsecpolicy.value["rule_index"]
      source      = ipsecpolicy.value["source"]
      destination = ipsecpolicy.value["destination"]
    }
  }

  lifecycle {
    precondition {
      condition     = var.connection_name != ""
      error_message = "The connection_name is required if the is_connection_create is true."
    }
    precondition {
      condition     = var.connection_gateway_id != ""
      error_message = "The connection_gateway_id is required if the is_connection_create is true."
    }
    precondition {
      condition     = var.connection_gateway_ip != ""
      error_message = "The connection_gateway_id is required if the is_connection_create is true."
    }
    precondition {
      condition     = var.connection_customer_gateway_id != ""
      error_message = "The connection_customer_gateway_id is required if the is_connection_create is true."
    }
  }
}
