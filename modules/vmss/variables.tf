variable "resourcegrpname" {
  description = "Resource Group Name"
}
variable "resourceglocation" {
  description = "Location"
}
variable "vmss_name" {
  description = "virtual machine scaleset name"
}
variable "vmss_name_prefix" {
  description = "virtual machine name prefix"
}
variable "vmss_admin_username" {
  description = "virtual machine Admin user name"
}
variable "vmss_admin_password" {
  description = "virtual machine Admin user password"
}
variable "vmss_lbaddrpool_id" {
  description = "Load balancer address pool id"
}
variable "vmss_lbnatpool_id" {
  description = "Load balancer nat address pool id"
}
variable "vmss_subnet_id" {
  description = "subnet id"
}

variable "nsg_id"{
  description="nsg id"
}