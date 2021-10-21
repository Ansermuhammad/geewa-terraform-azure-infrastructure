
resource "azurerm_public_ip" "pip_geewa_appserver_a_name" {
  name                = var.pip_geewa_appserver_a_name
  location            = var.location_a
  resource_group_name = var.rg_geewa_name_a
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = var.tags
}

resource "azurerm_network_interface" "nic_geewa_appserver_a" {
  name                = var.nic_geewa_appserver_a
  location            = var.location_a
  resource_group_name = var.rg_geewa_name_a
  tags = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.geewa_subnet_name_a_id
    private_ip_address_allocation = "Static"
    private_ip_address = var.nic_private_ip_a
    public_ip_address_id = azurerm_public_ip.pip_geewa_appserver_a_name.id
  }
}

resource "azurerm_virtual_machine" "vm_geewa_appserver_a" {
  name                = var.vm_geewa_appserver_a
  resource_group_name = var.rg_geewa_name_a
  location            = var.location_a
  vm_size                = var.vmsize_geewa_appserver_a
  tags = var.tags
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_a]
  network_interface_ids = [
    azurerm_network_interface.nic_geewa_appserver_a.id,
  ]

 storage_os_disk {
    name              = var.vmosdiskname_geewa_appserver_a
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.vmosdisktype_geewa_appserver_a
    disk_size_gb      = var.vmosdisksize_geewa_appserver_a
  }

  storage_image_reference {
    publisher = var.imagepublisher_a
    offer     = var.imageoffer_a
    sku       = var.imagesku_a
    version   = "latest"
  }
    os_profile {
    computer_name  = var.vm_geewa_appserver_a
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
    os_profile_windows_config {
    provision_vm_agent = true
  }
}

resource "azurerm_public_ip" "pip_geewa_appserver_b_name" {
  name                = var.pip_geewa_appserver_b_name
  location            = var.location_b
  resource_group_name = var.rg_geewa_name_b
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = var.tags
}


resource "azurerm_network_interface" "nic_geewa_appserver_b" {
  name                = var.nic_geewa_appserver_b
  location            = var.location_b
  resource_group_name = var.rg_geewa_name_b
  tags = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.geewa_subnet_name_b_id
    private_ip_address_allocation = "Static"
    private_ip_address = var.nic_private_ip_b
    public_ip_address_id = azurerm_public_ip.pip_geewa_appserver_b_name.id
  }
}


resource "azurerm_virtual_machine" "vm_geewa_appserver_b" {
  name                = var.vm_geewa_appserver_b
  resource_group_name = var.rg_geewa_name_b
  location            = var.location_b
  vm_size                = var.vmsize_geewa_appserver_b
  tags = var.tags
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_b]
  network_interface_ids = [
    azurerm_network_interface.nic_geewa_appserver_b.id,
  ]

 storage_os_disk {
    name              = var.vmosdiskname_geewa_appserver_b
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.vmosdisktype_geewa_appserver_b
    disk_size_gb      = var.vmosdisksize_geewa_appserver_b
  }

  storage_image_reference {
    publisher = var.imagepublisher_b
    offer     = var.imageoffer_b
    sku       = var.imagesku_b
    version   = "latest"
  }
    os_profile {
    computer_name  = var.vm_geewa_appserver_b
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
    os_profile_windows_config {
    provision_vm_agent = true
  }
}

resource "azurerm_network_interface" "nic_geewa_dbserver" {
  name                = var.nic_geewa_dbserver
  location            = var.location_a
  resource_group_name = var.rg_geewa_name_a
  tags = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.geewa_subnet_name_a_id
    private_ip_address_allocation = "Static"
    private_ip_address = var.nic_private_ip_db
  }
}

resource "azurerm_virtual_machine" "vm_geewa_dbserver" {
  name                  = var.vm_geewa_dbserver
  location              = var.location_a
  resource_group_name   = var.rg_geewa_name_a
  network_interface_ids = [azurerm_network_interface.nic_geewa_dbserver.id]
  vm_size               = var.vmsize_geewa_dbserver
  depends_on            = [azurerm_network_interface.nic_geewa_dbserver]
  tags = var.tags

  storage_image_reference {
    publisher = var.imagepublisher_db
    offer     = var.imageoffer_db
    sku       = var.imagesku_db
    version   = "latest"
  }

  storage_os_disk {
    name              = var.vmosdiskname_geewa_dbserver
    caching           = "ReadOnly"
    create_option     = "FromImage"
    managed_disk_type = var.vmosdisktype_geewa_dbserver
    disk_size_gb      = var.vmosdisksize_geewa_dbserver
  }

  os_profile {
    computer_name  = var.vm_geewa_dbserver
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    timezone                  = "Pacific Standard Time"
    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }
}

