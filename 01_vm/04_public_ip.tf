resource "azurerm_public_ip" "kube_work_oper_public_ip" {
  location = "${var.resource_location}"
  name = "kube_work_oper_public_ip"
  public_ip_address_allocation = "dynamic"
  resource_group_name = "${azurerm_resource_group.kube_work_rg.name}"
  tags {
    environment = "${var.env_label}"
  }
}