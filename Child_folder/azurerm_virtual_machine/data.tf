data "azurerm_subnet" "subdata" {
  for_each = var.vms
  name                 = each.value.nic_subname
  virtual_network_name = each.value.nic_vnetname
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "public_ip" {
  for_each = var.vms
  name                = each.value.nic_pip_name
  resource_group_name = each.value.resource_group_name
}