# add a data disk - we were going to iterate through a collection
resource "azurerm_managed_disk" "datadisk_geewa_dbserver" {
    name                    = var.datadisk_geewa_dbserver 
    location                = var.location_a
    resource_group_name     = var.rg_geewa_name_a
    storage_account_type    = var.datadisk_type_dbserver
    create_option           = "Empty"
    disk_size_gb            = var.datadisksize_geewa_dbserver
    tags = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "datadisk_attach" {
    managed_disk_id    = azurerm_managed_disk.datadisk_geewa_dbserver.id
    virtual_machine_id = azurerm_virtual_machine.vm_geewa_dbserver.id
    lun                = 1
    caching            = "ReadWrite"
    depends_on            = [azurerm_managed_disk.datadisk_geewa_dbserver, azurerm_virtual_machine.vm_geewa_dbserver ]
}

resource "azurerm_mssql_virtual_machine" "sqlvm_geewa_dbserver" {
  virtual_machine_id = azurerm_virtual_machine.vm_geewa_dbserver.id
  sql_license_type   = var.sql_license_type
  r_services_enabled               = true
  sql_connectivity_port            = var.sql_connectivity_port
  sql_connectivity_type            = var.sql_connectivity_type
  sql_connectivity_update_password = var.sql_connectivity_update_password
  sql_connectivity_update_username = var.sql_connectivity_update_username
  depends_on            = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach, azurerm_virtual_machine.vm_geewa_dbserver]

  auto_patching {
    day_of_week                            = "Sunday"
    maintenance_window_duration_in_minutes = 60
    maintenance_window_starting_hour       = 2
  }
  #The storage_configuration block supports the following:
    storage_configuration {
        disk_type               = "NEW"                         # (Required) The type of disk configuration to apply to the SQL Server. Valid values include NEW, EXTEND, or ADD.
        storage_workload_type   = "OLTP"                        # (Required) The type of storage workload. Valid values include GENERAL, OLTP, or DW.
        # The storage_settings block supports the following:
        data_settings {
            default_file_path = var.sql_datafilepath     # (Required) The SQL Server default path
            luns = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach.lun]
        }
        log_settings {
            default_file_path = var.sql_logfilepath     # (Required) The SQL Server default path
            luns = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach.lun]                                 # (Required) A list of Logical Unit Numbers for the disks.
        }
        temp_db_settings {
            default_file_path = var.sql_tempdbfilepath   #- (Required) The SQL Server default path
            luns = [azurerm_virtual_machine_data_disk_attachment.datadisk_attach.lun] 
        }
    }
}

resource "azurerm_network_security_group" "nsg_geewa_appserver_a" {
  name                = var.nsg_geewa_appserver_a
  location            = var.location_a
  resource_group_name = var.rg_geewa_name_a
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_a]
  tags = var.tags
  security_rule {
    name                       = "PortAllowonLAN"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["88","9999","3389"]
    source_address_prefixes      = ["10.10.1.0/24","10.11.1.0/24","10.10.2.0/24"]
    destination_address_prefix = "*"
  } 
  security_rule {
    name                       = "PortAllowonWAN"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["443","80","9339"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  } 
  
}

resource "azurerm_network_interface_security_group_association" "nsg_geewa_appserver_a" {
  network_interface_id      = azurerm_network_interface.nic_geewa_appserver_a.id
  network_security_group_id = azurerm_network_security_group.nsg_geewa_appserver_a.id
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_a, azurerm_network_security_group.nsg_geewa_appserver_a]
}

resource "azurerm_network_security_group" "nsg_geewa_appserver_b" {
  name                = var.nsg_geewa_appserver_b
  location            = var.location_b
  resource_group_name = var.rg_geewa_name_b
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_b]
  tags = var.tags
  security_rule {
    name                       = "PortAllowonLAN"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["88","9999","3389"]
    source_address_prefixes      = ["10.10.1.0/24","10.11.1.0/24","10.10.2.0/24"]
    destination_address_prefix = "*"
  } 
  security_rule {
    name                       = "PortAllowonWAN"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["443","80","9339"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  } 
  
}

resource "azurerm_network_interface_security_group_association" "nsg_geewa_appserver_b" {
  network_interface_id      = azurerm_network_interface.nic_geewa_appserver_b.id
  network_security_group_id = azurerm_network_security_group.nsg_geewa_appserver_b.id
  depends_on            = [azurerm_network_interface.nic_geewa_appserver_b, azurerm_network_security_group.nsg_geewa_appserver_b]
}

resource "azurerm_network_security_group" "nsg_geewa_db" {
  name                = var.nsg_geewa_db
  location            = var.location_a
  resource_group_name = var.rg_geewa_name_a
  depends_on            = [azurerm_network_interface.nic_geewa_dbserver]
  tags = var.tags
  security_rule {
    name                       = "PortAllowonLAN"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["88","9999","3389","1433"]
    source_address_prefixes      = ["10.10.1.0/24","10.11.1.0/24","10.10.2.0/24"]
    destination_address_prefix = "*"
  }   
}

resource "azurerm_network_interface_security_group_association" "nsg_geewa_db" {
  network_interface_id      = azurerm_network_interface.nic_geewa_dbserver.id
  network_security_group_id = azurerm_network_security_group.nsg_geewa_db.id
  depends_on            = [azurerm_network_interface.nic_geewa_dbserver, azurerm_network_security_group.nsg_geewa_db]
}


resource "azurerm_virtual_machine_extension" "Install_dotNet_IIS-a" {
  name                 = "install-dotNet-IIS-a"
  virtual_machine_id   = azurerm_virtual_machine.vm_geewa_appserver_a.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"
  depends_on            = [azurerm_virtual_machine.vm_geewa_appserver_a]

  protected_settings = <<SETTINGS
  {
   "commandToExecute": "powershell -encodedCommand ${textencodebase64(file(".\\virtualmachines\\InstallIIS.ps1"), "UTF-16LE")}"
  }
  SETTINGS
}

resource "azurerm_virtual_machine_extension" "Install_dotNet_IIS-b" {
  name                 = "Install_dotNet_IIS-b"
  virtual_machine_id   = azurerm_virtual_machine.vm_geewa_appserver_b.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"
  depends_on            = [azurerm_virtual_machine.vm_geewa_appserver_b]

  protected_settings = <<SETTINGS
  {
   "commandToExecute": "powershell -encodedCommand ${textencodebase64(file(".\\virtualmachines\\InstallIIS.ps1"), "UTF-16LE")}"
  }
  SETTINGS
}
