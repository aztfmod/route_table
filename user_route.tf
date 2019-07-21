#Reference https://www.terraform.io/docs/providers/azurerm/r/route_table.html  

resource "azurerm_route_table" "user_route" {
  name                          = var.route_name
  location                      = var.location
  resource_group_name           = var.route_resource_group
  disable_bgp_route_propagation = false

  tags                          = var.tags
  route {
    name           = "DefaultInet"
    address_prefix = var.route_prefix
    next_hop_type  = var.route_nexthop
  }
}