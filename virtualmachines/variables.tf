
variable "location_a" {
    type        = string
    description = "location_a"
}

variable "rg_geewa_name_a" {
    type        = string
    description = "resource group name"
}

variable "location_b" {
    type        = string
    description = "location_b"
}

variable "rg_geewa_name_b" {
    type        = string
    description = "resource group name"
}


variable "tags" {
    type        = map
    description = "Collection of the tags referenced by the Azure deployment"
}

variable "nic_geewa_appserver_a" {
    type        = string
    description = "NIC for App Server A"
}

variable "geewa_subnet_name_a_id" {
    type        = string
    description = "NIC for App Server A"
}

variable "geewa_subnet_name_b_id" {
    type        = string
    description = "NIC for App Server A"
}

variable "nic_private_ip_a" {
    type        = string
     
}

variable "vm_geewa_appserver_a" {
    type        = string
     
}

variable "vmsize_geewa_appserver_a" {
    type        = string
     
}

variable "vmosdiskname_geewa_appserver_a" {
    type        = string
     
}

variable "vmosdisktype_geewa_appserver_a" {
    type        = string
     
}

variable "imagepublisher_a" {
    type        = string
     
}

variable "imageoffer_a" {
    type        = string
     
}

variable "imagesku_a" {
    type        = string
     
}

variable "admin_username" {
    type        = string
     
}

variable "admin_password" {
    type        = string
     
}

variable "vmosdisksize_geewa_appserver_a" {
    type        = string
     
}

variable "nic_geewa_appserver_b" {
    type        = string
     
}

variable "nic_private_ip_b" {
    type        = string
     
}

variable "vm_geewa_appserver_b" {
    type        = string
     
}

variable "vmsize_geewa_appserver_b" {
    type        = string
     
}

variable "vmosdiskname_geewa_appserver_b" {
    type        = string
     
}

variable "vmosdisksize_geewa_appserver_b" {
    type        = string
     
}

variable "vmosdisktype_geewa_appserver_b" {
    type        = string
     
}

variable "imagepublisher_b" {
    type        = string
     
}

variable "imageoffer_b" {
    type        = string
     
}

variable "imagesku_b" {
    type        = string
     
}

variable "nic_geewa_dbserver" {
    type        = string
     
}

variable "nic_private_ip_db" {
    type        = string
     
}

variable "vm_geewa_dbserver" {
    type        = string
     
}

variable "vmsize_geewa_dbserver" {
    type        = string
     
}

variable "vmosdisksize_geewa_dbserver" {
    type        = string
     
}

variable "vmosdisktype_geewa_dbserver" {
    type        = string
     
}

variable "vmosdiskname_geewa_dbserver" {
    type        = string
     
}

variable "imagepublisher_db" {
    type        = string
     
}

variable "imageoffer_db" {
    type        = string
     
}

variable "imagesku_db" {
    type        = string
     
}

variable "datadisk_geewa_dbserver" {
    type        = string
     
}

variable "datadisk_type_dbserver" {
    type        = string
     
}


variable "datadisksize_geewa_dbserver" {
    type        = string
     
}

variable "sql_license_type" {
    type        = string
     
}


variable "sql_connectivity_port" {
    type        = string
     
}


variable "sql_connectivity_type" {
    type        = string
     
}


variable "sql_connectivity_update_username" {
    type        = string
     
}

variable "sql_connectivity_update_password" {
    type        = string
     
}

variable "sql_datafilepath" {
    type        = string
     
}

variable "sql_logfilepath" {
    type        = string
     
}


variable "sql_tempdbfilepath" {
    type        = string
     
}

variable "nsg_geewa_db" {
    type        = string
     
}
variable "nsg_geewa_appserver_a" {
    type        = string
     
}
variable "nsg_geewa_appserver_b" {
    type        = string
     
}

variable scfile{
    type = string
    default = ".\\virtualmachines\\InstallIIS.ps1"
}

variable "pip_geewa_appserver_a_name" {
    type        = string
     
}

variable "pip_geewa_appserver_b_name" {
    type        = string
}
