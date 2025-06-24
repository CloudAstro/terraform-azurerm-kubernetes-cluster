resource "azurerm_kubernetes_cluster_trusted_access_role_binding" "trusted_access_role_binding" {
  for_each = var.trusted_access_role_binding != null ? var.trusted_access_role_binding : {}

  kubernetes_cluster_id = azurerm_kubernetes_cluster.kubernetes_cluster.id
  name                  = each.value.name
  roles                 = each.value.roles
  source_resource_id    = each.value.source_resource_id

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []

    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }
}