resource "azurerm_subnet_route_table_association" "route_subnet_association" {
  subnet_id      = var.subnet_id
  route_table_id = azurerm_route_table.user_route.id
}