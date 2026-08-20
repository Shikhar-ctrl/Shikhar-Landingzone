rgs = {
  rg1 = {
    name     = "retdy"
    location = "West Europe"
  }
}
vnet = {
  vnet1 = {
    name                = "frontendnnet"
    location            = "West Europe"
    resource_group_name = "retdy"
    address_space       = ["10.143.0.0/16"]
  }
}

sub = {
  sub1 = {
    name                 = "front-sub"
    resource_group_name  = "retdy"
    virtual_network_name = "frontendnnet"
    address_prefixes     = ["10.143.0.0/24"]
  }
  sub2 = {
    name                 = "back-sub"
    resource_group_name  = "retdy"
    virtual_network_name = "frontendnnet"
    address_prefixes     = ["10.143.1.0/24"]
  }
}
public_ip = {
  pip1 = {
    name                = "public_ip"
    resource_group_name = "retdy"
    location            = "West Europe"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "public_ip2"
    resource_group_name = "retdy"
    location            = "West Europe"
    allocation_method   = "Static"
  }
}
vms = {
  vm1 = {
    name                = "nic-card1"
    location            = "West Europe"
    resource_group_name = "retdy"
    nic_subname         = "back-sub"
    nic_vnetname        = "frontendnnet"
    nic_pip_name        = "public_ip"
    vm_name             = "frontendvirtualmchn"
    vm_size             = "Standard_D2s_v3"
    admin_username      = "frontend"
    password            = "frontpass@1234"
  }
  vm2 = {
    name                = "nic-card2"
    location            = "West Europe"
    resource_group_name = "retdy"
    nic_subname         = "front-sub"
    nic_vnetname        = "frontendnnet"
    nic_pip_name        = "public_ip2"
    vm_name             = "backendvirtualmchn"
    vm_size             = "Standard_D2s_v3"
    admin_username      = "frontend"
    password            = "frontpass@1234"
  }
}