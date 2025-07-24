resource "azurerm_subnet" "snet" {
    name = "snet_new"
    location = "EAST US"
    azurerm_virtual_network = azurerm_virtual_network.vnet.name
    azurerm_resource_group = azurerm_resource_group.rg.name
    address_space = ["10.0.1.0/24"]
}