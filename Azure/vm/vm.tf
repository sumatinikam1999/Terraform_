resource "azurerm_linux_virtual_machine" "avm" {
    name = "azure-vm" 
    location = "EAST US"
    resource_group = azurerm_resource_group.rg.name
    size = "Standard_B1s"
    network_interface_ids = [net]
}