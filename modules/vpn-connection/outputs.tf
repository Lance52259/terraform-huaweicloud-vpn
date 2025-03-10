output "connection_id" {
  description = "The ID of the VPN connection"

  value = try(huaweicloud_vpn_connection.this[0].id, "")
}