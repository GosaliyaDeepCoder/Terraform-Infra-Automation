terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-backend"
    storage_account_name = "tfstatestorage1261"
    container_name       = "terraform-state"
    key                  = "project2-infrastructure.tfstate"
  }
}
