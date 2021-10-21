module "virtualmachines" {
  source = "./virtualmachines"

  location_a      = module.shared.location_a
  rg_geewa_name_a = module.shared.rg_geewa_name_a
  location_b = module.shared.location_b
  rg_geewa_name_b = module.shared.rg_geewa_name_b
  nic_geewa_appserver_a = local.workspace["nic_geewa_appserver_a"]
  nic_private_ip_a = local.workspace["nic_private_ip_a"]

  nic_geewa_appserver_b = local.workspace["nic_geewa_appserver_b"]
  nic_private_ip_b = local.workspace["nic_private_ip_b"]
  geewa_subnet_name_a_id = module.shared.geewa_subnet_name_a_id
  geewa_subnet_name_b_id = module.shared.geewa_subnet_name_b_id

  vm_geewa_appserver_a = local.workspace["vm_geewa_appserver_a"]
  vmsize_geewa_appserver_a = local.workspace["vmsize_geewa_appserver_a"]
  vmosdiskname_geewa_appserver_a = local.workspace["vmosdiskname_geewa_appserver_a"]
  vmosdisktype_geewa_appserver_a = local.workspace["vmosdisktype_geewa_appserver_a"]
  imagepublisher_a = local.workspace["imagepublisher_a"]
  imageoffer_a = local.workspace["imageoffer_a"]
  imagesku_a = local.workspace["imagesku_a"]
  admin_username = local.workspace["admin_username"]
  admin_password = local.workspace["admin_password"]
  vmosdisksize_geewa_appserver_a = local.workspace["vmosdisksize_geewa_appserver_a"]

  vm_geewa_appserver_b = local.workspace["vm_geewa_appserver_b"]
  vmsize_geewa_appserver_b = local.workspace["vmsize_geewa_appserver_b"]
  vmosdiskname_geewa_appserver_b = local.workspace["vmosdiskname_geewa_appserver_b"]
  vmosdisksize_geewa_appserver_b = local.workspace["vmosdisksize_geewa_appserver_b"]
  vmosdisktype_geewa_appserver_b = local.workspace["vmosdisktype_geewa_appserver_b"]
  imagepublisher_b = local.workspace["imagepublisher_b"]
  imageoffer_b = local.workspace["imageoffer_b"]
  imagesku_b = local.workspace["imagesku_b"]

  nic_geewa_dbserver = local.workspace["nic_geewa_dbserver"]
  nic_private_ip_db = local.workspace["nic_private_ip_db"]
  
  vm_geewa_dbserver = local.workspace["vm_geewa_dbserver"]
  vmsize_geewa_dbserver = local.workspace["vmsize_geewa_dbserver"]
  vmosdisksize_geewa_dbserver = local.workspace["vmosdisksize_geewa_dbserver"]
  vmosdisktype_geewa_dbserver = local.workspace["vmosdisktype_geewa_dbserver"]
  vmosdiskname_geewa_dbserver = local.workspace["vmosdiskname_geewa_dbserver"]
  imagepublisher_db = local.workspace["imagepublisher_db"]
  imageoffer_db = local.workspace["imageoffer_db"]
  imagesku_db = local.workspace["imagesku_db"]
  datadisk_geewa_dbserver = local.workspace["datadisk_geewa_dbserver"]
  datadisk_type_dbserver = local.workspace["datadisk_type_dbserver"]
  datadisksize_geewa_dbserver = local.workspace["datadisksize_geewa_dbserver"]
  sql_license_type = local.workspace["sql_license_type"]
  sql_connectivity_port = local.workspace["sql_connectivity_port"]
  sql_connectivity_type = local.workspace["sql_connectivity_type"]
  sql_connectivity_update_username = local.workspace["sql_connectivity_update_username"]
  sql_connectivity_update_password = local.workspace["sql_connectivity_update_password"]
  sql_datafilepath = local.workspace["sql_datafilepath"]
  sql_logfilepath = local.workspace["sql_logfilepath"]
  sql_tempdbfilepath = local.workspace["sql_tempdbfilepath"]

  nsg_geewa_db = local.workspace["nsg_geewa_db"]
  nsg_geewa_appserver_a = local.workspace["nsg_geewa_appserver_a"]
  nsg_geewa_appserver_b = local.workspace["nsg_geewa_appserver_b"]

  pip_geewa_appserver_a_name = local.workspace["pip_geewa_appserver_a_name"]
  pip_geewa_appserver_b_name = local.workspace["pip_geewa_appserver_b_name"]


  tags = local.tags["default"]



}