# Network interconnection between two different regions

Use the VPN resources to connect two VPC networks in different regions.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` when you don't need these resources.

## Requirements

| Name | Version |
|------|---------|
| Terraform | >= 1.3.0 |
| Huaweicloud Provider | >= 1.73.0 |

## Modules

<!-- markdownlint-disable MD013 -->
| Name | Source | Version |
|------|--------|---------|
| <a name="idc_center_network"></a> [idc\_center\_network](#idc\_center\_network) | ../../../terraform-huaweicloud-vpc | v1.2.0 |
| <a name="idc_center_vpn_gateway"></a> [idc\_center\_vpn\_gateway](#idc\_center\_vpn\_gateway) | ../../modules/vpn-gateway | N/A |
| <a name="idc_center_vpn_customer_gateway"></a> [idc\_center\_vpn\_customer\_gateway](#idc\_center\_vpn\_customer\_gateway) | ../../modules/vpn-customer-gateway | N/A |
| <a name="idc_center_vpn_connection"></a> [idc\_center\_vpn\_connection](#idc\_center\_vpn\_connection) | ../../modules/vpn-connection | N/A |
| <a name="cloud_side_network"></a> [cloud\_side\_network](#cloud\_side\_network) | ../../../terraform-huaweicloud-vpc | v1.2.0 |
| <a name="cloud_side_vpn_gateway"></a> [cloud\_side\_vpn\_gateway](cloud\_side\_vpn\_gateway) | ../../modules/vpn-gateway | N/A |
| <a name="cloud_side_vpn_customer_gateway"></a> [cloud\_side\_vpn\_customer\_gateway](#cloud\_side\_vpn\_customer\_gateway) | ../../modules/vpn-customer-gateway | N/A |
| <a name="cloud_side_vpn_connection"></a> [cloud\_side\_vpn\_connection](#cloud\_side\_vpn\_connection) | ../../modules/vpn-connection | N/A |
<!-- markdownlint-enable MD013 -->

## Resources

No resource.

## Inputs

<!-- markdownlint-disable MD013 -->
| Name | Description | Value |
|------|-------------|-------|
| idc_center_region_name | The region where the IDC center resources are located | "cn-east-3" |
| cloud_side_region_name | The region where the cloud side resources are located | "cn-north-4" |
| enterprise_project_id | Used to specify whether the resources are created under the enterprise project (this parameter is only valid for enterprise users) | "0" |
| idc_center_vpc_name | The name of the VPC resource in the IDC center | "VPC-Test01" |
| idc_center_vpc_cidr | The CIDR block of the VPC resource in the IDC center | "172.18.0.0/24" |
| idc_center_subnets_configuration | The configuration for the subnet resources to which the VPC (in the IDC center) belongs | [<br>  {<br>    "name": "VPC-Subnet-Test01",<br>    "cidr": "172.18.0.0/24"<br>  }<br>] |
| cloud_side_vpc_name | The name of the VPC resource in the cloud side | "VPC-Test02" |
| cloud_side_vpc_cidr | The CIDR block of the VPC resource in the cloud side | "172.16.0.0/24" |
| cloud_side_subnets_configuration | The configuration for the subnet resources to which the VPC (in the cloud side) belongs | [<br>  {<br>    "name": "VPC-Subnet-Test02",<br>    "cidr": "172.16.0.0/24"<br>  }<br>] |
| idc_center_gateway_name | The name of the VPN gateway in the IDC center | "VPN-GW-Test01" |
| idc_center_gateway_availability_zones | The availability zones of the VPN gateway in the IDC center | [<br>  "cn-east-3a",<br>  "cn-east-3c"<br>] |
| idc_center_gateway_public_eip_configurations | The EIP configurations of the public VPN gateway in the IDC center | <pre>[<br>  {<br>    "type": "5_bgp",<br>    "bandwidth_name": "VPN-GW-01-Master-EIP",<br>    "bandwidth_size": 5,<br>    "charge_mode": "traffic"<br>  },<br>  {<br>    "type": "5_bgp",<br>    "bandwidth_name": "VPN-GW-01-Slave-EIP",<br>    "bandwidth_size": 5,<br>    "charge_mode": "traffic"<br>  }<br>]</pre> |
| idc_center_customer_gateway_name | The name of the VPN gateway in the IDC center | "VPN-Custom-GW-Test01" |
| idc_center_connection_name | The name of the VPN connection in the IDC center | "VPN-CONN-Test01" |
| idc_center_connection_pre_shared_key | The content of the pre-shared key used by the VPN connection in the IDC center | "Test@123" |
| cloud_side_gateway_name | The name of the VPN gateway in the IDC center | "VPN-GW-Test02" |
| cloud_side_gateway_availability_zones | The availability zones of the VPN gateway in the IDC center | [<br>  "cn-north-4a",<br>  "cn-north-4b"<br>] |
| cloud_side_gateway_public_eip_configurations | The EIP configurations of the public VPN gateway in the IDC center | <pre>[<br>  {<br>    "type": "5_bgp",<br>    "bandwidth_name": "VPN-GW-02-Master-EIP",<br>    "bandwidth_size": 5,<br>    "charge_mode": "traffic"<br>  },<br>  {<br>    "type": "5_bgp",<br>    "bandwidth_name": "VPN-GW-02-Slave-EIP",<br>    "bandwidth_size": 5,<br>    "charge_mode": "traffic"<br>  }<br>]</pre> |
| cloud_side_customer_gateway_name | The name of the VPN gateway in the IDC center | "VPN-Custom-GW-Test02" |
| cloud_side_connection_name | The name of the VPN connection in the IDC center | "VPN-CONN-Test02" |
| cloud_side_connection_pre_shared_key | The content of the pre-shared key used by the VPN connection in the IDC center | "Test@123" |
<!-- markdownlint-enable MD013 -->

## Outputs

| Name | Description |
|------|-------------|
| idc_center_connection_id | The ID of the VPN connection in the IDC center |
| cloud_side_connection_id | The ID of the VPN connection in the cloud side |
