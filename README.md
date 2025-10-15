# NNLTerraform
Terraform Template to Deploy to Azure

## Overview
This Terraform template deploys a simple Ubuntu VM to Azure with the following configuration:
- **Location**: West US 3
- **Resource Group**: nonamelab_RG (must exist)
- **Virtual Network**: nnlvnet_westus (must exist)
- **OS**: Latest Ubuntu Server 22.04 LTS
- **Storage**: Standard SSD (Standard_LRS)
- **Network**: Public IP with basic NSG allowing SSH (port 22) from internet
- **Deployment**: Standalone server (no availability zones)

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- Azure CLI with authentication configured
- Existing Azure Resource Group: `nonamelab_RG`
- Existing Virtual Network: `nnlvnet_westus`
- SSH key pair for VM access

## Quick Start

### 1. Authenticate with Azure
```bash
az login
```

### 2. Create SSH Key (if you don't have one)
```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_azure
```

### 3. Configure Variables
Copy the example variables file and edit it with your values:
```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` and add your SSH public key:
```hcl
admin_ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC... your-email@example.com"
```

### 4. Deploy Infrastructure

Initialize Terraform:
```bash
terraform init
```

Review the deployment plan:
```bash
terraform plan
```

Apply the configuration:
```bash
terraform apply
```

### 5. Connect to VM
After deployment, use the SSH connection string from the output:
```bash
ssh azureuser@<public-ip>
```

## Configuration

### Variables
The following variables can be customized in `terraform.tfvars`:

| Variable | Description | Default |
|----------|-------------|---------|
| `resource_group_name` | Name of the resource group | `nonamelab_RG` |
| `location` | Azure region for resources | `westus3` |
| `vnet_name` | Name of the virtual network | `nnlvnet_westus` |
| `vm_name` | Name of the virtual machine | `nnl-ubuntu-vm` |
| `admin_username` | Admin username for the VM | `azureuser` |
| `admin_ssh_key` | SSH public key for VM access | (required) |
| `vm_size` | Size of the virtual machine | `Standard_B2s` |
| `subnet_address_prefix` | Address prefix for the subnet | `10.0.1.0/24` |

### Outputs
After deployment, the following information is provided:

- `resource_group_name`: Name of the resource group
- `public_ip_address`: Public IP address of the VM
- `vm_name`: Name of the virtual machine
- `vm_id`: Azure resource ID of the VM
- `ssh_connection_string`: Complete SSH command to connect to the VM

## Clean Up
To destroy all resources created by this template:
```bash
terraform destroy
```

## File Structure
```
.
├── .gitignore                  # Git ignore patterns for Terraform
├── README.md                   # This file
├── provider.tf                 # Azure provider configuration
├── variables.tf                # Variable definitions
├── main.tf                     # Main infrastructure resources
├── outputs.tf                  # Output definitions
└── terraform.tfvars.example    # Example variables file
```

## Security Notes
- The NSG allows SSH access from any IP address (`0.0.0.0/0`). Consider restricting this to specific IP ranges for production use.
- The `terraform.tfvars` file is excluded from git to prevent committing sensitive data.
- Always use SSH keys instead of passwords for VM authentication.

## License
This project is provided as-is for educational and development purposes.
