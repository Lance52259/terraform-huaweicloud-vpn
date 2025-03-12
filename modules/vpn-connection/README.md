# VPN connection management

Manages the VPN connection resource.

## Notes

If you want to manage an existing VPN connection using Terraform (otherwise why are you reading this?) you need to
import this resource like this:

```bash
$ terraform import module.vpn-customer-gateway.huaweicloud_vpn_connection.this[0] "connection_id"

module.vpn-gateway.huaweicloud_vpn_connection.this[0]: Importing from ID "connection_id"...
module.vpn-gateway.huaweicloud_vpn_connection.this[0]: Import complete!
  Imported huaweicloud_vpn_connection (ID: connection_id)
module.vpn-gateway.huaweicloud_vpn_connection.this[0]: Refreshing state... (ID: connection_id)

Import successful!
```

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
| huaweicloud_vpn_connection.this | resource |

## Inputs

<!-- markdownlint-disable MD013 -->
| Name | Description | Type | Default | Required |
|------|-------------|------|:-------:|:--------:|
| is_connection_create | Controls whether a VPN connection should be created | `bool` | `true` | N |
| connection_name | The name of the VPN connection | `string` | `""` | Y (Unless is_connection_create is specified as false) |
| connection_gateway_id | The ID of the VPN gateway used by the VPN connection | `string` | `""` | Y (Unless is_connection_create is specified as false) |
| connection_gateway_ip | The IP address of the VPN gateway used by the VPN connection | `string` | `""` | Y (Unless is_connection_create is specified as false) |
| connection_customer_gateway_id | The ID of the customer gateway used by the VPN connection | `string` | `""` | Y (Unless is_connection_create is specified as false) |
| connection_vpn_type | The type of the VPN connection | `string` | `"static"` | N |
| connection_pre_shared_key | The content of the pre-shared key | `string` | `""` | N |
| connection_peer_subnets | The CIDR list of the customer subnets | <pre>list(string)</pre> | <pre>[]</pre> | N |
| connection_tunnel_local_address | The local tunnel address of the VPN connection | `string` | `""` | N |
| connection_tunnel_peer_address | The local peer address of the VPN connection | `string` | `""` | N |
| connection_enable_nqa | Whether to enable NQA check for the VPN connection | `bool` | `null` | N |
| connection_tags | The tags of the VPN connection | <pre>map(string)</pre> | <pre>{}</pre> | N |
| connection_ha_role | The mode of the VPN connection | `string` | `""` | N |
| connection_ikepolicy | The IKE policy of the VPN connection | <pre>list(object({<br>  authentication_algorithm = optional(string, null)<br>  encryption_algorithm     = optional(string, null)<br>  ike_version              = optional(string, null)<br>  lifetime_seconds         = optional(number, null)<br>  local_id_type            = optional(string, null)<br>  local_id                 = optional(string, null)<br>  peer_id_type             = optional(string, null)<br>  peer_id                  = optional(string, null)<br>  phase1_negotiation_mode  = optional(string, null)<br>  authentication_method    = optional(string, null)<br>  dh_group                 = optional(string, null)<br>  dpd                      = optional(list(object({<br>    timeout  = optional(number, null)<br>    interval = optional(number, null)<br>    msg      = optional(string, null)<br>  })), [])<br>}))</pre> | <pre>[]</pre> | N |
| connection_ipsecpolicy | The IPsec policy of the VPN connection | <pre>list(object({<br>  authentication_algorithm = optional(string, null)<br>  encryption_algorithm     = optional(string, null)<br>  pfs                      = optional(string, null)<br>  lifetime_seconds         = optional(number, null)<br>  transform_protocol       = optional(string, null)<br>  encapsulation_mode       = optional(string, null)<br>}))</pre> | <pre>{}</pre> | N |
| connection_policy_rules | The certificate configuration of the public VPN gateway | <pre>list(object({<br>  rule_index  = optional(number, null)<br>  source      = optional(list(string), null)<br>  destination = optional(string, null)<br>}))</pre> | <pre>[]</pre> | N |
<!-- markdownlint-enable MD013 -->

## Outputs

| Name | Description |
|------|-------------|
| connection_id | The ID of the VPN connection |
