output "stg_account" {
  description = "storage account id"
  value       = azurerm_storage_account.storage_account.name
}

output "stg_account_key" {
  description = "storage account id"
  value       = azurerm_storage_account.storage_account.primary_access_key
}


output "container_name" {
  description = "container name"
value   =  azurerm_storage_container.tfstate.name 
}