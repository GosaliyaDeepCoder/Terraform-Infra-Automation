variable "name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "location" {
  description = "Location of the Virtual Network"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for the Virtual Network"
  type        = string
}

variable "address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
}

