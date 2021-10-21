provider "azurerm" {
  version = "~> 2.49.0" #"~> 2.2.0"
  features {}
}

provider "azurerm" {
  alias   = "hub"
  version = "~> 2.49.0" #"~> 2.2.0"
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-game-dev-tf-geewa-001"
    storage_account_name = "stgamedevtfstategeewa001"
    container_name       = "ctgamedevtfstategeewa002"
    subscription_id      = "c2101a9b-a344-43bf-943c-1c378013f50f"
    key                  = "hAvu9CIWJshzKND7HS4ZWakzJa4fyS447sfYnImXFVKHmabMV5S4YHiVrbos+BuFKXk+6bIf7igWEOlgSjrl7g=="
  }
}

locals {
  tags = {
    default = {
      Source  = "Terraform"
      Contact = "muhammadanser86@gmail.com"
      Env     = upper(terraform.workspace)
      Owner   = "GEEWA"
      Product = "GAME"
    }
  }

  env = {
    default = {
    }
    geewa-dev = { 
      
      #Location_A
      location_a                       = "West Europe"
      rg_geewa_name_a                  = "rg-dev-geewa-a"
      geewa_vnet_name_a                = "vnet-game-dev-geewa-001"
      geewa_vnet_address_prefix_a      = "10.10.0.0/16"
      geewa_subnet_name_a              = "subnet-game-dev-geewa-001"
      geewa_subnet_address_prefix_a    = "10.10.1.0/24"
      
      #Location_B
      location_b                       = "France Central"
      rg_geewa_name_b                  = "rg-dev-geewa-b"
      geewa_vnet_name_b                = "vnet-game-dev-geewa-002"
      geewa_vnet_address_prefix_b      = "10.11.0.0/16"
      geewa_subnet_name_b              = "subnet-game-dev-geewa-002"
      geewa_subnet_address_prefix_b    = "10.11.1.0/24"

      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.10.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip"
      bastion_host_name               = "bastion-dev-geewa-001"

      peering_geewa_vnet_a_to_geewa_vnet_b_name = "peering-geewa-vnet-a-to-geewa-vnet-b"
      peering_geewa_vnet_b_to_geewa_vnet_a_name = "peering-geewa-vnet-b-to-geewa-vnet-a"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-dev-geewa-a"
      nic_private_ip_db     = "10.10.1.10"

      vm_geewa_dbserver     = "vm-db-geewa"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-dev-geewa"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-dev-geewa"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_A
      vm_geewa_appserver_a = "vm-app-geewa-a"
      vmsize_geewa_appserver_a = "Standard_B2ms"
      vmosdiskname_geewa_appserver_a = "osdisk-app-dev-geewa-a"
      vmosdisksize_geewa_appserver_a = "128"
      vmosdisktype_geewa_appserver_a = "Standard_LRS"
      imagepublisher_a = "MicrosoftWindowsServer"
      imageoffer_a = "WindowsServer"
      imagesku_a = "2019-Datacenter"
      nic_geewa_appserver_a = "nic-game-app-dev-geewa-a"
      nic_private_ip_a = "10.10.1.11"
      
      #Application_Server_B
      nic_geewa_appserver_b = "nic-game-app-dev-geewa-b"
      nic_private_ip_b = "10.11.1.11"
      vm_geewa_appserver_b = "vm-app-geewa-b"
      vmsize_geewa_appserver_b = "Standard_B2ms"
      vmosdiskname_geewa_appserver_b = "osdisk-app-dev-geewa-b"
      vmosdisksize_geewa_appserver_b = "128"
      vmosdisktype_geewa_appserver_b = "Standard_LRS"
      imagepublisher_b = "MicrosoftWindowsServer"
      imageoffer_b = "WindowsServer"
      imagesku_b = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-dev-geewa"
      nsg_geewa_appserver_a = "nsg-game-app-dev-geewa-a"
      nsg_geewa_appserver_b = "nsg-game-app-dev-geewa-b"

            #DDOS-Protection
      ddos_protection_geewa_a = "ddos-protection-geewa-a"
      ddos_protection_geewa_b = "ddos-protection-geewa-b"

    }
    geewa-qa = {
      #Location_A
      location_a                       = "West Europe"
      rg_geewa_name_a                  = "rg-a-qa"
      geewa_vnet_name_a                = "vnet-game-qa-geewa-001"
      geewa_vnet_address_prefix_a      = "10.10.0.0/16"
      geewa_subnet_name_a              = "subnet-game-qa-geewa-001"
      geewa_subnet_address_prefix_a    = "10.10.1.0/24"
      
      #Location_B
      location_b                       = "France Central"
      rg_geewa_name_b                  = "rg-b-qa"
      geewa_vnet_name_b                = "vnet-game-qa-geewa-002"
      geewa_vnet_address_prefix_b      = "10.11.0.0/16"
      geewa_subnet_name_b              = "subnet-game-qa-geewa-002"
      geewa_subnet_address_prefix_b    = "10.11.1.0/24"

      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.10.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip-qa"
      bastion_host_name               = "bastion-qa-geewa-001"

      peering_geewa_vnet_a_to_geewa_vnet_b_name = "peering-geewa-vnet-a-to-geewa-vnet-b"
      peering_geewa_vnet_b_to_geewa_vnet_a_name = "peering-geewa-vnet-b-to-geewa-vnet-a"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-qa-geewa-a"
      nic_private_ip_db     = "10.10.1.10"

      vm_geewa_dbserver     = "vm-db-geewa-qa"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-qa-geewa"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-qa-geewa"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_A
      vm_geewa_appserver_a = "vm-app-geewa-a-qa"
      vmsize_geewa_appserver_a = "Standard_B2ms"
      vmosdiskname_geewa_appserver_a = "osdisk-app-qa-geewa-a"
      vmosdisksize_geewa_appserver_a = "128"
      vmosdisktype_geewa_appserver_a = "Standard_LRS"
      imagepublisher_a = "MicrosoftWindowsServer"
      imageoffer_a = "WindowsServer"
      imagesku_a = "2019-Datacenter"
      nic_geewa_appserver_a = "nic-game-app-qa-geewa-a"
      nic_private_ip_a = "10.10.1.11"
      
      #Application_Server_B
      nic_geewa_appserver_b = "nic-game-app-qa-geewa-b"
      nic_private_ip_b = "10.11.1.11"
      vm_geewa_appserver_b = "vm-app-geewa-b-qa"
      vmsize_geewa_appserver_b = "Standard_B2ms"
      vmosdiskname_geewa_appserver_b = "osdisk-app-qa-geewa-b"
      vmosdisksize_geewa_appserver_b = "128"
      vmosdisktype_geewa_appserver_b = "Standard_LRS"
      imagepublisher_b = "MicrosoftWindowsServer"
      imageoffer_b = "WindowsServer"
      imagesku_b = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-qa-geewa"
      nsg_geewa_appserver_a = "nsg-game-app-qa-geewa-a"
      nsg_geewa_appserver_b = "nsg-game-app-qa-geewa-b"
      


    }
    geewa-uat = {
      #Location_A
      location_a                       = "West Europe"
      rg_geewa_name_a                  = "rg-a-uat"
      geewa_vnet_name_a                = "vnet-game-uat-geewa-001"
      geewa_vnet_address_prefix_a      = "10.10.0.0/16"
      geewa_subnet_name_a              = "subnet-game-uat-geewa-001"
      geewa_subnet_address_prefix_a    = "10.10.1.0/24"
      
      #Location_B
      location_b                       = "France Central"
      rg_geewa_name_b                  = "rg-b"
      geewa_vnet_name_b                = "vnet-game-uat-geewa-002"
      geewa_vnet_address_prefix_b      = "10.11.0.0/16"
      geewa_subnet_name_b              = "subnet-game-uat-geewa-002"
      geewa_subnet_address_prefix_b    = "10.11.1.0/24"

      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.10.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip-uat"
      bastion_host_name               = "bastion-uat-geewa-001"

      peering_geewa_vnet_a_to_geewa_vnet_b_name = "peering-geewa-vnet-a-to-geewa-vnet-b"
      peering_geewa_vnet_b_to_geewa_vnet_a_name = "peering-geewa-vnet-b-to-geewa-vnet-a"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-uat-geewa-a"
      nic_private_ip_db     = "10.10.1.10"

      vm_geewa_dbserver     = "vm-db-geewa-uat"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-uat-geewa"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-uat-geewa"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_A
      vm_geewa_appserver_a = "vm-app-geewa-a-uat"
      vmsize_geewa_appserver_a = "Standard_B2ms"
      vmosdiskname_geewa_appserver_a = "osdisk-app-uat-geewa-a"
      vmosdisksize_geewa_appserver_a = "128"
      vmosdisktype_geewa_appserver_a = "Standard_LRS"
      imagepublisher_a = "MicrosoftWindowsServer"
      imageoffer_a = "WindowsServer"
      imagesku_a = "2019-Datacenter"
      nic_geewa_appserver_a = "nic-game-app-uat-geewa-a"
      nic_private_ip_a = "10.10.1.11"
      
      #Application_Server_B
      nic_geewa_appserver_b = "nic-game-app-uat-geewa-b"
      nic_private_ip_b = "10.11.1.11"
      vm_geewa_appserver_b = "vm-app-geewa-b-uat"
      vmsize_geewa_appserver_b = "Standard_B2ms"
      vmosdiskname_geewa_appserver_b = "osdisk-app-uat-geewa-b"
      vmosdisksize_geewa_appserver_b = "128"
      vmosdisktype_geewa_appserver_b = "Standard_LRS"
      imagepublisher_b = "MicrosoftWindowsServer"
      imageoffer_b = "WindowsServer"
      imagesku_b = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-uat-geewa"
      nsg_geewa_appserver_a = "nsg-game-app-uat-geewa-a"
      nsg_geewa_appserver_b = "nsg-game-app-uat-geewa-b"
    }
    
    geewa-prod = {
      #Location_A
      location_a                       = "West Europe"
      rg_geewa_name_a                  = "rg-a-prod"
      geewa_vnet_name_a                = "vnet-game-prod-geewa-001"
      geewa_vnet_address_prefix_a      = "10.10.0.0/16"
      geewa_subnet_name_a              = "subnet-game-prod-geewa-001"
      geewa_subnet_address_prefix_a    = "10.10.1.0/24"
      
      #Location_B
      location_b                       = "France Central"
      rg_geewa_name_b                  = "rg-b-prod"
      geewa_vnet_name_b                = "vnet-game-prod-geewa-002"
      geewa_vnet_address_prefix_b      = "10.11.0.0/16"
      geewa_subnet_name_b              = "subnet-game-prod-geewa-002"
      geewa_subnet_address_prefix_b    = "10.11.1.0/24"

      bastion_subnet_name             = "AzureBastionSubnet"
      bastion_subnet_address_prefix   = "10.10.2.0/24"
      
      bastion_publicip_name           = "bastion-publicip-prod"
      bastion_host_name               = "bastion-prod-geewa-001"

      peering_geewa_vnet_a_to_geewa_vnet_b_name = "peering-geewa-vnet-a-to-geewa-vnet-b"
      peering_geewa_vnet_b_to_geewa_vnet_a_name = "peering-geewa-vnet-b-to-geewa-vnet-a"

      admin_username = "geewaadmin"
      admin_password = "Password1234!"

      #Database_Server
      nic_geewa_dbserver    = "nic-game-db-prod-geewa-a"
      nic_private_ip_db     = "10.10.1.10"

      vm_geewa_dbserver     = "vm-db-geewa-prod"
      vmsize_geewa_dbserver = "Standard_B2ms"
      vmosdisksize_geewa_dbserver = "128"
      vmosdisktype_geewa_dbserver = "Standard_LRS"
      vmosdiskname_geewa_dbserver = "osdisk-db-prod-geewa"
      imagepublisher_db   = "MicrosoftSQLServer"
      imageoffer_db       = "sql2019-ws2019"
      imagesku_db         = "web"
      
      datadisk_geewa_dbserver = "datadisk-db-prod-geewa"
      datadisk_type_dbserver = "Standard_LRS"
      datadisksize_geewa_dbserver = "256"

      sql_license_type    = "PAYG"
      sql_connectivity_port = "1433"
      sql_connectivity_type = "PRIVATE"
      sql_connectivity_update_username = "geewasqllogin"
      sql_connectivity_update_password = "Password1234!"
      sql_datafilepath = "F:\\data"
      sql_logfilepath  = "F:\\log"
      sql_tempdbfilepath = "F:\\tempDb"

      #Application_Server_A
      vm_geewa_appserver_a = "vm-app-geewa-a-prod"
      vmsize_geewa_appserver_a = "Standard_B2ms"
      vmosdiskname_geewa_appserver_a = "osdisk-app-prod-geewa-a"
      vmosdisksize_geewa_appserver_a = "128"
      vmosdisktype_geewa_appserver_a = "Standard_LRS"
      imagepublisher_a = "MicrosoftWindowsServer"
      imageoffer_a = "WindowsServer"
      imagesku_a = "2019-Datacenter"
      nic_geewa_appserver_a = "nic-game-app-prod-geewa-a"
      nic_private_ip_a = "10.10.1.11"
      
      #Application_Server_B
      nic_geewa_appserver_b = "nic-game-prod-dev-geewa-b"
      nic_private_ip_b = "10.11.1.11"
      vm_geewa_appserver_b = "vm-app-geewa-b-prod"
      vmsize_geewa_appserver_b = "Standard_B2ms"
      vmosdiskname_geewa_appserver_b = "osdisk-prod-dev-geewa-b"
      vmosdisksize_geewa_appserver_b = "128"
      vmosdisktype_geewa_appserver_b = "Standard_LRS"
      imagepublisher_b = "MicrosoftWindowsServer"
      imageoffer_b = "WindowsServer"
      imagesku_b = "2019-Datacenter"

      nsg_geewa_db = "nsg-game-db-dev-geewa"
      nsg_geewa_appserver_a = "nsg-game-app-prod-geewa-a"
      nsg_geewa_appserver_b = "nsg-game-app-prod-geewa-b"
    }
  }

  environmentvars = contains(keys(local.env), terraform.workspace) ? terraform.workspace : "default"
  workspace       = merge(local.env["default"], local.env[local.environmentvars])
}

