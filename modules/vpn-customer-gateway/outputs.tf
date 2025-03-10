output "customer_gateway_id" {
  description = "The ID of the VPN customer gateway"

  value = try(huaweicloud_vpn_customer_gateway.this[0].id, "")
}

output "customer_gateway_certificate_id" {
  description = "The ID of the customer customer gateway certificate"

  value = try(huaweicloud_vpn_customer_gateway.this[0].certificate_id, "")
}

output "customer_gateway_serial_number" {
  description = "The serial number (SN) of the VPN customer gateway certificate"

  value = try(huaweicloud_vpn_customer_gateway.this[0].serial_number, "")
}

output "customer_gateway_subject" {
  description = "The subject of the VPN customer gateway certificate"

  value = try(huaweicloud_vpn_customer_gateway.this[0].subject, "")
}

output "customer_gateway_certificate_expire_time" {
  description = "The expire time of the VPN customer gateway"

  value = try(huaweicloud_vpn_customer_gateway.this[0].expire_time, "")
}
