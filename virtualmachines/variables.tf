
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
    description = "NIC IP for App Server A"
}

variable "vm_geewa_appserver_a" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "vmsize_geewa_appserver_a" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "vmosdiskname_geewa_appserver_a" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "vmosdisktype_geewa_appserver_a" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "imagepublisher_a" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "imageoffer_a" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "imagesku_a" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "admin_username" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "admin_password" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "vmosdisksize_geewa_appserver_a" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "nic_geewa_appserver_b" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "nic_private_ip_b" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "vm_geewa_appserver_b" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "vmsize_geewa_appserver_b" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "vmosdiskname_geewa_appserver_b" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "vmosdisksize_geewa_appserver_b" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "vmosdisktype_geewa_appserver_b" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "imagepublisher_b" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "imageoffer_b" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "imagesku_b" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "nic_geewa_dbserver" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "nic_private_ip_db" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "vm_geewa_dbserver" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "vmsize_geewa_dbserver" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "vmosdisksize_geewa_dbserver" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "vmosdisktype_geewa_dbserver" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "vmosdiskname_geewa_dbserver" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "imagepublisher_db" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "imageoffer_db" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "imagesku_db" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "datadisk_geewa_dbserver" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "datadisk_type_dbserver" {
    type        = string
    description = "NIC IP for App Server A"
}


variable "datadisksize_geewa_dbserver" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "sql_license_type" {
    type        = string
    description = "NIC IP for App Server A"
}


variable "sql_connectivity_port" {
    type        = string
    description = "NIC IP for App Server A"
}


variable "sql_connectivity_type" {
    type        = string
    description = "NIC IP for App Server A"
}


variable "sql_connectivity_update_username" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "sql_connectivity_update_password" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "sql_datafilepath" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "sql_logfilepath" {
    type        = string
    description = "NIC IP for App Server A"
}


variable "sql_tempdbfilepath" {
    type        = string
    description = "NIC IP for App Server A"
}

variable "nsg_geewa_db" {
    type        = string
    description = "NIC IP for App Server A"
}
variable "nsg_geewa_appserver_a" {
    type        = string
    description = "NIC IP for App Server A"
}
variable "nsg_geewa_appserver_b" {
    type        = string
    description = "NIC IP for App Server A"
}

variable scfile{
    type = string
    default = ".\\virtualmachines\\InstallIIS.ps1"
}