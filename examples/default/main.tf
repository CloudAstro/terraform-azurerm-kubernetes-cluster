resource "azurerm_resource_group" "vnetrg" {
  name     = "rg-vnet-example"
  location = "germanywestcentral"
}

module "vnet-test" {
  source              = "CloudAstro/virtual-network/azurerm"
  name                = "vnet-test"
  location            = azurerm_resource_group.vnetrg.location
  resource_group_name = azurerm_resource_group.vnetrg.name
  address_space       = ["10.10.0.0/24"]
}

module "snet-test" {
  source               = "CloudAstro/subnet/azurerm"
  name                 = "snet-test"
  resource_group_name  = azurerm_resource_group.vnetrg.name
  virtual_network_name = module.vnet-test.virtual_network.name
  address_prefixes     = ["10.10.0.0/24"]
}

resource "azurerm_user_assigned_identity" "aks_identity" {
  name                = "aks-identity"
  location            = azurerm_resource_group.vnetrg.location
  resource_group_name = azurerm_resource_group.vnetrg.name
}

module "aks" {
  source = "../../"

  name                = "aks-test"
  location            = azurerm_resource_group.vnetrg.location
  resource_group_name = azurerm_resource_group.vnetrg.name
  dns_prefix          = "akstest"
  kubernetes_version  = "1.31.1"

  identity = {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks_identity.id]
  }

  default_node_pool = {
    name       = "nodepool1"
    vm_size    = "Standard_DS2_v2"
    node_count = 1
  }
}
