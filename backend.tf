# data "terraform_remote_state" "backend" {
#     backend = "azurerm"
#     config = {

#         storage_account_name  = "asignstorage08"
#         container_name   = "tfstate"
#         key     = "terraform.tfstate"
#         access_key = "Trxp3gUUtWejQABE9QbClA+VZ/XptS0EYqDHE1N240OE5DE6vvCCA22X1iIhPgwDLt6AAzNLbCctmeZ1W4vS2g=="
#     }
  
# }