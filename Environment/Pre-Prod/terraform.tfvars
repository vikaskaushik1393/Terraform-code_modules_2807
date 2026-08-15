rgs = {
  rg1 = {
    name     = "vikas_rg"
    location = "centralindia"
  }
}

vnets = {
  vnet1 = {
    name                = "vikas_vnet"
    resource_group_name = "vikas_rg"
    location            = "centralindia"
    address_space       = ["10.0.0.0/16"]
  }
}
subnets = {
  subnet1 = {
    name                 = "vikas_subnet1"
    resource_group_name  = "vikas_rg"
    virtual_network_name = "vikas_vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "vikas_subnet2"
    resource_group_name  = "vikas_rg"
    virtual_network_name = "vikas_vnet"
    address_prefixes     = ["10.0.2.0/24"]

  }
}

public_ips = {
  pip1 = {
    name                = "vikas_public_ip1"
    resource_group_name = "vikas_rg"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "vikas_public_ip2"
    resource_group_name = "vikas_rg"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}
vms = {
  vm1 = {
    vm_name                         = "FrontendVM"
    nic_name                        = "vikas_nic1"
    resource_group_name             = "vikas_rg"
    location                        = "centralindia"
    public_ip_name                  = "vikas_public_ip1"
    subnet_name                     = "vikas_subnet1"
    vnet_name                       = "vikas_vnet"
    private_ip_address_allocation   = "Dynamic"
    vm_size                         = "Standard_D2s_v3"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
    disk_name                       = "myosdisk1"
    caching                         = "ReadWrite"
    create_option                   = "FromImage"
    managed_disk_type               = "Standard_LRS"
    computer_name                   = "hostname"
    admin_username                  = "testadmin"
    admin_password                  = "Password1234!"
    disable_password_authentication = false
  }
  vm2 = {
    vm_name                         = "backendVM"
    resource_group_name             = "vikas_rg"
    location                        = "centralindia"
    public_ip_name                  = "vikas_public_ip2"
    vnet_name                       = "vikas_vnet"
    nic_name                        = "vikas_nic2"
    subnet_name                     = "vikas_subnet2"
    private_ip_address_allocation   = "Dynamic"
    vm_size                         = "Standard_D2s_v3"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
    disk_name                       = "myosdisk2"
    caching                         = "ReadWrite"
    create_option                   = "FromImage"
    managed_disk_type               = "Standard_LRS"
    computer_name                   = "hostname"
    admin_username                  = "testadmin"
    admin_password                  = "Password1234!"
    disable_password_authentication = false

  }
}


