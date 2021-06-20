output "lbaddrpool_id" {
  description = "loadbalancer backend address pool id"
  value       = [azurerm_lb_backend_address_pool.lbaddrpool.id]
}

output "lbnatpool_id" {
  description = "loadbalncer nat pool id"
  value       = [azurerm_lb_nat_pool.lbnatpool.id]
}