resource "azurerm_storage_account" "storage_account" {
  name = var.storage_account_name
  resource_group_name = var.resourcegrpname
  location = var.resourceglocation
  account_tier = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = var.container_name
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
}