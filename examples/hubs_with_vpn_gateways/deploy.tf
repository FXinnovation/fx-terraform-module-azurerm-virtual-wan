resource "random_string" "this" {
  length  = 4
  upper   = false
  special = false
}

module "resource_group_demo" {
  source   = "git::https://github.com/FXinnovation/fx-terraform-module-azurerm-resource-group.git?ref=1.0.0"
  location = "francecentral"
  name     = "tftest${random_string.this.result}"
}

resource "azurerm_virtual_network" "example" {
  name                = "test${random_string.this.result}"
  address_space       = ["10.0.0.0/16"]
  location            = "francecentral"
  resource_group_name = module.resource_group_demo.name
}


module "example" {
  source = "../.."

  resource_group_name = module.resource_group_demo.name
  location            = "francecentral"
  tags = {
    env = "test"
  }

  name             = "tftest${random_string.this.result}"
  hub_names        = ["foto", "fxterratest", ]
  hub_locations    = ["francecentral", "canadacentral"]
  address_prefixes = ["10.0.0.0/24", "10.0.1.0/24"]

  routes = [
    [
      { address_prefixes = ["10.0.3.0/24"], next_hop_ip_address = "10.0.100.4" },
      { address_prefixes = ["10.0.4.0/24"], next_hop_ip_address = "10.0.161.4" },
    ],
    [
      { address_prefixes = ["10.0.5.0/24"], next_hop_ip_address = "10.0.200.4" }
    ],
  ]

  virtual_hub_tags = {
    env = "testtf"
  }

  vpn_gateway_enabled               = true
  gateway_names                     = ["boo"]
  gateway_locations                 = ["canadacentral"]
  vpn_gateway_hub_ids               = ["fxterratest"]
  vpn_gateway_settings_bgp_asns     = ["65515"]
  vpn_gateway_settings_peer_weights = ["0"]
}
