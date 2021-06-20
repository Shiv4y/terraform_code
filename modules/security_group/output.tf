output "nsg_id" {
  description = "network security group id"
  value       = azurerm_network_security_group.tfnsg.id
}