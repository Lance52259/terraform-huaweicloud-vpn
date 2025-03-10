resource "huaweicloud_vpn_customer_gateway" "this" {
  count = var.is_customer_gateway_create ? 1 : 0

  name                = var.customer_gateway_name
  id_type             = var.customer_gateway_id_type
  id_value            = var.customer_gateway_id_value
  asn                 = var.customer_gateway_bgp_asn
  certificate_content = var.customer_gateway_certificate_content
  tags                = var.customer_gateway_tags

  lifecycle {
    precondition {
      condition     = var.customer_gateway_name != ""
      error_message = "The customer_gateway_name is required if the is_customer_gateway_create is true."
    }
    precondition {
      condition     = var.customer_gateway_id_value != ""
      error_message = "The customer_gateway_id_value is required if the is_customer_gateway_create is true."
    }
  }
}
