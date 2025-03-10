######################################################################
# Configurations of VPN customer gateway resource
######################################################################

variable "is_connection_create" {
  description = "Controls whether a VPN connection should be created"

  type     = bool
  default  = true
  nullable = false
}

variable "connection_name" {
  description = "The name of the VPN connection"

  type    = string
  default = ""
}

variable "connection_gateway_id" {
  description = "The ID of the VPN gateway used by the VPN connection"

  type    = string
  default = ""
}

variable "connection_gateway_ip" {
  description = "The IP address of the VPN gateway used by the VPN connection"

  type    = string
  default = ""
}

variable "connection_customer_gateway_id" {
  description = "The ID of the customer gateway used by the VPN connection"

  type    = string
  default = ""
}

variable "connection_vpn_type" {
  description = "The type of the VPN connection"

  type    = string
  default = "static"
}

variable "connection_pre_shared_key" {
  description = "The content of the pre-shared key"

  type    = string
  default = ""
}

variable "connection_peer_subnets" {
  description = "The CIDR list of the customer subnets"

  type    = list(string)
  default = []
}

variable "connection_tunnel_local_address" {
  description = "The local tunnel address of the VPN connection"

  type    = string
  default = ""
}

variable "connection_tunnel_peer_address" {
  description = "The local peer address of the VPN connection"

  type    = string
  default = ""
}

variable "connection_enable_nqa" {
  description = "Whether to enable NQA check for the VPN connection"

  type    = bool
  default = null
}

variable "connection_tags" {
  description = "The tags of the VPN connection"

  type    = map(string)
  default = {}
}

variable "connection_ha_role" {
  description = "The mode of the VPN connection"

  type    = string
  default = ""
}

variable "connection_ikepolicy" {
  description = "The IKE policy of the VPN connection"

  type = list(object({
    authentication_algorithm = optional(string, null)
    encryption_algorithm     = optional(string, null)
    ike_version              = optional(string, null)
    lifetime_seconds         = optional(number, null)
    local_id_type            = optional(string, null)
    local_id                 = optional(string, null)
    peer_id_type             = optional(string, null)
    peer_id                  = optional(string, null)
    phase1_negotiation_mode  = optional(string, null)
    authentication_method    = optional(string, null)
    dh_group                 = optional(string, null)
    dpd                      = optional(list(object({
      timeout  = optional(number, null)
      interval = optional(number, null)
      msg      = optional(string, null)
    })), [])
  }))
  default  = []
  nullable = false
}

variable "connection_ipsecpolicy" {
  description = "The IPsec policy of the VPN connection"

  type = list(object({
    authentication_algorithm = optional(string, null)
    encryption_algorithm     = optional(string, null)
    pfs                      = optional(string, null)
    lifetime_seconds         = optional(number, null)
    transform_protocol       = optional(string, null)
    encapsulation_mode       = optional(string, null)
  }))
  default  = []
  nullable = false
}

variable "connection_policy_rules" {
  description = "The certificate configuration of the public VPN gateway"

  type = list(object({
    rule_index  = optional(number, null)
    source      = optional(list(string), null)
    destination = optional(string, null)
  }))
  default  = []
  nullable = false
}
