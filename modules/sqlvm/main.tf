
resource "azurerm_network_interface" "windows_nic" {
  name                = "ipconfig"
  location            = var.resourceglocation
  resource_group_name = var.resourcegrpname

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"

  }
}

resource "azurerm_windows_virtual_machine" "database" {
  name                = var.sqlvm_name
  resource_group_name = var.resourcegrpname
  location            = var.resourceglocation
  size                = "Standard_B2s"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [ azurerm_network_interface.windows_nic.id,]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

   source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_mssql_virtual_machine" "example" {
  virtual_machine_id               = azurerm_windows_virtual_machine.database.id
  sql_license_type                 = "PAYG"
  r_services_enabled               = true
  sql_connectivity_port            = 1433
  sql_connectivity_type            = "PRIVATE"
  sql_connectivity_update_password = "Password1234!"
  sql_connectivity_update_username = "sqllogin"

  auto_patching {
    day_of_week                            = "Sunday"
    maintenance_window_duration_in_minutes = 60
    maintenance_window_starting_hour       = 2
  }
}





resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id      = azurerm_network_interface.windows_nic.id
  network_security_group_id = var.nsg_id
}