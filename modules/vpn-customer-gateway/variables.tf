######################################################################
# Configurations of VPN customer gateway resource
######################################################################

variable "is_customer_gateway_create" {
  description = "Controls whether a VPN customer gateway should be created"

  type     = bool
  default  = true
  nullable = false
}

variable "customer_gateway_name" {
  description = "The name of the VPN customer gateway"

  type    = string
  default = ""
}

variable "customer_gateway_id_type" {
  description = "The identifier type of the VPN customer gateway"

  type    = string
  default = "ip"
}

variable "customer_gateway_id_value" {
  description = "The identifier of the VPN customer gateway"

  type    = string
  default = ""
}

variable "customer_gateway_bgp_asn" {
  description = "The BGP ASN number of the VPN customer gateway"

  type    = number
  default = null
}

variable "customer_gateway_certificate_content" {
  description = "The CA certificate content of the VPN customer gateway"

  type    = string
  default = ""
}

variable "customer_gateway_tags" {
  description = "The key/value pairs to associate with the VPN customer gateway"

  type    = map(string)
  default = {}
}
