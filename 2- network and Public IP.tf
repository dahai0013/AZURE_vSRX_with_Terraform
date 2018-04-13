# create Public IP address for Mgt and untrusted interface
resource "azurerm_public_ip" "PIP-if-vsrx1-fxp0" {
  name                         = "PIP-if-vsrx1-fxp0"
  location                     = "${azurerm_resource_group.grp_demo.location}"
  resource_group_name          = "${azurerm_resource_group.grp_demo.name}"
  public_ip_address_allocation = "dynamic"
  domain_name_label = "vsrx1-fxp0"
}

resource "azurerm_public_ip" "PIP-if-vsrx1-ge-0-0-0" {
  name                         = "PIP-if-vsrx1-ge-0-0-0"
  location                     = "${azurerm_resource_group.grp_demo.location}"
  resource_group_name          = "${azurerm_resource_group.grp_demo.name}"
  public_ip_address_allocation = "dynamic"
  domain_name_label = "vsrx1-ge-0-0-0"
}

# create interface ( connection ) in the three subnet
resource "azurerm_network_interface" "if-vsrx1-fxp0" {
  name                = "if-vsrx1-fxp0"
  location            = "${azurerm_resource_group.grp_demo.location}"
  resource_group_name = "${azurerm_resource_group.grp_demo.name}"

  ip_configuration {
    name                          = "if-vsrx1-fxp0_address"
    subnet_id                     = "${azurerm_subnet.mgt_subnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id = "${azurerm_public_ip.PIP-if-vsrx1-fxp0.id}"
  }
}

resource "azurerm_network_interface" "if-vsrx1-ge-0-0-0" {
  name                = "if-vsrx1-ge-0-0-0"
  location            = "${azurerm_resource_group.grp_demo.location}"
  resource_group_name = "${azurerm_resource_group.grp_demo.name}"

  ip_configuration {
    name                          = "if-vsrx1-ge-0-0-0_address"
    subnet_id                     = "${azurerm_subnet.untrusted_subnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id = "${azurerm_public_ip.PIP-if-vsrx1-ge-0-0-0.id}"
  }
}

resource "azurerm_network_interface" "if-vsrx1-ge-0-0-1" {
  name                = "if-vsrx1-ge-0-0-1"
  location            = "${azurerm_resource_group.grp_demo.location}"
  resource_group_name = "${azurerm_resource_group.grp_demo.name}"

  ip_configuration {
    name                          = "if-vsrx1-ge-0-0-1_address"
    subnet_id                     = "${azurerm_subnet.trusted_subnet.id}"
    private_ip_address_allocation = "dynamic"
  }
}
