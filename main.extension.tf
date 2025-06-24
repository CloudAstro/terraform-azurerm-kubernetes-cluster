resource "azurerm_kubernetes_cluster_extension" "extension" {
  for_each = var.extension != null ? var.extension : {}

  name                             = each.value.name
  cluster_id                       = azurerm_kubernetes_cluster.kubernetes_cluster.id
  extension_type                   = each.value.extension_type
  configuration_protected_settings = each.value.configuration_protected_settings
  configuration_settings           = each.value.configuration_settings
  release_train                    = each.value.release_train
  release_namespace                = each.value.release_namespace
  target_namespace                 = each.value.target_namespace
  version                          = each.value.version

  dynamic "plan" {
    for_each = each.value.plan != null ? [each.value.plan] : []

    content {
      name           = plan.value.name
      product        = plan.value.product
      publisher      = plan.value.publisher
      promotion_code = plan.value.promotion_code
      version        = plan.value.version
    }
  }

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