output "object" {
  value = azurerm_route_table.route_table
}

output "id" {
  value = azurerm_route_table.route_table.id
}

output "name" {
  value = azurerm_route_table.route_table.name
}

output "subnets" {
  value = azurerm_route_table.route_table.subnets
}