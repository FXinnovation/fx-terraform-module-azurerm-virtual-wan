# terraform-module-virtual-wan

## Usage
See `examples` folders for usage of this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| address\_prefix | Address prefix of the which should be used for the virtual hub. | list(string) | n/a | yes |
| hub\_location | List of regions where the virtual hub will be created using this module. | list(string) | n/a | yes |
| hub\_name | List of virtual hub names that will be created. | list(string) | n/a | yes |
| location | Specifies the location of the Virtual WAN. Changing this forces a new resource to be created. | string | n/a | yes |
| name | Specifies the name of virtual WAN. Changing this forces a new resource to be created. | string | n/a | yes |
| resource\_group\_name | Specifies the resource group where the virtual WAN is created. Changing this forces a new resource to be created. | string | n/a | yes |
| allow\_branch\_to\_branch\_traffic | Boolean flag which describes whether to allow branch to branch traffic. | string | `"true"` | no |
| allow\_vnet\_to\_vnet\_traffic | Boolean flag which describes whether to allow vnet to vnet traffic. | string | `"false"` | no |
| asn | Autonomous system number \(ASN\) of BGP speaker. Changing this forces a new resourceto be created. | string | `""` | no |
| disable\_vpn\_encryption | Boolean flag to specify whether to enable or diable the VPN encryption. | string | `"false"` | no |
| enabled | Enable or diable this module | string | `"true"` | no |
| gateway\_location | List of regions where the vpn gateway will be created using this module. | list(string) | `[ "" ]` | no |
| gateway\_name | List of gateway name that will be created inside this module. | list(string) | `[ "" ]` | no |
| gateway\_tags | Tags specific to the vpn gateway. | map | `{}` | no |
| office365\_local\_breakout\_category | Describes the Offfice365 local breakout category.Possible value are `Optimize`, `OptimizaAndAllow`, `All`, `None` . | string | `"None"` | no |
| peer\_weight | The weight added to Routes learned from this BGP Speaker. Changing this forces a new resource to be created. | string | `""` | no |
| routes | One or more hub route to create. | object | `[]` | no |
| tags | Tags shared by all resources of this module. Will be merged with any other specific tags by resource | map | `{}` | no |
| virtual\_hub\_tags | Tags specific to the virtual Hub. | map | `{}` | no |
| vpn\_gateway\_enabled | whether or not to create a vpn gateway | string | `"false"` | no |
| wan\_tags | Tags specific to the virtual WAN. | map | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| bgp\_address |  |
| virtual\_hub\_ids |  |
| vpn\_gateway\_ids |  |
| wan\_id |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
