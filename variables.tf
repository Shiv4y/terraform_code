# MSI keys , add this details to backend.tf file if there is any change in value
variable "subscription_id" {
  description = "Subscription ID"
}
variable "client_id" {
  description = "App Id"
}
variable "client_secret" {
  description = "Key for Service principal"
}
variable "tenant_id" {
  description = "Tenant ID from AD"
}


variable "resourcegrpname" {
  description = "Resource Group"
  default     = "resgroup-module-demo"
}
variable "resourceglocation" {
  description = "Location"
  default     = "centralindia"
}


# VNet variables
variable "vnet_name" {
  description = "Virtual network name"
  default     = "appvnet"
}
variable "vnet_address_space" {
  description = "VNet address space"
  default     = ["10.0.0.0/16"]
}


#Subnet variables
variable "subnet_name" {
  description = "Subnet name"
  default     = "appsubnet"
}
variable "subnet_address_prefixes" {
  description = "subnet address prefixes"
  default     = ["10.0.1.0/24"]
}

# Network security group variables
variable "nsgname" {
  description = "Network security group name "
  default     = "appnsg"
}




#Load balancer variables
variable "lbipname" {
  description = "Load balancer IP name"
  default     = "lbpip"
}
variable "lbname" {
  description = "Load balancer name"
  default     = "appLoadBalancer"
}

# VMSS variables
variable "vmss_name" {
  description = "virtual machine scaleset name"
  default     = "appvmss"
}
variable "vmss_name_prefix" {
  description = "virtual machine name prefix"
  default     = "appvmss"
}
variable "vmss_admin_username" {
  description = "virtual machine Admin user name"
  default     = "shiv4y"
}
variable "vmss_admin_password" {
  description = "virtual machine Admin user password"
  default     = "P@ssword1"
}

#sqlvm variable
variable "sqlvm_name" {
  default = "sqlvm"
  description = "Name of the computer"
}
variable "admin_username" {
  default = "testadmin"
  description = "The username associated with the local administrator account on the virtual machine"
}

variable "admin_password" {
  default = "Password1234!"
  description = "The password associated with the local administrator account on the virtual machine"
}



#storage account variable
variable "storage_account_name" {
  description = "Storage account name"
  default = "asignstorage08"
}

variable "container_name" {
  description = "conatainer name where you tfstate file will be placed"
  default = "tfstate"
  
}

variable "storage_account_access_key" {
  description = "Storage account access key"
  default = ""
}


