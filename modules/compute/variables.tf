variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the Virtual Machine"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}


variable "location" {
  description = "Location of the VM"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for the VM"
  type        = string
}

variable "vnet_id" {
  description = "ID of the Virtual Network"
  type        = string
}

variable "image_publisher" {
  description = "Publisher of the image in Azure Marketplace"
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "image_offer" {
  description = "Offer of the image in Azure Marketplace"
  type        = string
  default     = "WindowsServer"
}

variable "image_sku" {
  description = "SKU of the image in Azure Marketplace"
  type        = string
  default     = "2019-Datacenter"
}

variable "image_version" {
  description = "Version of the image in Azure Marketplace"
  type        = string
  default     = "latest"
}

variable "subnet_id" {
  description = "The ID of the subnet to use for the NIC"
  type        = string
}
