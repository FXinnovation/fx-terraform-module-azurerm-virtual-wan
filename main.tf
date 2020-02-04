###
# locals
###

locals {
  should_create_vpn_gateway = var.enabled && var.vpn_gateway_enabled
  vpn_hub_id                = var.enabled ? zipmap(var.hub_names, compact(concat(azurerm_virtual_hub.this_hub.*.id, [""]))) : {}
}

###
# Virtual WAN
###

resource "azurerm_virtual_wan" "this" {
  count                             = var.enabled ? 1 : 0
  name                              = var.name
  location                          = var.location
  resource_group_name               = var.resource_group_name
  disable_vpn_encryption            = var.disable_vpn_encryption
  allow_vnet_to_vnet_traffic        = var.allow_vnet_to_vnet_traffic
  allow_branch_to_branch_traffic    = var.allow_branch_to_branch_traffic
  office365_local_breakout_category = var.office365_local_breakout_category

  tags = merge(
    var.tags,
    var.wan_tags,
    {
      Terraform = "true"
    },
  )
}

###
# Virtual hub
###

resource "azurerm_virtual_hub" "this_hub" {
  count               = var.enabled ? length(var.hub_names) : 0
  name                = var.hub_names[count.index]
  location            = var.hub_locations[count.index]
  address_prefix      = var.address_prefixes[count.index]
  resource_group_name = var.resource_group_name
  virtual_wan_id      = element(concat(azurerm_virtual_wan.this.*.id, [""]), 0)

  dynamic "route" {
    for_each = var.routes[count.index]

    content {
      address_prefixes    = route.value.address_prefixes
      next_hop_ip_address = route.value.next_hop_ip_address
    }
  }

  tags = merge(
    var.tags,
    var.virtual_hub_tags,
    {
      Terraform = "true"
    },
  )

}

###
# vpn gateway
###

resource "azurerm_vpn_gateway" "this_gateway" {
  count               = local.should_create_vpn_gateway ? length(var.gateway_names) : 0
  name                = var.gateway_names[count.index]
  location            = var.gateway_locations[count.index]
  virtual_hub_id      = lookup(local.vpn_hub_id, element(var.vpn_gateway_hub_ids, count.index), null)
  resource_group_name = var.resource_group_name
  bgp_settings {
    asn         = var.vpn_gateway_settings_bgp_asns[count.index]
    peer_weight = var.vpn_gateway_settings_peer_weights[count.index]
  }
  depends_on = [azurerm_virtual_hub.this_hub]
  tags = merge(
    var.tags,
    var.gateway_tags,
    {
      Terraform = "true"
    },
  )

}
