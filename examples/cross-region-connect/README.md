# Network interconnection between two different regions

Use the VPN resources to connect two VPC networks in different regions.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan -var-file=variables.json
$ terraform apply -var-file=variables.json
```

Run `terraform destroy -var-file=variables.json` when you don't need these resources.

## Requirements

| Name | Version |
|------|---------|
| Terraform | >= 1.3.0 |
| Huaweicloud Provider | >= 1.73.0 |

## Modules

<!-- markdownlint-disable MD013 -->
| Name | Source | Version |
|------|--------|---------|
| idc_center_network | [terraform-huaweicloud-vpc](https://github.com/terraform-huaweicloud-modules/terraform-huaweicloud-vpc) | v1.2.0 |
| idc_center_vpn_gateway | [../../modules/vpn-gateway](../../modules/vpn-gateway/README.md) | N/A |
| idc_center_vpn_customer_gateway | [../../modules/vpn-customer-gateway](../../modules/vpn-customer-gateway/README.md) | N/A |
| idc_center_vpn_connection | [../../modules/vpn-connection](../../modules/vpn-connection/README.md) | N/A |
| cloud_side_network | [terraform-huaweicloud-vpc](https://github.com/terraform-huaweicloud-modules/terraform-huaweicloud-vpc) | v1.2.0 |
| cloud_side_vpn_gateway | [../../modules/vpn-gateway](../../modules/vpn-gateway/README.md) | N/A |
| cloud_side_vpn_customer_gateway | [../../modules/vpn-customer-gateway](../../modules/vpn-customer-gateway/README.md) | N/A |
| cloud_side_vpn_connection | [../../modules/vpn-connection](../../modules/vpn-connection/README.md) | N/A |
<!-- markdownlint-enable MD013 -->

## Resources

| Name | Type |
|------|------|
| data.huaweicloud_availability_zones.idc_center | data source |
| data.huaweicloud_availability_zones.cloud_side | data source |

## Inputs

<!-- markdownlint-disable MD013 -->
| Name | Description | Value |
|------|-------------|-------|
| idc_center_region_name | The region where the IDC center resources are located | `"cn-east-3"` |
| cloud_side_region_name | The region where the cloud side resources are located | `"cn-north-4"` |
| enterprise_project_id | Used to specify whether the resources are created under the enterprise project (this parameter is only valid for enterprise users) | `"0"` |
| idc_center_vpc_name | The name of the VPC resource in the IDC center | `"VPC-Test01"` |
| idc_center_vpc_cidr | The CIDR block of the VPC resource in the IDC center | `"172.18.0.0/24"` |
| idc_center_subnets_configuration | The configuration for the subnet resources to which the VPC (in the IDC center) belongs | <pre>[<br>  {<br>    "name": "VPC-Subnet-Test01",<br>    "cidr": "172.18.0.0/24"<br>  }<br>]</pre> |
| cloud_side_vpc_name | The name of the VPC resource in the cloud side | `"VPC-Test02"` |
| cloud_side_vpc_cidr | The CIDR block of the VPC resource in the cloud side | `"172.16.0.0/24"` |
| cloud_side_subnets_configuration | The configuration for the subnet resources to which the VPC (in the cloud side) belongs | <pre>[<br>  {<br>    "name": "VPC-Subnet-Test02",<br>    "cidr": "172.16.0.0/24"<br>  }<br></pre>] |
| idc_center_gateway_name | The name of the VPN gateway in the IDC center | `"VPN-GW-Test01"` |
| idc_center_gateway_availability_zones | The availability zones of the VPN gateway in the IDC center | <pre>[<br>  "cn-east-3a",<br>  "cn-east-3c"<br>]</pre> |
| idc_center_gateway_public_eip_configurations | The EIP configurations of the public VPN gateway in the IDC center | <pre>[<br>  {<br>    "type": "5_bgp",<br>    "bandwidth_name": "VPN-GW-01-Master-EIP",<br>    "bandwidth_size": 5,<br>    "charge_mode": "traffic"<br>  },<br>  {<br>    "type": "5_bgp",<br>    "bandwidth_name": "VPN-GW-01-Slave-EIP",<br>    "bandwidth_size": 5,<br>    "charge_mode": "traffic"<br>  }<br>]</pre> |
| idc_center_customer_gateway_name | The name of the VPN gateway in the IDC center | `"VPN-Custom-GW-Test01"` |
| idc_center_connection_name | The name of the VPN connection in the IDC center | `"VPN-CONN-Test01"` |
| idc_center_connection_pre_shared_key | The content of the pre-shared key used by the VPN connection in the IDC center | `"Test@123"` |
| cloud_side_gateway_name | The name of the VPN gateway in the IDC center | `"VPN-GW-Test02"` |
| cloud_side_gateway_availability_zones | The availability zones of the VPN gateway in the IDC center | <pre>[<br>  "cn-north-4a",<br>  "cn-north-4b"<br>]</pre> |
| cloud_side_gateway_public_eip_configurations | The EIP configurations of the public VPN gateway in the IDC center | <pre>[<br>  {<br>    "type": "5_bgp",<br>    "bandwidth_name": "VPN-GW-02-Master-EIP",<br>    "bandwidth_size": 5,<br>    "charge_mode": "traffic"<br>  },<br>  {<br>    "type": "5_bgp",<br>    "bandwidth_name": "VPN-GW-02-Slave-EIP",<br>    "bandwidth_size": 5,<br>    "charge_mode": "traffic"<br>  }<br>]</pre> |
| cloud_side_customer_gateway_name | The name of the VPN gateway in the IDC center | `"VPN-Custom-GW-Test02"` |
| cloud_side_connection_name | The name of the VPN connection in the IDC center | `"VPN-CONN-Test02"` |
| cloud_side_connection_pre_shared_key | The content of the pre-shared key used by the VPN connection in the IDC center | `"Test@123"` |
<!-- markdownlint-enable MD013 -->

## Outputs

| Name | Description |
|------|-------------|
| idc_center_connection_id | The ID of the VPN connection in the IDC center |
| cloud_side_connection_id | The ID of the VPN connection in the cloud side |
