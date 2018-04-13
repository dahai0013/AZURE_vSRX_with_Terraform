#Create storage account

resource "azurerm_storage_account" "jnstorageaccount1" {
  name                     = "jnstorageaccount1"
  resource_group_name      = "${azurerm_resource_group.grp_demo.name}"
  location                 = "${azurerm_resource_group.grp_demo.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "jnstoragecont1" {
  name 			= "vhds"
  resource_group_name      = "${azurerm_resource_group.grp_demo.name}"
  storage_account_name 	= "${azurerm_storage_account.jnstorageaccount1.name}"
  container_access_type = "private"
}
#create the VM: vsrx1
resource "azurerm_virtual_machine" "vsrx1" {
  name                  = "vsrx1"
  resource_group_name   = "${azurerm_resource_group.grp_demo.name}"
  location              = "${azurerm_resource_group.grp_demo.location}"
  network_interface_ids = ["${azurerm_network_interface.if-vsrx1-fxp0.id}","${azurerm_network_interface.if-vsrx1-ge-0-0-0.id}","${azurerm_network_interface.if-vsrx1-ge-0-0-1.id}"]
  primary_network_interface_id = "${azurerm_network_interface.if-vsrx1-fxp0.id}"
  vm_size               = "Standard_DS3_V2"

  storage_image_reference {
      publisher = "juniper-networks"
      offer = "vsrx-next-generation-firewall"
      sku       = "vsrx-byol-azure-image"
      version   = "latest"
  }
  storage_os_disk {
      name          = "vsrx1-Disk1"
      vhd_uri       = "${azurerm_storage_account.jnstorageaccount1.primary_blob_endpoint}${azurerm_storage_container.jnstoragecont1.name}/vsrx1-Disk1.vhd"
      caching       = "ReadWrite"
      create_option = "FromImage"
  }
  os_profile {
      computer_name  = "demo"
      admin_username = "${var.vm_username}"
      admin_password = "${var.vm_password}"
  }

  os_profile_linux_config {
      disable_password_authentication = false
  }

  plan {
      name = "vsrx-byol-azure-image",
       publisher = "juniper-networks",
      product = "vsrx-next-generation-firewall"
  }
}
