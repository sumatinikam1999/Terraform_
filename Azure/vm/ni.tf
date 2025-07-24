resource "azurerm_network_interface" "nic" {
    name = "nic_old"
    location = "EAST US"
    azurerm_resource_group = azurerm_resource_group.rg.name

    ip_configuration {
         name = "nic_new"
         subnet_id = azurerm_subnet.snet.name
         private_ip_address_association = "Dynamic"
         public_ip_address_id = public_ip_address_id.pip.name
    }

}