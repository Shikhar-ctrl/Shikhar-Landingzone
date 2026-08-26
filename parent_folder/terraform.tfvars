rgs = {
  rg1 = {
    name     = "CHANGE ME"
    location = "CHANGE ME"
  }
}
vnet = {
  vnet1 = {
    name                = "CHANGE ME"
    location            = "CHANGE ME"
    resource_group_name = "CHANGE ME"
    address_space       = ["CHANGE ME"]
  }
}

sub = {
  sub1 = {
    name                 = "CHANGE ME"
    resource_group_name  = "CHANGE ME"
    virtual_network_name = "CHANGE ME"
    address_prefixes     = ["CHANGE ME"]
  }
  sub2 = {
    name                 = "CHANGE ME"
    resource_group_name  = "CHANGE ME"
    virtual_network_name = "CHANGE ME"
    address_prefixes     = ["CHANGE ME"]
  }
}
public_ip = {
  pip1 = {
    name                = "CHANGE ME"
    resource_group_name = "CHANGE ME"
    location            = "CHANGE ME"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "CHANGE ME"
    resource_group_name = "CHANGE ME"
    location            = "CHANGE ME"
    allocation_method   = "Static"
  }
}
vms = {
  vm1 = {
    name                = "CHANGE ME"
    location            = "CHANGE ME"
    resource_group_name = "CHANGE ME"
    nic_subname         = "CHANGE ME"
    nic_vnetname        = "CHANGE ME"
    nic_pip_name        = "CHANGE ME"
    vm_name             = "CHANGE ME"
    vm_size             = "CHANGE ME"
    admin_username      = "CHANGE ME"
    password            = "CHANGE ME"
  }
  vm2 = {
    name                = "CHANGE ME"
    location            = "CHANGE ME"
    resource_group_name = "CHANGE ME"
    nic_subname         = "CHANGE ME"
    nic_vnetname        = "CHANGE ME"
    nic_pip_name        = "CHANGE ME"
    vm_name             = "CHANGE ME"
    vm_size             = "CHANGE ME"
    admin_username      = "CHANGE ME"
    password            = "CHANGE ME"
  }
}
