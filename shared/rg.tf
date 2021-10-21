resource "azurerm_resource_group" "rg_geewa_name_a" {
  name     = var.rg_geewa_name_a
  location = var.location_a
  tags = var.tags
}

resource "azurerm_resource_group" "rg_geewa_name_b" {
  name     = var.rg_geewa_name_b
  location = var.location_b
  tags = var.tags
}
