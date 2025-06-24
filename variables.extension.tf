# kubernetes_cluster_extension
variable "extension" {
  type = map(object({
    name                             = string
    cluster_id                       = optional(string)
    extension_type                   = string
    configuration_protected_settings = optional(map(string))
    configuration_settings           = optional(map(string))
    release_train                    = optional(string)
    release_namespace                = optional(string)
    target_namespace                 = optional(string)
    version                          = optional(string)
    plan = optional(object({
      name           = string
      product        = string
      publisher      = string
      promotion_code = optional(string)
      version        = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string, "30")
      read   = optional(string, "5")
      update = optional(string, "30")
      delete = optional(string, "30")
    }))
  }))
  default     = null
  description = <<DESCRIPTION
* `kubernetes_cluster_extension` - (Optional) The `kubernetes_cluster_extension` block resource as defined below.
  * `name` - (Required) Specifies the name which should be used for this Kubernetes Cluster Extension. Changing this forces a new Kubernetes Cluster Extension to be created.
  * `cluster_id` - (Required) Specifies the Cluster ID. Changing this forces a new Kubernetes Cluster Extension to be created.
  * `extension_type` - (Required) Specifies the type of extension. It must be one of the extension types registered with Microsoft.KubernetesConfiguration by the Extension publisher. For more information, please refer to [Available Extensions for AKS](https://learn.microsoft.com/en-us/azure/aks/cluster-extensions?tabs=azure-cli#currently-available-extensions). Changing this forces a new Kubernetes Cluster Extension to be created.
  * `configuration_protected_settings` - (Optional) Configuration settings that are sensitive, as name-value pairs for configuring this extension.
  * `configuration_settings` - (Optional) Configuration settings, as name-value pairs for configuring this extension.
  * `release_train` - (Optional) The release train used by this extension. Possible values include but are not limited to `Stable`, `Preview`. Changing this forces a new Kubernetes Cluster Extension to be created.
  * `release_namespace` - (Optional) Namespace where the extension release must be placed for a cluster scoped extension. If this namespace does not exist, it will be created. Changing this forces a new Kubernetes Cluster Extension to be created.
  * `target_namespace` - (Optional) Namespace where the extension will be created for a namespace scoped extension. If this namespace does not exist, it will be created. Changing this forces a new Kubernetes Cluster Extension to be created.
  * `version` - (Optional) User-specified version that the extension should pin to. If it is not set, Azure will use the latest version and auto upgrade it. Changing this forces a new Kubernetes Cluster Extension to be created.
  * `plan` - (Optional) A `plan` block as defined below. Changing this forces a new resource to be created.

A `plan` block supports the following:
  * `name` - (Required) Specifies the name of the plan from the marketplace. Changing this forces a new Kubernetes Cluster Extension to be created.
  * `product` - (Required) Specifies the product of the plan from the marketplace. Changing this forces a new Kubernetes Cluster Extension to be created.
  * `publisher` - (Required) Specifies the publisher of the plan. Changing this forces a new Kubernetes Cluster Extension to be created.
  * `promotion_code` - (Optional) Specifies the promotion code to use with the plan. Changing this forces a new Kubernetes Cluster Extension to be created.
  * `version` - (Optional) Specifies the version of the plan from the marketplace. Changing this forces a new Kubernetes Cluster Extension to be created.

  ~> **Note:** When `plan` is specified, legal terms must be accepted for this item on this subscription before creating the Kubernetes Cluster Extension. The `azurerm_marketplace_agreement` resource or AZ CLI tool can be used to do this.

The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/docs/configuration/resources.html#timeouts) for certain actions:
  * `create` - (Defaults to 30 minutes) Used when creating the Kubernetes Cluster Extension.
  * `read` - (Defaults to 5 minutes) Used when retrieving the Kubernetes Cluster Extension.
  * `update` - (Defaults to 30 minutes) Used when updating the Kubernetes Cluster Extension.
  * `delete` - (Defaults to 30 minutes) Used when deleting the Kubernetes Cluster Extension.

Example Input:
```
extension = {
  "fluxcd-extension" = {
    name                             = "example-extension"
    extension_type                   = ""microsoft.flux"
    release_train                    = "Stable"
    release_namespace                = "flux-system"
    target_namespace                 = "flux-system"
    version                          = "1.0.0"
    configuration_protected_settings = {
      "sensitiveSetting" = "sensitiveValue"
    }
    configuration_settings           = {
      "setting1" = "value1"
      "setting2" = "value2"
    }
    plan = {
      name           = "example-plan"
      product        = "example-product"
      publisher      = "example-publisher"
      promotion_code = "example-promo"
      version        = "1.0.0"
    }
  }
}
```
DESCRIPTION
}