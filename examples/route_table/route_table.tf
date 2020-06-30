provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "azurecaf_naming_convention" "rg_test" {
  name          = local.resource_groups.test.name
  prefix        = local.prefix != "" ? local.prefix : null
  postfix       = local.postfix != "" ? local.postfix : null
  max_length    = local.max_length != "" ? local.max_length : null
  resource_type = "azurerm_resource_group"
  convention    = local.convention
}

resource "azurerm_resource_group" "rg_test" {
  name     = azurecaf_naming_convention.rg_test.result
  location = local.resource_groups.test.location
  tags     = local.tags
}


module "route_table" {
  source = "../.."

  prefix     = local.prefix
  tags       = local.tags
  convention = local.convention

  resource_group_name            = azurerm_resource_group.rg_test.name
  location                       = local.location
  route_table                    = local.route_table
  next_hop_in_dynamic_private_ip = local.next_hop_in_dynamic_private_ip
}