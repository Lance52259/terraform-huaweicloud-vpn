######################################################################
# Public configurations
######################################################################

variable "idc_center_region_name" {
  description = "The region where the IDC center resources are located"

  type = string
}

variable "cloud_side_region_name" {
  description = "The region where the cloud side resources are located"

  type = string
}

variable "enterprise_project_id" {
  description = "Used to specify whether the resources are created under the enterprise project (this parameter is only valid for enterprise users)"

  type = string
}

######################################################################
# Configurations of VPC resource and related resources
######################################################################

variable "idc_center_vpc_name" {
  description = "The name of the VPC resource in the IDC center"

  type = string
}

variable "idc_center_vpc_cidr" {
  description = "The CIDR block of the VPC resource in the IDC center"

  type = string
}

variable "idc_center_subnets_configuration" {
  description = "The configuration for the subnet resources to which the VPC (in the IDC center) belongs"

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

variable "cloud_side_vpc_name" {
  description = "The name of the VPC resource in the cloud side"

  type = string
}

variable "cloud_side_vpc_cidr" {
  description = "The CIDR block of the VPC resource in the cloud side"

  type = string
}

variable "cloud_side_subnets_configuration" {
  description = "The configuration for the subnet resources to which the VPC (in the cloud side) belongs"

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
# Configurations of VPN resources
######################################################################

variable "idc_center_gateway_name" {
  description = "The name of the VPN gateway in the IDC center"

  type = string
}

variable "idc_center_gateway_availability_zones" {
  description = "The availability zones of the VPN gateway in the IDC center"

  type = list(string)
}

variable "idc_center_gateway_public_eip_configurations" {
  description = "The EIP configurations of the public VPN gateway in the IDC center"

  type = list(object({
    id             = optional(string, null)
    type           = optional(string, null)
    bandwidth_name = optional(string, null)
    bandwidth_size = optional(number, null)
    charge_mode    = optional(string, null)
  }))
}

variable "idc_center_customer_gateway_name" {
  description = "The name of the VPN gateway in the IDC center"

  type = string
}

variable "idc_center_connection_name" {
  description = "The name of the VPN connection in the IDC center"

  type = string
}

variable "idc_center_connection_pre_shared_key" {
  description = "The content of the pre-shared key used by the VPN connection in the IDC center"

  type = string
}

variable "cloud_side_gateway_name" {
  description = "The name of the VPN gateway in the cloud side"

  type = string
}

variable "cloud_side_gateway_availability_zones" {
  description = "The availability zones of the VPN gateway in the cloud side"

  type = list(string)
}

variable "cloud_side_gateway_public_eip_configurations" {
  description = "The EIP configurations of the public VPN gateway in the cloud side"

  type = list(object({
    id             = optional(string, null)
    type           = optional(string, null)
    bandwidth_name = optional(string, null)
    bandwidth_size = optional(number, null)
    charge_mode    = optional(string, null)
  }))
}

variable "cloud_side_customer_gateway_name" {
  description = "The name of the VPN gateway in the cloud side"

  type = string
}

variable "cloud_side_connection_name" {
  description = "The name of the VPN connection in the cloud side"

  type = string
}

variable "cloud_side_connection_pre_shared_key" {
  description = "The content of the pre-shared key used by the VPN connection in the cloud side"

  type = string
}
