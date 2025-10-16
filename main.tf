# Create new resource group in West US 3
resource "azurerm_resource_group" "nnl_uswest3" {
  name     = "rgNNLUSWest3"
  location = "West US 3"

  tags = {
    environment = "dev"
    project     = "NNL"
  }
}
