output "resource_group_name" {
  description = "Name of the resource group"
  value       = data.azurerm_resource_group.main.name
}

output "public_ip_address" {
  description = "Public IP address of the VM"
  value       = azurerm_public_ip.main.ip_address
}

output "vm_name" {
  description = "Name of the virtual machine"
  value       = azurerm_linux_virtual_machine.main.name
}

output "vm_id" {
  description = "ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.main.id
}

output "ssh_connection_string" {
  description = "SSH connection string"
  value       = "ssh ${var.admin_username}@${azurerm_public_ip.main.ip_address}"
}
