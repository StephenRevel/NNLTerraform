# Create new resource group in West US 3
resource "azurerm_resource_group" "nnl_uswest3" {
  name     = "rgNNLUSWest3"
  location = "West US 3"

  tags = {
    environment = "dev"
    project     = "NNL"
  }
}

resource "azurerm_virtual_network" "nnl_vnet" {
  name                = "NNLVNet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.nnl_uswest3.location
  resource_group_name = azurerm_resource_group.nnl_uswest3.name

  tags = {
    environment = "dev"
    project     = "NNL"
  }
}

resource "azurerm_subnet" "nnl_subnet" {
  name                 = "NNLSubnet"
  resource_group_name  = azurerm_resource_group.nnl_uswest3.name
  virtual_network_name = azurerm_virtual_network.nnl_vnet.name
  address_prefixes     = [cidrsubnet(azurerm_virtual_network.nnl_vnet.address_space[0], 8, 1)]
}
