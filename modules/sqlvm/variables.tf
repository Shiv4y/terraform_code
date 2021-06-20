variable "resourcegrpname" {
  description = "Resource Group Name"
}
variable "resourceglocation" {
  description = "Location"
}


variable "rg_network" {
  description = "Name of the Resource Group where resources will be deployed"
}
variable "sqlvm_name" {
  default = "sqlvm"
  description = "Name of the computer"
}
variable "subnet_id" {
  description = "Subnet Id where to join the VM"
}

variable "admin_username" {
  default = "testadmin"
  description = "The username associated with the local administrator account on the virtual machine"
}

variable "admin_password" {
  default = "Password1234!"
  description = "The password associated with the local administrator account on the virtual machine"
}


variable "nsg_id" {
  description = "nsg_id"
  
}
