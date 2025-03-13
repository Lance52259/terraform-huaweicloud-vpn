# VPN Gateway management

Manages the VPN gateway resource.

## Notes

### How to import resources in the module structure

If you want to manage an existing VPN gateway using Terraform (otherwise why are you reading this?) you need to make
sure that the corresponding module script has been defined in your `.tf` file, like this:

```hcl
# Manages a VPN gateway.
module "vpn_gateway" {
  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-vpn/modules/vpn-gateway"

  ...
}
```

Then, execute the following command to import the corresponding resource into the management of the `.tfstate` file.

```bash
$ terraform import module.vpn_gateway.huaweicloud_vpn_gateway.this[0] "gateway_id"

module.vpn_gateway.huaweicloud_vpn_gateway.this[0]: Importing from ID "gateway_id"...
module.vpn_gateway.huaweicloud_vpn_gateway.this[0]: Import complete!
  Imported huaweicloud_vpn_gateway (ID: gateway_id)
module.vpn_gateway.huaweicloud_vpn_gateway.this[0]: Refreshing state... (ID: gateway_id)

Import successful!
```

### What should we do before deploy this module example

Before manage VPN resources, the access key (AK, the corresponding environment name is `HW_ACCESS_KEY`) and the secret key (SK, the corresponding environment name is `HW_SECRET_KEY`) should be configured.

For the linux VM, you can configure the corresponding environment variables with the following commands:

```bash
$ export HW_ACCESS_KEY=XXXXXXXXXXXXXXXXXXXX
$ export HW_SECRET_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

Refer to this [document](https://support.huaweicloud.com/intl/en-us/devg-apisign/api-sign-provide-aksk.html) for AK/SK information obtain.

## Contributing

Report issues/questions/feature requests in the [issues](https://github.com/terraform-huaweicloud-modules/terraform-huaweicloud-vpn/issues/new)
section.

Full contributing [guidelines are covered here](../../github/how_to_contribute.md).

## Requirements

| Name | Version |
|------|---------|
| Terraform | >= 1.3.0 |
| Huaweicloud Provider | >= 1.73.0 |

## Modules

No module.

## Resources

| Name | Type |
|------|------|
| huaweicloud_vpn_gateway.this | resource |

## Inputs

<!-- markdownlint-disable MD013 -->
| Name | Description | Type | Default | Required |
|------|-------------|------|:-------:|:--------:|
| enterprise_project_id | Used to specify whether the resource is created under the enterprise project (this parameter is only valid for enterprise users) | `string` | `""` | N |
| is_gateway_create | Controls whether a VPN should be created | `bool` | `true` | N |
| gateway_name | The name of the VPN gateway | `string` | `""` | Y (Unless is_gateway_create is specified as false) |
| gateway_availability_zones | The availability zones of the VPN gateway | <pre>list(string)</pre> | <pre>[]</pre> | Y (Unless is_gateway_create is specified as false) |
| gateway_flavor | The flavor type of the VPN gateway | `string` | `"Basic"` | N |
| gateway_attachment_type | The attachment type of the VPN gateway | `string` | `"vpc"` | N |
| gateway_network_type | The network type of the VPN gateway | `string` | `"public"` | N |
| gateway_vpc_id | The ID of the VPC to which the VPN gateway is connected | `string` | `""` | N |
| gateway_local_subnet_cidrs | The CIDR blocks that is in the VPC and needs to connect to the on-premises network through the VPN gateway | <pre>list(string)</pre> | <pre>[]</pre> | N |
| gateway_interconnection_subnet_id | The VPC subnet reserved for the P2C VPN gateway | `string` | `""` | N |
| gateway_er_instance_id | The enterprise router ID to attach with the VPN gateway | `string` | `""` | N |
| gateway_ha_mode | The HA mode of the VPN gateway | `string` | `"active-active"` | N |
| gateway_bgp_asn | The BGP ASN number of the VPN gateway | `number` | `null` | N |
| gateway_tags | The key/value pairs to associate with the VPN gateway | <pre>map(string)</pre> | <pre>{}</pre> | N |
| delete_eip_on_termination | Whether to delete the EIP when the VPN gateway is deleted | `bool` | `null` | N |
| gateway_access_vpc_id | The access VPC ID of the private VPN gateway | `string` | `""` | N |
| gateway_access_subnet_id | The access subnet ID of the private VPN gateway | `string` | `""` | N |
| gateway_access_private_ips | The access IP addresses of the private VPN gateway | `string` | `""` | N |
| gateway_public_eip_configurations | The EIP configurations of the public VPN gateway | <pre>list(object({<br>  id             = optional(string, null)<br>  type           = optional(string, null)<br>  bandwidth_name = optional(string, null)<br>  bandwidth_size = optional(number, null)<br>  charge_mode    = optional(string, null)<br>}))</pre> | <pre>[]</pre> | N |
| gateway_certificate | The certificate configuration of the public VPN gateway | <pre>list(object({<br>  name              = optional(string, null)<br>  content           = optional(string, null)<br>  private_key       = optional(string, null)<br>  certificate_chain = optional(string, null)<br>  enc_certificate   = optional(string, null)<br>  enc_private_key   = optional(string, null)<br>}))</pre> | <pre>[]</pre> | N |
<!-- markdownlint-enable MD013 -->

## Outputs

| Name | Description |
|------|-------------|
| gateway_id | The ID of the VPN gateway |
| gateway_er_attachment_id | The ER attachment ID to associate with the VPN gateway |
| gateway_master_public_ip_address | The master EIP address of the public VPN gateway |
| gateway_master_public_ip_id | The master EIP ID of the public VPN gateway |
| gateway_slave_public_ip_address | The slave EIP address of the public VPN gateway |
| gateway_slave_public_ip_id | The slave EIP ID of the public VPN gateway |
