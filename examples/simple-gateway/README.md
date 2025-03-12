# Public VPN gateway example

Configuration in this directory creates a single VPN gateway and associate two EIP to enable the public network access.

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
| vpn_network | [terraform-huaweicloud-vpc](https://github.com/terraform-huaweicloud-modules/terraform-huaweicloud-vpc) | v1.2.0 |
| vpn_gateway | [../../modules/vpn-gateway](../../modules/vpn-gateway/README.md) | N/A |
<!-- markdownlint-enable MD013 -->

## Resources

| Name | Type |
|------|------|
| data.huaweicloud_availability_zones.this | data source |
| data.huaweicloud_vpn_gateway_availability_zones.this | data source |

## Inputs

<!-- markdownlint-disable MD013 -->
| Name | Description | Value |
|------|-------------|-------|
| region_name | The region where the resources are located | `"cn-north-4"` |
| enterprise_project_id | Used to specify whether the resource is created under the enterprise project (this parameter is only valid for enterprise users) | `"0"` |
| vpc_name | The name of the VPC resource | `"VPC-Test"` |
| vpc_cidr | The CIDR block of the VPC resource | `"172.16.0.0/24"` |
| subnets_configuration | The configuration for the subnet resources to which the VPC belongs | <pre>[<br>  {<br>    "name": "VPC-Subnet-Test",<br>    "cidr": "172.16.0.0/24",<br>    "ipv6_enabled": false,<br>    "dhcp_enabled": false<br>  }<br>]</pre> |
| gateway_name | The name of the VPN gateway | `"VPN-GW-Test"` |
| gateway_public_eip_configurations | The EIP configurations of the public VPN gateway | <pre>[<br>  {<br>    "type": "5_bgp",<br>    "bandwidth_name": "VPN-GW-Test-EIP-01",<br>    "bandwidth_size": 5,<br>    "charge_mode": "traffic"<br>  },<br>  {<br>    "type": "5_bgp",<br>    "bandwidth_name": "VPN-GW-Test-EIP-02",<br>    "bandwidth_size": 5,<br>    "charge_mode": "traffic"<br>  }<br>]</pre> |
| delete_eip_on_termination | Whether to delete the EIP when the VPN gateway is deleted | `true` |
<!-- markdownlint-enable MD013 -->

## Outputs

| Name | Description |
|------|-------------|
| gateway_id | The ID of the VPN gateway |
