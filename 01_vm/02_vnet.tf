resource "azurerm_virtual_network" "kube_work_vnet" {
  address_space = ["10.0.0.0/16"]
  location = "${var.resource_location}"
  name = "kube_work_vnet"
  resource_group_name = "${azurerm_resource_group.kube_work_rg.name}"
  tags {
    environment = "${var.env_label}"
  }
}