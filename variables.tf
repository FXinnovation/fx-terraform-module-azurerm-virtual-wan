###
# General
###

variable "enabled" {
  description = "Enable or diable this module"
  default     = true
}

variable "resource_group_name" {
  description = "Specifies the resource group where the virtual WAN is created. Changing this forces a new resource to be created."
  type        = string
}

variable "tags" {
  description = "Tags shared by all resources of this module. Will be merged with any other specific tags by resource"
  default     = {}
}

###
# WAN
###

variable "name" {
  description = "Specifies the name of virtual WAN. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "Specifies the location of the Virtual WAN. Changing this forces a new resource to be created."
  type        = string
}

variable "disable_vpn_encryption" {
  description = "Boolean flag to specify whether to enable or diable the VPN encryption."
  default     = false
}

variable "allow_vnet_to_vnet_traffic" {
  description = "Boolean flag which describes whether to allow vnet to vnet traffic."
  default     = false
}

variable "allow_branch_to_branch_traffic" {
  description = "Boolean flag which describes whether to allow branch to branch traffic."
  default     = true
}

variable "office365_local_breakout_category" {
  description = "Describes the Offfice365 local breakout category.Possible value are `Optimize`, `OptimizaAndAllow`, `All`, `None` ."
  default     = "None"
}

variable "wan_tags" {
  description = "Tags specific to the virtual WAN."
  default     = {}
}

###
# virtual hub
###

variable "hub_name" {
  description = "List of virtual hub names that will be created."
  type        = list(string)
}

variable "hub_location" {
  description = "List of regions where the virtual hub will be created using this module."
  type        = list(string)
}

variable "address_prefix" {
  description = "Address prefix of the which should be used for the virtual hub."
  type        = list(string)
}

variable "routes" {
  description = "One or more hub route to create."
  type        = list(object({ address_prefixes = list(string), next_hop_ip_address = string }))
  default     = []
}

variable "virtual_hub_tags" {
  description = "Tags specific to the virtual Hub."
  default     = {}
}

###
# vpn gateway
###

variable "vpn_gateway_enabled" {
  description = "whether or not to create a vpn gateway"
  default     = false
}

variable "gateway_name" {
  description = "List of gateway name that will be created inside this module."
  type        = list(string)
  default     = [""]
}

variable "gateway_location" {
  description = "List of regions where the vpn gateway will be created using this module."
  type        = list(string)
  default     = [""]
}

variable "asn" {
  description = "Autonomous system number (ASN) of BGP speaker. Changing this forces a new resourceto be created."
  default     = ""
}

variable "peer_weight" {
  description = "The weight added to Routes learned from this BGP Speaker. Changing this forces a new resource to be created."
  default     = ""
}

variable "gateway_tags" {
  description = "Tags specific to the vpn gateway."
  default     = {}
}
