rgs = {
  rg1 = {
    name     = "prod_rg"
    location = "centralindia"
  }
}

vnets = {
  vnet1 = {
    name                = "prod_vnet"
    resource_group_name = "prod_rg"
    location            = "centralindia"
    address_space       = ["10.1.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name                 = "prod_subnet1"
    resource_group_name  = "prod_rg"
    virtual_network_name = "prod_vnet"
    address_prefixes     = ["10.1.1.0/24"]
  }
  subnet2 = {
    name                 = "prod_subnet2"
    resource_group_name  = "prod_rg"
    virtual_network_name = "prod_vnet"
    address_prefixes     = ["10.1.2.0/24"]
  }
}

public_ips = {
  pip1 = {
    name                = "prod_public_ip1"
    resource_group_name = "prod_rg"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "prod_public_ip2"
    resource_group_name = "prod_rg"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

vms = {
  vm1 = {
    vm_name                         = "ProdFrontendVM"
    nic_name                        = "prod_nic1"
    resource_group_name             = "prod_rg"
    location                        = "centralindia"
    public_ip_name                  = "prod_public_ip1"
    subnet_name                     = "prod_subnet1"
    vnet_name                       = "prod_vnet"
    private_ip_address_allocation   = "Dynamic"
    vm_size                         = "Standard_D2as_v5"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
    disk_name                       = "prodosdisk1"
    caching                         = "ReadWrite"
    create_option                   = "FromImage"
    managed_disk_type               = "Standard_LRS"
    computer_name                   = "prod-frontend"
    admin_username                  = "prodadmin"
    admin_password                  = "Password1234!"
    disable_password_authentication = false
  }
  vm2 = {
    vm_name                         = "ProdBackendVM"
    nic_name                        = "prod_nic2"
    resource_group_name             = "prod_rg"
    location                        = "centralindia"
    public_ip_name                  = "prod_public_ip2"
    subnet_name                     = "prod_subnet2"
    vnet_name                       = "prod_vnet"
    private_ip_address_allocation   = "Dynamic"
    vm_size                         = "Standard_D2as_v5"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
    disk_name                       = "prodosdisk2"
    caching                         = "ReadWrite"
    create_option                   = "FromImage"
    managed_disk_type               = "Standard_LRS"
    computer_name                   = "prod-backend"
    admin_username                  = "prodadmin"
    admin_password                  = "Password1234!"
    disable_password_authentication = false
  }
}
