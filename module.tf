#Reference https://www.terraform.io/docs/providers/azurerm/r/route_table.html

resource "azurerm_route_table" "route_table" {
  name                          = var.route_table.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  tags                          = local.tags
  disable_bgp_route_propagation = lookup(var.route_table, "disable_bgp_route_propagation", null)

  dynamic "route" {
    for_each = flatten(
      [
          for route_key,route_value in var.route_table.route_entries:
          [
            for address_key, address_value in flatten(list(route_value.address_prefix)): # flatten(list()) handles support for both array & string
            {
              name                   = replace(join("-",list(route_value.name,address_value)),"/","_") # build name from route table name + address prefix, escape slash
              address_prefix         = address_value
              next_hop_type          = route_value.next_hop_type
              next_hop_in_ip_address = route_value.next_hop_type == "VirtualAppliance" ? (var.next_hop_in_dynamic_private_ip != null && var.next_hop_in_dynamic_private_ip != "null" && var.next_hop_in_dynamic_private_ip != "" ? var.next_hop_in_dynamic_private_ip : route.value.next_hop_in_ip_address) : null
            }
          ]
      ]
    )
    
    content {
      name                   = route.value.name
      address_prefix         = route.value.address_prefix
      next_hop_type          = route.value.next_hop_type
      next_hop_in_ip_address = route.value.next_hop_in_ip_address
    }
  }
}