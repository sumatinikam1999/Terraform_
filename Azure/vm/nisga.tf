resource "azurerm_network_interface_security_grou_association" "nisg" {
    network_interface_id = azurerm_network_interface.nic.name
    network_security_group_id = azurerm_network_security_group_id
}