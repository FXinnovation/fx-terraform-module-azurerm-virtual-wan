# terraform-module-azurerm-virtual-wan

## Usage
See `examples` folders for usage of this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| address\_prefixs | Address prefix of the which should be used for the virtual hub. | `list(string)` | <pre>[<br>  ""<br>]<br></pre> | no |
| allow\_branch\_to\_branch\_traffic | Boolean flag which describes whether to allow branch to branch traffic. | `bool` | `true` | no |
| allow\_vnet\_to\_vnet\_traffic | Boolean flag which describes whether to allow vnet to vnet traffic. | `bool` | `false` | no |
| disable\_vpn\_encryption | Boolean flag to specify whether to enable or diable the VPN encryption. | `bool` | `false` | no |
| enabled | Enable or diable this module | `bool` | `true` | no |
| gateway\_locations | List of regions where the vpn gateway will be created using this module. | `list(string)` | <pre>[<br>  ""<br>]<br></pre> | no |
| gateway\_names | List of gateway name that will be created inside this module. | `list(string)` | <pre>[<br>  ""<br>]<br></pre> | no |
| gateway\_tags | Tags specific to the vpn gateway. | `map` | `{}` | no |
| hub\_locations | List of regions where the virtual hub will be created using this module. | `list(string)` | <pre>[<br>  ""<br>]<br></pre> | no |
| hub\_names | List of virtual hub names that will be created. | `list(string)` | <pre>[<br>  ""<br>]<br></pre> | no |
| location | Specifies the location of the Virtual WAN. Changing this forces a new resource to be created. | `string` | `""` | no |
| name | Specifies the name of virtual WAN. Changing this forces a new resource to be created. | `string` | `""` | no |
| office365\_local\_breakout\_category | Describes the Offfice365 local breakout category.Possible value are `Optimize`, `OptimizaAndAllow`, `All`, `None` . | `string` | `"None"` | no |
| peer\_weights | The weight added to Routes learned from this BGP Speaker. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]<br></pre> | no |
| resource\_group\_name | Specifies the resource group where the virtual WAN is created. Changing this forces a new resource to be created. | `string` | `""` | no |
| routes | One or more hub route to create. | `list(object({ address_prefixes = list(string), next_hop_ip_address = string }))` | `[]` | no |
| tags | Tags shared by all resources of this module. Will be merged with any other specific tags by resource | `map` | `{}` | no |
| virtual\_hub\_tags | Tags specific to the virtual Hub. | `map` | `{}` | no |
| vpn\_gateway\_bgp\_asns | Autonomous system number (ASN) of BGP speaker. Changing this forces a new resourceto be created. | `list(string)` | `[]` | no |
| vpn\_gateway\_enabled | whether or not to create a vpn gateway | `bool` | `false` | no |
| vpn\_gateway\_hub\_ids | ids of the virtaul hub to whcih the vpn gateway is attached. Changing this will force to create new resource. | `list(string)` | <pre>[<br>  ""<br>]<br></pre> | no |
| wan\_tags | Tags specific to the virtual WAN. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| virtual\_hub\_ids | virtual hub ids |
| vpn\_gateway\_ids | ID of the vpn gateway created. |
| wan\_id | ids of the virtual wan |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
