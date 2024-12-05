terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.11.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.0.2"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_key_vault" "kv" {
  name                = "tf-keyvault31029"
  resource_group_name = "rg-terraform-backend"
}

data "azurerm_key_vault_secret" "client_id" {
  name         = "ARM-CLIENT-ID"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "client_secret" {
  name         = "ARM-CLIENT-SECRET"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "subscription_id" {
  name         = "ARM-SUBSCRIPTION-ID"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "tenant_id" {
  name         = "ARM-TENANT-ID"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "vm_password" {
  name         = "VM-PASSWORD"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "vm_username" {
  name         = "VM-ADMINUSER"
  key_vault_id = data.azurerm_key_vault.kv.id
}


module "resource_group" {
  source              = "./modules/resource_grp"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "network" {
  source              = "./modules/network"
  name                = "my-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
}
module "compute" {
  source              = "./modules/compute"
  subnet_id           = module.network.subnet_ids["subnet1"] # Access the ID for "subnet1"
  vm_name             = "my-vm"
  vm_size             = "Standard_DS1_v2"
  admin_username      = data.azurerm_key_vault_secret.vm_username.value
  admin_password      = data.azurerm_key_vault_secret.vm_password.value
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  vnet_id             = module.network.vnet_id
}

