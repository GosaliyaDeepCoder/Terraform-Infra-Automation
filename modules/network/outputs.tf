output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_ids" {
  value = { for subnet in azurerm_virtual_network.vnet.subnet : subnet.name => subnet.id }
  description = "Map of subnet names to their IDs"
}

