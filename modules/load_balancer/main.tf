resource "azurerm_public_ip" "tfloadbalancerpip" {
  name                = var.lbipname
  location            = var.resourceglocation
  resource_group_name = var.resourcegrpname
  allocation_method   = "Static"
}

resource "azurerm_lb" "tfloadbalancer" {
  name                = var.lbname
  location            = var.resourceglocation
  resource_group_name = var.resourcegrpname
  

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.tfloadbalancerpip.id
  }
}


resource "azurerm_lb_backend_address_pool" "lbaddrpool" {
  resource_group_name = var.resourcegrpname
  loadbalancer_id     = azurerm_lb.tfloadbalancer.id
  name                = "BackEndAddressPool"
}

resource "azurerm_lb_nat_pool" "lbnatpool" {
  resource_group_name            = var.resourcegrpname
  name                           = "rdp"
  loadbalancer_id                = azurerm_lb.tfloadbalancer.id
  protocol                       = "Tcp"
  frontend_port_start            = 50000
  frontend_port_end              = 50119
  backend_port                   = 3389
  frontend_ip_configuration_name = "PublicIPAddress"
}
resource "azurerm_lb_probe" "lbprobe" {
  resource_group_name = var.resourcegrpname
  loadbalancer_id     = azurerm_lb.tfloadbalancer.id
  name                = "http-probe"
  protocol            = "Http"
  request_path        = "/"
  port                = 80
}

resource "azurerm_lb_rule" "lbrule" {
  resource_group_name            = var.resourcegrpname
  loadbalancer_id                = azurerm_lb.tfloadbalancer.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_id        = azurerm_lb_backend_address_pool.lbaddrpool.id
  probe_id                       = azurerm_lb_probe.lbprobe.id
}