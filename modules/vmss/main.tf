
resource "azurerm_virtual_machine_scale_set" "main" {
  name                            = var.vmss_name
  resource_group_name             = var.resourcegrpname
  location                        = var.resourceglocation
  upgrade_policy_mode             = "Manual"

 

  sku {
    name     = "Standard_DS1_v2"
    tier     = "Standard"
    capacity = 2
  }

 

  storage_profile_image_reference {
    id= "/subscriptions/a04ff523-c989-4b1d-b2f0-50ef3fd704d5/resourceGroups/ProdRG/providers/Microsoft.Compute/galleries/VMSSImage/images/VMSSImage"
  }

 

  storage_profile_os_disk {
    name              = ""
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

 

  storage_profile_data_disk {
    lun          = 0
    caching        = "ReadWrite"
    create_option  = "Empty"
    disk_size_gb   = 10
  }

 

  os_profile {
  computer_name_prefix   = var.vmss_name_prefix
  
  admin_username         = var.vmss_admin_username
  admin_password         = var.vmss_admin_password

  }

 


  network_profile {
    name    = "terraformnetworkprofile"
    primary = true
    network_security_group_id = var.nsg_id

 

    ip_configuration {
      name                                   = "IPConfiguration"
      subnet_id                              = var.vmss_subnet_id
      load_balancer_backend_address_pool_ids = var.vmss_lbaddrpool_id
      load_balancer_inbound_nat_rules_ids    = var.vmss_lbnatpool_id
      primary = true
    }
  }
  
}


