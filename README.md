# geewa-terraform-azure-infrastructure
geewa-terraform-azure-infrastructure IaC for Secure Azure Architecture having multiple resources which are Azure Virtual Machines, Azure SQL Virtual Machine, Azure Virtual Network, VNET Peering, Azure Bastion, Azure Public IP, Azure Network Interface, Azure Network Security Groups, Azure Managed Disk, Azure Application Gateway, Azure DDOS Protection, Azure Traffic Manager and Azure Resource Group.  

As per the Task requirement which are mentioned below, this is the IaC in Terraform for Azure in which multiple resources are deployed for completing the Architecture of the Application Geewa Game.

# Requirement

Resource group “a-rg”
will be located in West Europe and will contain 2 virtual machines:

Machine 1, Database server
2 cores / 8G RAM / 128G + 256G DISK with SQL server 2019 standard, which will not
be accessible from WAN. Use LAN IP 10.10.1.10. Ports 88,9999, 3389 and 1433 will be
exposed only to LAN.

Machine 2, Application Server
2 cores / 8G RAM / 128G DISK Standard SSD, Windows Server 2019. Use LAN IP
10.10.1.11 and ports 88,9999, 3389 will be exposed only to LAN. Ports 80, 443 and
9339 will be accessible from WAN.

Resource group “b-rg”
will be located in France and will contain 1 virtual machine:
Machine 3, Application Server
2 cores / 8G RAM / 128G DISK Standard SSD, Windows Server 2019. Use LAN IP
10.10.2.11 and ports 88,9999, 3389 will be exposed only to LAN. Ports 80, 443 and
9339 will be accessible from WAN.


Additional Instructions:
All VMs (1, 2, 3) will communicate with each other on ports 88, 9999. Prepare with
maximum security.

# Solution
Through this terraform script Resource Group is deployed named "a-rg" which is located in West Europe and contain 2 Virtual Machines

Machine 1 the Database Server is deployed having size of 2 Core / 8G RAM / 128GB OS + 256 Data Disk with having SQL Server 2019 Standard with assigned IP of 10.10.1.10
and through the NSG of the VM only 88,9999, 3389 ports are open on LAN only.

Machine 2 the Application Server is deployed in the "a-rg" having size of 2 core / 8G RAM / 128 GB OS Disk with the IP 10.10.1.11 and through NSG ports 88,9999, 3389 are exposed only to LAN. Ports 80, 443 and 9339 are accessible from WAN further for extra points I have applied the IIS and .Net Installation through the PowerShell script.

Machine 3 is deployed in the other region which is Central France and in a different resource group and aving size of 2 core / 8G RAM / 128 GB OS Disk with the IP 10.10.1.11 and through NSG ports 88,9999, 3389 are exposed only to LAN. Ports 80, 443 and 9339 are accessible from WAN further for extra points I have applied the IIS and .Net Installation through the PowerShell script.

All VMs (1, 2, 3) are communicate with each other on ports 88, 9999 due to VNET Peering is done between both of the Virtual Networks and Maximum Security is applied like Azure Bastion is deployed to access the VMs and also Azure DDOS Protection deployed to secure it further NSGs are attached with all of the VMs with strict rules.

For Extra Points, I have wrote the PowerShell Script which executed and install the .NET framework and also the IIS Server in the both Windows Server 2019 Application Servers and after that if we hit the public IP with port 80 then it replies the Default page of the IIS in the Browser.

The Tools/Technologies which I have used to create this are Terraform, Azure, Git and PowerShell.
Also the Public Git Repos is initiated 

# To Execute this script please follow the below step

Note: To run this script please install the tools which are Git, Terraform CLI, Azure CLI. and also create a Azure Storage Account with a Container to store the terraform statefile. And input the below parameters of the Storage Account into the main.tf file which is available in the root belwo is the example.

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-game-dev-tf-geewa-001"
    storage_account_name = "stgamedevtfstategeewa001"
    container_name       = "ctgamedevtfstategeewa002"
    subscription_id      = "c2101a9b-a344-43bf-943c-1c378013f50f"
    key                  = "hAvu9CIWJshzKND7HS4ZWakzJa4fyS447sfYnImXFVKHmabMV5S4YHiVrbos+BuFKXk+6bIf7igWEOlgSjrl7g=="
  }
}

Step #01 Azure
Login into the Azure CLI 

Az login

Set the Azure Subscription in which you need to create the environment 

az account set --subscription <name or id>

Step #02 Git Repository

Clone the Repository for the GitHub with the below URL

https://github.com/Ansermuhammad/geewa-terraform-azure-infrastructure

Step #03 Terraform

Initate the Terraform and there are workspaces are defined to create multiple environments like DEV, TEST, UAT, and PROD, below are the commands which are required to deploy the terraform


terraform init 

terraform workspace new geewa-dev

terraform plan

terraform apply


The infrasturcture will take time for the deployement after that you can check the IIS Servers by browsing the public IPs of the Application Servers and also use the Azure Bastion to access the VMs.

Below is the List of Resources which will be deployed:

Azure Virtual Machine (Windows Server 2019)

Azure Virtual Machine (Windows Server 2019)

Azure SQL Virtual Machine (Windows Server 2019 with SQL Server Standard 2019)

Azure Bastion 

Azure DDOS Protection 2

Azure Network Interface Card  3

Azure Network Security Group  3

Azure Managed Disk 4

Azure Public IP 3

Azure Virtaul Network 2

Azure Virtual Network Peering



