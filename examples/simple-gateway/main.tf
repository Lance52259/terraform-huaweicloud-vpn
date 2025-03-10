provider "huaweicloud" {
  region = var.region_name
}

data "huaweicloud_availability_zones" "this" {}

module "vpn_network" {
  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-vpc?ref=v1.2.0"

  enterprise_project_id = var.enterprise_project_id

  availability_zone = data.huaweicloud_availability_zones.this.names[0]

  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  subnets_configuration = var.subnets_configuration

  is_security_group_create = false
}

data "huaweicloud_vpn_gateway_availability_zones" "this" {
  flavor          = var.gateway_flavor
  attachment_type = var.gateway_attachment_type
}

module "vpn_gateway" {
  source = "../../modules/vpn-gateway"

  enterprise_project_id             = var.enterprise_project_id

  gateway_name                      = var.gateway_name
  gateway_availability_zones        = slice(data.huaweicloud_vpn_gateway_availability_zones.this.names, 0, 2)
  gateway_flavor                    = var.gateway_flavor
  gateway_attachment_type           = var.gateway_attachment_type
  gateway_network_type              = var.gateway_network_type
  gateway_vpc_id                    = module.vpn_network.vpc_id
  gateway_local_subnet_cidrs        = module.vpn_network.subnet_cidrs
  gateway_interconnection_subnet_id = try(element(module.vpn_network.subnet_ids, 0), "")
  gateway_public_eip_configurations = var.gateway_public_eip_configurations
}
