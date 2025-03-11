output "idc_center_connection_id" {
  description = "The ID of the VPN connection in the IDC center"

  value = module.idc_center_vpn_connection.connection_id
}

output "cloud_side_connection_id" {
  description = "The ID of the VPN connection in the cloud side"

  value = module.cloud_side_vpn_connection.connection_id
}
