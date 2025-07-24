resource "azurerm_network_security_group_id" "nsg" {
    name = "new"
    location = "EAST US"
    resource_group_name = azurerm_resource_group.rm.name
}