resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "eadca201"

  default_node_pool {
  name       = "nodepool1"
  node_count = 1
  vm_size    = "Standard_B2s_v2"

  upgrade_settings {
    max_surge = "1"   
        }
    }

  identity {
    type = "SystemAssigned"
  }
}