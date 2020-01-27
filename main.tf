locals {
  should_creare_vpn_gateway = var.enabled && var.vpn_gateway_enabled
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
  count               = var.enabled ? length(var.hub_name) : 0
  name                = element(var.hub_name, count.index)
  location            = element(var.hub_location, count.index)
  address_prefix      = element(var.address_prefix, count.index)
  resource_group_name = var.resource_group_name
  virtual_wan_id      = element(concat(azurerm_virtual_wan.this.*.id, [""]), 0)

  dynamic "route" {
    for_each = var.routes

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
  count               = local.should_creare_vpn_gateway ? length(var.hub_name) : 0
  name                = element(var.gateway_name, count.index)
  location            = element(var.gateway_location, count.index)
  virtual_hub_id      = element(azurerm_virtual_hub.this_hub.*.id, count.index)
  resource_group_name = var.resource_group_name
  bgp_settings {
    asn         = var.asn
    peer_weight = var.peer_weight
  }

  tags = merge(
    var.tags,
    var.gateway_tags,
    {
      Terraform = "true"
    },
  )

}
