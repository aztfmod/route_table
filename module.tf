#Reference https://www.terraform.io/docs/providers/azurerm/r/route_table.html  

resource "azurerm_route_table" "route_table" {
  name                          = var.route_table.name
  location                      = var.route_table.location
  resource_group_name           = var.route_table.rg
  tags                          = var.tags
  disable_bgp_route_propagation = var.route_table.disable_bgp_route_propagation
  
  dynamic "route" {
    for_each = var.route_table.route_entries
    content {
              name                        = route.value.name 
              address_prefix              = route.value.prefix
              next_hop_type               = route.value.next_hop_type
              next_hop_in_ip_address      = "${contains(keys(route.value), "next_hop_in_ip_address") ? route.value.next_hop_in_ip_address : null}"
            }
    } 
}