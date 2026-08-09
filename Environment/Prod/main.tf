module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_virtual_network"
  vnets      = var.vnets
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/azurerm_subnets"
  subnets    = var.subnets
}

module "virtual_machine" {
  depends_on = [module.subnet, module.public_ip]
  source     = "../../modules/azurerm_virtual_machine"
  vms        = var.vms
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}
