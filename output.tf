output "user_route" {
  //exports ID, pip, config settings, rules? 
  value = azurerm_route_table.user_route
}

output "subnet_route" {
  value = azurerm_subnet_route_table_association.route_subnet_association
}
