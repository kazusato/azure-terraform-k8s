resource "azurerm_network_interface" "kube_work_nic" {
  count = "${length(local.vmlist)}"

  "ip_configuration" {
    name = "kube_work_${element(local.vmlist, count.index)}_nic_config"
    private_ip_address_allocation = "dynamic"
    subnet_id = "${azurerm_subnet.kube_work_main_subnet.id}"
    public_ip_address_id = "${element(local.vmlist, count.index) == "m1" ? azurerm_public_ip.kube_work_oper_public_ip.id : ""}"
  }
  location = "${var.resource_location}"
  name = "kube_work_nic_${element(local.vmlist, count.index)}"
  resource_group_name = "${azurerm_resource_group.kube_work_rg.name}"
  network_security_group_id = "${element(local.vmlist, count.index) == "m1" ? azurerm_network_security_group.kube_work_oper_nsg.id : ""}"
  tags {
    environment = "${var.env_label}"
  }
}