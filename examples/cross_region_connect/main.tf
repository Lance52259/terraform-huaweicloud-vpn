provider "huaweicloud" {
  region = var.idc_center_region_name
}

data "huaweicloud_availability_zones" "idc_center" {}

module "idc_center_network" {
  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-vpc?ref=v1.2.0"

  enterprise_project_id = var.enterprise_project_id
  availability_zone     = data.huaweicloud_availability_zones.idc_center.names[0]

  vpc_name              = var.idc_center_vpc_name
  vpc_cidr              = var.idc_center_vpc_cidr
  subnets_configuration = var.idc_center_subnets_configuration

  is_security_group_create = false
}

module "idc_center_vpn_gateway" {
  source = "../../modules/vpn-gateway"

  depends_on = [
    module.idc_center_network
  ]

  enterprise_project_id = var.enterprise_project_id

  gateway_name                      = var.idc_center_gateway_name
  gateway_availability_zones        = var.idc_center_gateway_availability_zones
  gateway_vpc_id                    = module.idc_center_network.vpc_id
  gateway_local_subnet_cidrs        = module.idc_center_network.subnet_cidrs
  gateway_interconnection_subnet_id = try(element(module.idc_center_network.subnet_ids, 0), "")
  gateway_public_eip_configurations = var.idc_center_gateway_public_eip_configurations
}

module "idc_center_vpn_customer_gateway" {
  source = "../../modules/vpn-customer-gateway"

  customer_gateway_name     = var.idc_center_customer_gateway_name
  customer_gateway_id_value = module.cloud_side_vpn_gateway.gateway_master_public_ip_address
}

module "idc_center_vpn_connection" {
  source = "../../modules/vpn-connection"

  connection_name                = var.idc_center_connection_name
  connection_gateway_id          = module.idc_center_vpn_gateway.gateway_id
  connection_gateway_ip          = module.idc_center_vpn_gateway.gateway_master_public_ip_id
  connection_customer_gateway_id = module.idc_center_vpn_customer_gateway.customer_gateway_id
  connection_pre_shared_key      = var.idc_center_connection_pre_shared_key
  connection_peer_subnets        = module.cloud_side_network.subnet_cidrs
}

provider "huaweicloud" {
  alias  = "cloud_side"
  region = var.cloud_side_region_name
}

data "huaweicloud_availability_zones" "cloud_side" {}

module "cloud_side_network" {
  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-vpc?ref=v1.2.0"

  providers = {
    huaweicloud = huaweicloud.cloud_side
  }

  enterprise_project_id = var.enterprise_project_id
  availability_zone     = data.huaweicloud_availability_zones.cloud_side.names[0]

  vpc_name              = var.cloud_side_vpc_name
  vpc_cidr              = var.cloud_side_vpc_cidr
  subnets_configuration = var.cloud_side_subnets_configuration

  is_security_group_create = false
}

module "cloud_side_vpn_gateway" {
  source = "../../modules/vpn-gateway"

  providers = {
    huaweicloud = huaweicloud.cloud_side
  }

  depends_on = [
    module.cloud_side_network
  ]

  enterprise_project_id = var.enterprise_project_id

  gateway_name                      = var.cloud_side_gateway_name
  gateway_availability_zones        = var.cloud_side_gateway_availability_zones
  gateway_vpc_id                    = module.cloud_side_network.vpc_id
  gateway_local_subnet_cidrs        = module.cloud_side_network.subnet_cidrs
  gateway_interconnection_subnet_id = try(element(module.cloud_side_network.subnet_ids, 0), "")
  gateway_public_eip_configurations = var.cloud_side_gateway_public_eip_configurations
}

module "cloud_side_vpn_customer_gateway" {
  source = "../../modules/vpn-customer-gateway"

  providers = {
    huaweicloud = huaweicloud.cloud_side
  }

  customer_gateway_name     = var.cloud_side_customer_gateway_name
  customer_gateway_id_value = module.idc_center_vpn_gateway.gateway_master_public_ip_address
}

module "cloud_side_vpn_connection" {
  source = "../../modules/vpn-connection"

  providers = {
    huaweicloud = huaweicloud.cloud_side
  }

  connection_name                = var.cloud_side_connection_name
  connection_gateway_id          = module.cloud_side_vpn_gateway.gateway_id
  connection_gateway_ip          = module.cloud_side_vpn_gateway.gateway_master_public_ip_id
  connection_customer_gateway_id = module.cloud_side_vpn_customer_gateway.customer_gateway_id
  connection_pre_shared_key      = var.cloud_side_connection_pre_shared_key
  connection_peer_subnets        = module.idc_center_network.subnet_cidrs
}
