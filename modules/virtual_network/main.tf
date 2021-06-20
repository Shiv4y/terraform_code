resource "azurerm_virtual_network" "tfvnet" {
  resource_group_name = var.resourcegrpname
  location            = var.resourceglocation
  name                = var.vnet_name
  address_space       = var.vnet_address_space

}