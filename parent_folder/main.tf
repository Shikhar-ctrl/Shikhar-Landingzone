module "resource_group" {
  source = "../Child_folder/azurerm_resource_group"
  rgs    = var.rgs
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../Child_folder/azurerm_virtual_network"
  vnet       = var.vnet
}

module "azurerm_subnet" {
  depends_on = [module.virtual_network]
  source     = "../Child_folder/azurerm_subnet"
  sub        = var.sub
}

module "azurerm_public_ip" {
  depends_on = [module.azurerm_subnet]
  source     = "../Child_folder/azurerm_public_ip"
  public_ip  = var.public_ip
}

module "virtual_machine" {
  depends_on = [module.azurerm_public_ip]
  source     = "../Child_folder/azurerm_virtual_machine"
  vms        = var.vms
}