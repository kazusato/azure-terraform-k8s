resource "azurerm_subnet" "kube_work_main_subnet" {
  address_prefix = "10.0.0.0/24"
  name = "kube_work_main_subnet"
  resource_group_name = "${azurerm_resource_group.kube_work_rg.name}"
  virtual_network_name = "${azurerm_virtual_network.kube_work_vnet.name}"
}