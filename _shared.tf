module "shared" {
  source = "./shared"

  location_a      = local.workspace["location_a"]
  rg_geewa_name_a = local.workspace["rg_geewa_name_a"]
  geewa_subnet_name_a = local.workspace["geewa_subnet_name_a"]
  geewa_subnet_address_prefix_a = local.workspace["geewa_subnet_address_prefix_a"]
  geewa_vnet_address_prefix_a = local.workspace["geewa_vnet_address_prefix_a"]
  geewa_vnet_name_a = local.workspace["geewa_vnet_name_a"]

  location_b = local.workspace["location_b"]
  rg_geewa_name_b = local.workspace["rg_geewa_name_b"]
  geewa_subnet_name_b = local.workspace["geewa_subnet_name_b"]
  geewa_subnet_address_prefix_b = local.workspace["geewa_subnet_address_prefix_b"]
  geewa_vnet_address_prefix_b = local.workspace["geewa_vnet_address_prefix_b"]
  geewa_vnet_name_b = local.workspace["geewa_vnet_name_b"]
  peering_geewa_vnet_a_to_geewa_vnet_b_name = local.workspace["peering_geewa_vnet_a_to_geewa_vnet_b_name"]
  peering_geewa_vnet_b_to_geewa_vnet_a_name = local.workspace["peering_geewa_vnet_b_to_geewa_vnet_a_name"]

  bastion_subnet_name = local.workspace["bastion_subnet_name"]
  bastion_subnet_address_prefix = local.workspace["bastion_subnet_address_prefix"]

  bastion_publicip_name = local.workspace["bastion_publicip_name"]
  bastion_host_name = local.workspace["bastion_host_name"]
  
  ddos_protection_geewa_a = local.workspace["ddos_protection_geewa_a"]
  ddos_protection_geewa_b = local.workspace["ddos_protection_geewa_b"]

  tags = local.tags["default"]
}