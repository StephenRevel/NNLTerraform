variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "nonamelab_RG"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "westus3"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "nnlvnet_westus"
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "nnl-ubuntu-vm"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "admin_ssh_key" {
  description = "SSH public key for VM access"
  type        = string
  sensitive   = true
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B2s"
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet (must not overlap with existing subnets)"
  type        = string
  default     = "10.0.1.0/24"
}
