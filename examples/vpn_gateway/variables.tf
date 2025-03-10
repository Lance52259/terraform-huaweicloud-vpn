######################################################################
# Public configurations
######################################################################

variable "region_name" {
  description = "The region where the resources are located"

  type = string
}

variable "enterprise_project_id" {
  description = "Used to specify whether the resource is created under the enterprise project (this parameter is only valid for enterprise users)"

  type = string
}

######################################################################
# Configurations of VPC resource and related resources
######################################################################

variable "vpc_name" {
  description = "The name of the VPC resource"

  type = string
}

variable "vpc_cidr" {
  description = "The CIDR block of the VPC resource"

  type = string
}

variable "subnets_configuration" {
  description = "The configuration for the subnet resources to which the VPC belongs"

  type = list(object({
    name           = string
    description    = optional(string, null)
    cidr           = string
    ipv6_enabled   = optional(bool, true)
    dhcp_enabled   = optional(bool, true)
    dns_list       = optional(list(string), null)
    tags           = optional(map(string), {})
    delete_timeout = optional(string, null)
  }))
}

######################################################################
# Configurations of VPN gateway resource
######################################################################

variable "gateway_name" {
  description = "The name of the VPN gateway"

  type = string
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
}

variable "delete_eip_on_termination" {
  description = "Whether to delete the EIP when the VPN gateway is deleted"

  type = bool
}
