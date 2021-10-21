resource "azurerm_virtual_network" "geewa_vnet_name_a" {
  name                = var.geewa_vnet_name_a
  location            = azurerm_resource_group.rg_geewa_name_a.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_a.name
  address_space = [var.geewa_vnet_address_prefix_a]
  tags = var.tags
  depends_on = [azurerm_resource_group.rg_geewa_name_a]
}

resource "azurerm_subnet" "geewa_subnet_name_a" {
  name                 = var.geewa_subnet_name_a
  address_prefixes     = [var.geewa_subnet_address_prefix_a]
  resource_group_name  = azurerm_resource_group.rg_geewa_name_a.name
  virtual_network_name = azurerm_virtual_network.geewa_vnet_name_a.name
  depends_on = [azurerm_virtual_network.geewa_vnet_name_a]
}

resource "azurerm_virtual_network" "geewa_vnet_name_b" {
  name                = var.geewa_vnet_name_b
  location            = azurerm_resource_group.rg_geewa_name_b.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_b.name
  address_space = [var.geewa_vnet_address_prefix_b]
  tags = var.tags
  depends_on = [azurerm_resource_group.rg_geewa_name_b]
}

resource "azurerm_subnet" "geewa_subnet_name_b" {
  name                 = var.geewa_subnet_name_b
  address_prefixes     = [var.geewa_subnet_address_prefix_b]
  resource_group_name  = azurerm_resource_group.rg_geewa_name_b.name
  virtual_network_name = azurerm_virtual_network.geewa_vnet_name_b.name
  depends_on = [azurerm_virtual_network.geewa_vnet_name_b]
}

resource "azurerm_virtual_network_peering" "peering_geewa_vnet_a_to_geewa_vnet_b_name" {
  name                      = var.peering_geewa_vnet_a_to_geewa_vnet_b_name
  resource_group_name       = azurerm_resource_group.rg_geewa_name_b.name
  virtual_network_name      = azurerm_virtual_network.geewa_vnet_name_b.name
  remote_virtual_network_id = azurerm_virtual_network.geewa_vnet_name_a.id
  allow_virtual_network_access = true
  depends_on = [azurerm_virtual_network.geewa_vnet_name_b,azurerm_virtual_network.geewa_vnet_name_b]
}

resource "azurerm_virtual_network_peering" "peering_geewa_vnet_b_to_geewa_vnet_a_name" {
  name                      = var.peering_geewa_vnet_b_to_geewa_vnet_a_name
  resource_group_name       = azurerm_resource_group.rg_geewa_name_a.name
  virtual_network_name      = azurerm_virtual_network.geewa_vnet_name_a.name
  remote_virtual_network_id = azurerm_virtual_network.geewa_vnet_name_b.id
  allow_virtual_network_access = true
  depends_on = [azurerm_virtual_network.geewa_vnet_name_b,azurerm_virtual_network.geewa_vnet_name_b]
}

resource "azurerm_subnet" "bastion_subnet_name" {
  name                 = var.bastion_subnet_name
  address_prefixes     = [var.bastion_subnet_address_prefix]
  resource_group_name  = azurerm_resource_group.rg_geewa_name_a.name
  virtual_network_name = azurerm_virtual_network.geewa_vnet_name_a.name
  depends_on = [azurerm_virtual_network.geewa_vnet_name_a]
}

resource "azurerm_public_ip" "bastion_publicip_name" {
  name                = var.bastion_publicip_name
  location            = azurerm_resource_group.rg_geewa_name_a.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_a.name
  allocation_method   = "Static"
  sku                 = "Standard"
  depends_on = [azurerm_resource_group.rg_geewa_name_a]
}

resource "azurerm_bastion_host" "bastion_host_name" {
  name                = var.bastion_host_name
  location            = azurerm_resource_group.rg_geewa_name_a.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_a.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastion_subnet_name.id
    public_ip_address_id = azurerm_public_ip.bastion_publicip_name.id
  }
  depends_on = [azurerm_public_ip.bastion_publicip_name, azurerm_subnet.bastion_subnet_name]
}

resource "azurerm_network_ddos_protection_plan" "ddos_protection_geewa_a" {
  name                = var.ddos_protection_geewa_a
  location            = azurerm_resource_group.rg_geewa_name_a.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_a.name
  depends_on = [azurerm_resource_group.rg_geewa_name_a]
}

resource "azurerm_network_ddos_protection_plan" "ddos_protection_geewa_b" {
  name                = var.ddos_protection_geewa_b
  location            = azurerm_resource_group.rg_geewa_name_b.location
  resource_group_name = azurerm_resource_group.rg_geewa_name_b.name
  depends_on = [azurerm_resource_group.rg_geewa_name_a]
}