# may need to be created last????
#
#Create default route / static route for the trusted and untrusted subnets
resource "azurerm_route_table" "rtt-vsrx1-untrusted" {
  name                = "rtt-vsrx1-untrusted"
  location            = "${azurerm_resource_group.grp_demo.location}"
  resource_group_name = "${azurerm_resource_group.grp_demo.name}"

  route {
    name           = "default_route"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "Internet"
#    next_hop_type  = "if-vsrx1-ge-0-0-0"
  }
}

resource "azurerm_route_table" "rtt-vsrx1-trusted" {
  name                = "rtt-vsrx1-trusted"
  location            = "${azurerm_resource_group.grp_demo.location}"
  resource_group_name = "${azurerm_resource_group.grp_demo.name}"

  route {
    name           = "default_route"
    address_prefix = "0.0.0.0/0"
    next_hop_type = "VirtualAppliance"
    next_hop_in_ip_address  = "${azurerm_network_interface.if-vsrx1-ge-0-0-1.private_ip_address}"
  }
}
