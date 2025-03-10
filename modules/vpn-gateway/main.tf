resource "huaweicloud_vpn_gateway" "this" {
  count = var.is_gateway_create ? 1 : 0

  enterprise_project_id = var.enterprise_project_id != "" ? var.enterprise_project_id : null

  name                      = var.gateway_name
  availability_zones        = var.gateway_availability_zones
  flavor                    = var.gateway_flavor
  attachment_type           = var.gateway_attachment_type
  network_type              = var.gateway_network_type
  vpc_id                    = var.gateway_attachment_type == "vpc" ? var.gateway_vpc_id : null
  local_subnets             = var.gateway_attachment_type == "vpc" ? var.gateway_local_subnet_cidrs : null
  connect_subnet            = var.gateway_attachment_type == "vpc" ? var.gateway_interconnection_subnet_id : null
  er_id                     = var.gateway_attachment_type == "er" ? var.gateway_er_instance_id : null
  ha_mode                   = var.gateway_ha_mode != "" ? var.gateway_ha_mode : null
  asn                       = var.gateway_bgp_asn != 0 ? var.gateway_bgp_asn : null
  tags                      = var.gateway_tags
  delete_eip_on_termination = var.delete_eip_on_termination

  access_vpc_id       = var.gateway_network_type == "private" ? var.gateway_access_vpc_id : null
  access_subnet_id    = var.gateway_network_type == "private" ? var.gateway_access_subnet_id : null
  access_private_ip_1 = var.gateway_network_type == "private" ? try(element(var.gateway_access_private_ips, 0), null) : null
  access_private_ip_2 = var.gateway_network_type == "private" ? try(element(var.gateway_access_private_ips, 1), null) : null

  dynamic "eip1" {
    for_each = var.gateway_network_type == "public" ? try(slice(var.gateway_public_eip_configurations, 0, 1), []) : []

    content {
      id             = eip1.value["id"]
      type           = eip1.value["type"]
      bandwidth_name = eip1.value["bandwidth_name"]
      bandwidth_size = eip1.value["bandwidth_size"]
      charge_mode    = eip1.value["charge_mode"]
    }
  }
  dynamic "eip2" {
    for_each = var.gateway_network_type == "public" ? try(slice(var.gateway_public_eip_configurations, 1, 2), []) : []

    content {
      id             = eip2.value["id"]
      type           = eip2.value["type"]
      bandwidth_name = eip2.value["bandwidth_name"]
      bandwidth_size = eip2.value["bandwidth_size"]
      charge_mode    = eip2.value["charge_mode"]
    }
  }

  dynamic "certificate" {
    for_each = var.gateway_certificate

    content {
      name              = certificate.value["name"]
      content           = certificate.value["content"]
      private_key       = certificate.value["private_key"]
      certificate_chain = certificate.value["certificate_chain"]
      enc_certificate   = certificate.value["enc_certificate"]
      enc_private_key   = certificate.value["enc_private_key"]
    }
  }

  lifecycle {
    precondition {
      condition     = var.gateway_name != ""
      error_message = "The gateway_name is required if the is_gateway_create is true."
    }
    precondition {
      condition     = length(var.gateway_availability_zones) > 0
      error_message = "The gateway_availability_zones is required if the is_gateway_create is true."
    }
  }
}
