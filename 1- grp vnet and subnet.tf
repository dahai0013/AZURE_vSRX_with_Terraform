resource "azurerm_resource_group" "grp_demo"{
  name      = "grp_demo"
  location  = "West US"
  tags {
    environment = "Terraform Demo"
  }
}
resource "azurerm_virtual_network" "vnet_demo" {
  name                = "vnet_demo"
  address_space       = ["192.168.0.0/16"]
  location            = "${azurerm_resource_group.grp_demo.location}"
  resource_group_name = "${azurerm_resource_group.grp_demo.name}"
}

#create 3 subnets:
resource "azurerm_subnet" "untrusted_subnet" {
  name                 = "untrusted_subnet"
  resource_group_name  = "${azurerm_resource_group.grp_demo.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet_demo.name}"
  address_prefix       = "192.168.10.0/24"
}

resource "azurerm_subnet" "trusted_subnet" {
  name                 = "trusted_subnet"
  resource_group_name  = "${azurerm_resource_group.grp_demo.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet_demo.name}"
  address_prefix       = "192.168.20.0/24"
}

resource "azurerm_subnet" "mgt_subnet" {
  name                 = "mgt_subnet"
  resource_group_name  = "${azurerm_resource_group.grp_demo.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet_demo.name}"
  address_prefix       = "192.168.0.0/24"
}
