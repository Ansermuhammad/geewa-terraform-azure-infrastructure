
output "rg_geewa_name_a" {
  value = azurerm_resource_group.rg_geewa_name_a.name
}

output "location_a" {
  value = azurerm_resource_group.rg_geewa_name_a.location
}

output "geewa_vnet_name_a-id" {
  value = azurerm_virtual_network.geewa_vnet_name_a.id
}

output "rg_geewa_name_b" {
  value = azurerm_resource_group.rg_geewa_name_b.name
}

output "location_b" {
  value = azurerm_resource_group.rg_geewa_name_b.location
}

output "geewa_vnet_name_b-id" {
  value = azurerm_virtual_network.geewa_vnet_name_b.id
}

output "geewa_subnet_name_a_id" {
  value = azurerm_subnet.geewa_subnet_name_a.id
}

output "geewa_subnet_name_b_id" {
  value = azurerm_subnet.geewa_subnet_name_b.id
}