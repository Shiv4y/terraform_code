resource "azurerm_subnet" "tfsubnet" {
  resource_group_name = var.resourcegrpname
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnet_address_prefixes
}