module "resource_group_demo" {
  source = "git::https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/terraform-module-azurerm-resource-group.git?ref=0.2.0"

  enabled  = false
  location = "francecentral"
  name     = "tftest"
}

module "example" {
  source = "../.."

  enabled             = false
  name                = "tftest"
  location            = "francecentral"
  resource_group_name = module.resource_group_demo.name
  hub_names           = ["boo"]
  hub_locations       = ["francecentral"]
  address_prefixs     = ["10.0.0.0/24"]

}
