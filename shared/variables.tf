
variable "location_a" {
    type        = string
    description = "location_a"
}

variable "rg_geewa_name_a" {
    type        = string
    description = "resource group name"
}

variable "geewa_vnet_address_prefix_a" {
    type        = string
    description = "vnet address prefix"
}


variable "geewa_subnet_name_a" {
    type        = string
    description = "subnet name"
}

variable "geewa_subnet_address_prefix_a" {
    type        = string
    description = "subnet name"
}

variable "geewa_vnet_name_a" {
    type        = string
    description = "vnet name"
}

variable "tags" {
    type        = map
    description = "Collection of the tags referenced by the Azure deployment"
}

variable "location_b" {
    type        = string
    description = "location_a"
}

variable "rg_geewa_name_b" {
    type        = string
    description = "resource group name"
}


variable "geewa_vnet_address_prefix_b" {
    type        = string
    description = "vnet address prefix"
}


variable "geewa_subnet_name_b" {
    type        = string
    description = "subnet name"
}

variable "geewa_subnet_address_prefix_b" {
    type        = string
    description = "subnet name"
}

variable "geewa_vnet_name_b" {
    type        = string
    description = "vnet name"
}

variable "peering_geewa_vnet_a_to_geewa_vnet_b_name" {
    type        = string
     
}

variable "peering_geewa_vnet_b_to_geewa_vnet_a_name" {
    type        = string
     
}

variable "bastion_subnet_name" {
    type        = string
     
}

variable "bastion_subnet_address_prefix" {
    type        = string
     
}

variable "bastion_publicip_name" {
    type        = string
     
}

variable "bastion_host_name" {
    type        = string
     
}

variable "ddos_protection_geewa_a" {
    type        = string
     
}


variable "ddos_protection_geewa_b" {
    type        = string
     
}