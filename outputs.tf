###
# WAN
###

output "wan_id" {
  description = "ids of the virtual wan"
  value       = concat(azurerm_virtual_wan.this.*.id, [""])[0]
}

###
# Virtual hub
###

output "virtual_hub_ids" {
  description = "virtual hub ids"
  value       = compact(concat(azurerm_virtual_hub.this_hub.*.id, [""]))
}

###
# Vpn Gateway
###

output "vpn_gateway_ids" {
  description = "ID of the vpn gateway created."
  value       = compact(concat(azurerm_vpn_gateway.this_gateway.*.id, [""]))
}

output "bgp_address" {
  value = compact(concat(azurerm_vpn_gateway.this_gateway.*.bgp_peering_address, [""]))
}
