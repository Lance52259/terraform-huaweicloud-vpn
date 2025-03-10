######################################################################
# Public configurations
######################################################################

variable "enterprise_project_id" {
  description = "Used to specify whether the resource is created under the enterprise project (this parameter is only valid for enterprise users)"

  type        = string
  default     = ""
}

######################################################################
# Configurations of VPN gateway resource
######################################################################

variable "is_gateway_create" {
  description = "Controls whether a VPN should be created"

  type     = bool
  default  = true
  nullable = false
}

variable "gateway_name" {
  description = "The name of the VPN gateway"

  type    = string
  default = ""
}

variable "gateway_availability_zones" {
  description = "The availability zones of the VPN gateway"

  type    = list(string)
  default = []
}

variable "gateway_flavor" {
  description = "The flavor type of the VPN gateway"

  type    = string
  default = "Basic"
}

variable "gateway_attachment_type" {
  description = "The attachment type of the VPN gateway"

  type    = string
  default = "vpc"
}

variable "gateway_network_type" {
  description = "The network type of the VPN gateway"

  type    = string
  default = "public"
}

variable "gateway_vpc_id" {
  description = "The ID of the VPC to which the VPN gateway is connected"

  type    = string
  default = ""
}

variable "gateway_local_subnet_cidrs" {
  description = "The CIDR blocks that is in the VPC and needs to connect to the on-premises network through the VPN gateway"

  type    = list(string)
  default = []
}

variable "gateway_interconnection_subnet_id" {
  description = "The VPC subnet reserved for the P2C VPN gateway"

  type    = string
  default = ""
}

variable "gateway_er_instance_id" {
  description = "The enterprise router ID to attach with the VPN gateway"

  type    = string
  default = ""
}

variable "gateway_ha_mode" {
  description = "The HA mode of the VPN gateway"

  type    = string
  default = "active-active"
}

variable "gateway_bgp_asn" {
  description = "The BGP ASN number of the VPN gateway"

  type    = number
  default = null
}

variable "gateway_tags" {
  description = "The key/value pairs to associate with the VPN gateway"

  type    = map(string)
  default = {}
}

variable "delete_eip_on_termination" {
  description = "Whether to delete the EIP when the VPN gateway is deleted"

  type    = bool
  default = null
}

variable "gateway_access_vpc_id" {
  description = "The access VPC ID of the private VPN gateway"

  type    = string
  default = ""
}

variable "gateway_access_subnet_id" {
  description = "The access subnet ID of the private VPN gateway"

  type    = string
  default = ""
}

variable "gateway_access_private_ips" {
  description = "The access IP addresses of the private VPN gateway"

  type    = string
  default = ""
}

variable "gateway_public_eip_configurations" {
  description = "The EIP configurations of the public VPN gateway"

  type = list(object({
    id             = optional(string, null)
    type           = optional(string, null)
    bandwidth_name = optional(string, null)
    bandwidth_size = optional(number, null)
    charge_mode    = optional(string, null)
  }))
  default  = []
  nullable = false
}

variable "gateway_certificate" {
  description = "The certificate configuration of the public VPN gateway"

  type = list(object({
    name              = optional(string, null)
    content           = optional(string, null)
    private_key       = optional(string, null)
    certificate_chain = optional(string, null)
    enc_certificate   = optional(string, null)
    enc_private_key   = optional(string, null)
  }))
  default  = []
  nullable = false
}
