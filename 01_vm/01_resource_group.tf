resource "azurerm_resource_group" "kube_work_rg" {
  location = "${var.resource_location}"
  name = "kube_work_rg"
  tags {
    environment = "${var.env_label}"
  }
}