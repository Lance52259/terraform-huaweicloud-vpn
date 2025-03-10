output "gateway_id" {
  description = "The ID of the VPN gateway"

  value = try(huaweicloud_vpn_gateway.this[0].id, "")
}

output "gateway_er_attachment_id" {
  description = "The ER attachment ID to associate with the VPN gateway"

  value = try(huaweicloud_vpn_gateway.this[0].er_attachment_id, "")
}

output "gateway_master_public_ip_address" {
  description = "The master EIP address of the public VPN gateway"

  value = try(huaweicloud_vpn_gateway.this[0].eip1[0].ip_address, "")
}

output "gateway_master_public_ip_id" {
  description = "The master EIP ID of the public VPN gateway"

  value = try(huaweicloud_vpn_gateway.this[0].eip1[0].id, "")
}

output "gateway_slave_public_ip_address" {
  description = "The slave EIP address of the public VPN gateway"

  value = try(huaweicloud_vpn_gateway.this[0].eip2[0].ip_address, "")
}

output "gateway_slave_public_ip_id" {
  description = "The slave EIP ID of the public VPN gateway"

  value = try(huaweicloud_vpn_gateway.this[0].eip2[0].id, "")
}
