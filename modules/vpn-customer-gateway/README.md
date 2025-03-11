# VPN customer Gateway management

Manages the VPN customer gateway resource.

## Notes

If you want to manage an existing VPN customer gateway using Terraform (otherwise why are you reading this?) you need
to import this resource like this:

```bash
$ terraform import module.vpn-customer-gateway.huaweicloud_vpn_customer_gateway.this[0] "customer_gateway_id"

module.vpn-gateway.huaweicloud_vpn_customer_gateway.this[0]: Importing from ID "customer_gateway_id"...
module.vpn-gateway.huaweicloud_vpn_customer_gateway.this[0]: Import complete!
  Imported huaweicloud_vpn_customer_gateway (ID: customer_gateway_id)
module.vpn-gateway.huaweicloud_vpn_customer_gateway.this[0]: Refreshing state... (ID: customer_gateway_id)

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
| huaweicloud_vpn_customer_gateway.this | resource |

## Inputs

<!-- markdownlint-disable MD013 -->
| Name | Description | Type | Default | Required |
|------|-------------|------|:-------:|:--------:|
| is_customer_gateway_create | Controls whether a VPN customer gateway should be created | bool | true | N |
| customer_gateway_name | The name of the VPN gateway | string | "" | Y (Unless is_customer_gateway_create is specified as false) |
| customer_gateway_id_type | The identifier type of the VPN customer gateway | string | "ip" | Y |
| customer_gateway_id_value | The identifier of the VPN customer gateway | string | "" | Y (Unless is_customer_gateway_create is specified as false) |
| customer_gateway_bgp_asn | The BGP ASN number of the VPN customer gateway | number | null | N |
| customer_gateway_certificate_content | The CA certificate content of the VPN customer gateway | string | "" | N |
| customer_gateway_tags | The key/value pairs to associate with the VPN customer gateway | <pre>map(string)</pre> | <pre>{}</pre> | N |
<!-- markdownlint-enable MD013 -->

## Outputs

| Name | Description |
|------|-------------|
| customer_gateway_id | The ID of the VPN customer gateway |
| customer_gateway_certificate_id | The ID of the customer customer gateway certificate |
| customer_gateway_serial_number | The serial number (SN) of the VPN customer gateway certificate |
| customer_gateway_subject | The subject of the VPN customer gateway certificate |
| customer_gateway_certificate_expire_time | The expire time of the VPN customer gateway |
