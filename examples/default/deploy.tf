resource "random_string" "this" {
  length  = 4
  upper   = false
  special = false
}

module "resource_group_demo" {
  source   = "git::https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/terraform-module-azurerm-resource-group.git?ref=0.2.0"
  location = "francecentral"
  name     = "tftest${random_string.this.result}"
}

resource "azurerm_virtual_network" "example" {
  name                = "tftest${random_string.this.result}"
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
  hub_names        = ["foo"]
  hub_locations    = ["francecentral"]
  address_prefixes = ["10.0.0.0/24"]

  routes = [
    [
      { address_prefixes = ["10.0.3.0/24"], next_hop_ip_address = "10.0.200.4" }
    ],
  ]

  virtual_hub_tags = {
    env = "testtf"
  }
}
