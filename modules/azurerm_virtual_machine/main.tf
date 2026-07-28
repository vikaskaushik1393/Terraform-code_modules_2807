resource "azurerm_network_interface" "main" {
    for_each = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id          = data.azurerm_public_ip.public_ip[each.key].id
  }
}

resource "azurerm_virtual_machine" "main" {
    for_each = var.vms
  name                  = each.value.vm_name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  network_interface_ids = [azurerm_network_interface.main[each.key].id]
  vm_size               = each.value.vm_size

  storage_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku              
    version   = each.value.version
  }
  storage_os_disk {
    name              = each.value.disk_name
    caching           = each.value.caching
    create_option     = each.value.create_option
    managed_disk_type = each.value.managed_disk_type
  }
  os_profile {
    computer_name  = each.value.computer_name
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = each.value.disable_password_authentication
  }

}