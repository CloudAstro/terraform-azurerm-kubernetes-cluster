variable "name" {
  type        = string
  nullable    = false
  description = <<DESCRIPTION
* `name` - (Required) The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created.

Example Input:
```
name = "aks-cluster-example"
```
DESCRIPTION
}

variable "location" {
  type        = string
  nullable    = false
  description = <<DESCRIPTION
* `location` - (Required) The location where the Managed Kubernetes Cluster should be created. Changing this forces a new resource to be created.

Example Input:
```
location = "West Europe"
```
DESCRIPTION
}

variable "resource_group_name" {
  type        = string
  nullable    = false
  description = <<DESCRIPTION
* `resource_group_name` - (Required) Specifies the Resource Group where the Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created.

Example Input:
```
resource_group_name = "rg-aks-cluster-example"
```
DESCRIPTION
}

variable "dns_prefix" {
  type        = string
  default     = null
  description = <<DESCRIPTION
* `dns_prefix` - (Optional) DNS prefix specified when creating the managed cluster. Possible values must begin and end with a letter or number, contain only letters, numbers, and hyphens and be between 1 and 54 characters in length. Changing this forces a new resource to be created.

Example Input:
```
dns_prefix = "aks-cluster-example"
```
DESCRIPTION
}

variable "dns_prefix_private_cluster" {
  type        = string
  default     = null
  description = <<DESCRIPTION
* `dns_prefix_private_cluster` - (Optional) Specifies the DNS prefix to use with private clusters. Changing this forces a new resource to be created.In addition, one of either `identity` or `service_principal` blocks must be specified.

-> **Note:** You must define either a `dns_prefix` or a `dns_prefix_private_cluster` field.

Example Input:
```
dns_prefix_private_cluster = "aks-cluster-private-example"
```
DESCRIPTION
}

variable "automatic_upgrade_channel" {
  type        = string
  default     = null
  description = <<DESCRIPTION
* `automatic_upgrade_channel` - (Optional) The upgrade channel for this Kubernetes Cluster. Possible values are `patch`, `rapid`, `node-image` and `stable`. Omitting this field sets this value to `none`.

!> **Note:** Cluster Auto-Upgrade will update the Kubernetes Cluster (and its Node Pools) to the latest GA version of Kubernetes automatically - please [see the Azure documentation for more information](https://docs.microsoft.com/azure/aks/upgrade-cluster#set-auto-upgrade-channel).

-> **Note:** Cluster Auto-Upgrade only updates to GA versions of Kubernetes and will not update to Preview versions.

Example Input:
```
automatic_upgrade_channel = "patch"
```
DESCRIPTION
}

variable "azure_policy_enabled" {
  type        = bool
  default     = null
  description = <<DESCRIPTION
* `azure_policy_enabled` - (Optional) Should the Azure Policy Add-On be enabled? For more details please visit [Understand Azure Policy for Azure Kubernetes Service](https://docs.microsoft.com/en-ie/azure/governance/policy/concepts/rego-for-aks)

Example Input:
```
azure_policy_enabled = true
```
DESCRIPTION
}

variable "cost_analysis_enabled" {
  type        = bool
  default     = false
  description = <<DESCRIPTION
* `cost_analysis_enabled` - (Optional) Should cost analysis be enabled for this Kubernetes Cluster? Defaults to `false`. The `sku_tier` must be set to `Standard` or `Premium` to enable this feature. Enabling this will add Kubernetes Namespace and Deployment details to the Cost Analysis views in the Azure portal.

Example Input:
```
cost_analysis_enabled = true
```
DESCRIPTION
}

variable "disk_encryption_set_id" {
  type        = string
  default     = null
  description = <<DESCRIPTION
* `disk_encryption_set_id` - (Optional) The ID of the Disk Encryption Set which should be used for the Nodes and Volumes. More information [can be found in the documentation](https://docs.microsoft.com/azure/aks/azure-disk-customer-managed-keys). Changing this forces a new resource to be created.

Example Input:
```
disk_encryption_set_id = "/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.Compute/diskEncryptionSets/xxx"
```
DESCRIPTION
}

variable "edge_zone" {
  type        = string
  default     = null
  description = <<DESCRIPTION
* `edge_zone` - (Optional) Specifies the Extended Zone (formerly called Edge Zone) within the Azure Region where this Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created.

Example Input:
```
edge_zone = "westus2-azs"
```
DESCRIPTION
}

variable "http_application_routing_enabled" {
  type        = bool
  default     = null
  description = <<DESCRIPTION
* `http_application_routing_enabled` - (Optional) Should HTTP Application Routing be enabled?

-> **Note:** At this time HTTP Application Routing is not supported in Azure China or Azure US Government.

Example Input:
```
http_application_routing_enabled = true
```
DESCRIPTION
}

variable "image_cleaner_enabled" {
  type        = bool
  default     = null
  description = <<DESCRIPTION
* `image_cleaner_enabled` - (Optional) Specifies whether Image Cleaner is enabled.

Example Input:
```
image_cleaner_enabled = true
```
DESCRIPTION
}

variable "image_cleaner_interval_hours" {
  type        = number
  default     = 24
  description = <<DESCRIPTION
* `image_cleaner_interval_hours` - (Optional) Specifies the interval in hours when images should be cleaned up, supported numbers in the range (24 - 2160). Defaults to `24`.

Example Input:
```
image_cleaner_interval_hours = 24
```
DESCRIPTION
}

variable "kubernetes_version" {
  type        = string
  default     = null
  description = <<DESCRIPTION
* `kubernetes_version` - (Optional) Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). AKS does not require an exact patch version to be specified, minor version aliases such as `1.22` are also supported. - The minor version's latest GA patch is automatically chosen in that case. More details can be found in [the documentation](https://docs.microsoft.com/en-us/azure/aks/supported-kubernetes-versions?tabs=azure-cli#alias-minor-version).

-> **Note:** Upgrading your cluster may take up to 10 minutes per node.

Example Input:
```
kubernetes_version = "1.26"
```
DESCRIPTION
}

variable "local_account_disabled" {
  type        = bool
  default     = null
  description = <<DESCRIPTION
* `local_account_disabled` - (Optional) If `true` local accounts will be disabled. See [the documentation](https://docs.microsoft.com/azure/aks/managed-aad#disable-local-accounts) for more information.

-> **Note:** If `local_account_disabled` is set to `true`, it is required to enable Kubernetes RBAC and AKS-managed Azure AD integration. See [the documentation](https://docs.microsoft.com/azure/aks/managed-aad#azure-ad-authentication-overview) for more information.

Example Input:
```
local_account_disabled = true
```
DESCRIPTION
}

variable "node_os_upgrade_channel" {
  type        = string
  default     = "NodeImage"
  description = <<DESCRIPTION
* `node_os_upgrade_channel` - (Optional) The upgrade channel for this Kubernetes Cluster Nodes' OS Image. Possible values are `Unmanaged`, `SecurityPatch`, `NodeImage` and `None`. Defaults to `NodeImage`.

-> **Note:** `node_os_upgrade_channel` must be set to `NodeImage` if `automatic_upgrade_channel` has been set to `node-image`

Example Input:
```
node_os_upgrade_channel = "NodeImage"
```
DESCRIPTION
}

variable "node_resource_group" {
  type        = string
  default     = null
  description = <<DESCRIPTION
* `node_resource_group` - (Optional) The name of the Resource Group where the Kubernetes Nodes should exist. Changing this forces a new resource to be created.

-> **Note:** Azure requires that a new, non-existent Resource Group is used, as otherwise, the provisioning of the Kubernetes Service will fail.

Example Input:
```
node_resource_group = "rg-aks-cluster-example-nodes"
```
DESCRIPTION
}

variable "oidc_issuer_enabled" {
  type        = bool
  default     = null
  description = <<DESCRIPTION
* `oidc_issuer_enabled` - (Optional) Enable or Disable the [OIDC issuer URL](https://learn.microsoft.com/en-gb/azure/aks/use-oidc-issuer)

Example Input:
```
oidc_issuer_enabled = true
```
DESCRIPTION
}

variable "open_service_mesh_enabled" {
  type        = bool
  default     = null
  description = <<DESCRIPTION
* `open_service_mesh_enabled` - (Optional) Is Open Service Mesh enabled? For more details, please visit [Open Service Mesh for AKS](https://docs.microsoft.com/azure/aks/open-service-mesh-about).

Example Input:
```
open_service_mesh_enabled = true
```
DESCRIPTION
}

variable "private_cluster_enabled" {
  type        = bool
  default     = false
  description = <<DESCRIPTION
* `private_cluster_enabled` - (Optional) Should this Kubernetes Cluster have its API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located. Defaults to `false`. Changing this forces a new resource to be created.

Example Input:
```
private_cluster_enabled = true
```
DESCRIPTION
}

variable "private_dns_zone_id" {
  type        = string
  default     = null
  description = <<DESCRIPTION
* `private_dns_zone_id` - (Optional) Either the ID of Private DNS Zone which should be delegated to this Cluster, `System` to have AKS manage this or `None`. In case of `None` you will need to bring your own DNS server and set up resolving, otherwise, the cluster will have issues after provisioning. Changing this forces a new resource to be created.

Example Input:
```
private_dns_zone_id = "/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.Network/privateDnsZones/xxx"
```
DESCRIPTION
}

variable "private_cluster_public_fqdn_enabled" {
  type        = bool
  default     = false
  description = <<DESCRIPTION
* `private_cluster_public_fqdn_enabled` - (Optional) Specifies whether a Public FQDN for this Private Cluster should be added. Defaults to `false`.

-> **Note:** If you use BYO DNS Zone, the AKS cluster should either use a User Assigned Identity or a service principal (which is deprecated) with the `Private DNS Zone Contributor` role and access to this Private DNS Zone. If `UserAssigned` identity is used - to prevent improper resource order destruction - the cluster should depend on the role assignment.

Example Input:
```
private_cluster_public_fqdn_enabled = true
```
DESCRIPTION
}

variable "workload_identity_enabled" {
  type        = bool
  default     = false
  description = <<DESCRIPTION
* `workload_identity_enabled` - (Optional) Specifies whether Azure AD Workload Identity should be enabled for the Cluster. Defaults to `false`.

-> **Note:** To enable Azure AD Workload Identity `oidc_issuer_enabled` must be set to `true`.
-> **Note:** Enabling this option will allocate Workload Identity resources to the `kube-system` namespace in Kubernetes. If you wish to customize the deployment of Workload Identity, you can refer to [the documentation on Azure AD Workload Identity.](https://azure.github.io/azure-workload-identity/docs/installation/mutating-admission-webhook.html) The documentation provides guidance on how to install the mutating admission webhook, which allows for the customization of Workload Identity deployment.

Example Input:
```
workload_identity_enabled = true
```
DESCRIPTION
}

variable "role_based_access_control_enabled" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
* `role_based_access_control_enabled` - (Optional) Whether Role Based Access Control for the Kubernetes Cluster should be enabled. Defaults to `true`. Changing this forces a new resource to be created.

Example Input:
```
role_based_access_control_enabled = true
```
DESCRIPTION
}

variable "run_command_enabled" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
* `run_command_enabled` - (Optional) Whether to enable run command for the cluster or not. Defaults to `true`.

Example Input:
```
run_command_enabled = true
```
DESCRIPTION
}

variable "sku_tier" {
  type        = string
  default     = "Free"
  description = <<DESCRIPTION
* `sku_tier` - (Optional) The SKU Tier that should be used for this Kubernetes Cluster. Possible values are `Free`, `Standard` (which includes the Uptime SLA) and `Premium`. Defaults to `Free`.

-> **Note:** Whilst the AKS API previously supported the `Paid` SKU - the AKS API introduced a breaking change in API Version `2023-02-01` (used in v3.51.0 and later) where the value `Paid` must now be set to `Standard`.

Example Input:
```
sku_tier = "Standard"
```
DESCRIPTION
}

variable "support_plan" {
  type        = string
  default     = "KubernetesOfficial"
  description = <<DESCRIPTION
* `support_plan` - (Optional) Specifies the support plan which should be used for this Kubernetes Cluster. Possible values are `KubernetesOfficial` and `AKSLongTermSupport`. Defaults to `KubernetesOfficial`.

Example Input:
```
support_plan = "KubernetesOfficial"
```
DESCRIPTION
}

variable "tags" {
  type        = map(string)
  default     = null
  description = <<DESCRIPTION
* `tags` - (Optional) A mapping of tags to assign to the resource.

Example Input:
```
tags = {
  environment = "production"
  team        = "devops"
}
```
DESCRIPTION
}

variable "default_node_pool" {
  type = object({
    name                          = string
    vm_size                       = string
    capacity_reservation_group_id = optional(string)
    auto_scaling_enabled          = optional(bool)
    host_encryption_enabled       = optional(bool)
    node_public_ip_enabled        = optional(bool)
    host_group_id                 = optional(string)
    fips_enabled                  = optional(bool)
    gpu_instance                  = optional(string)
    kubelet_disk_type             = optional(string)
    max_pods                      = optional(number)
    only_critical_addons_enabled  = optional(bool)
    node_labels                   = optional(map(string))
    node_public_ip_prefix_id      = optional(string)
    orchestrator_version          = optional(string)
    os_disk_size_gb               = optional(number)
    os_disk_type                  = optional(string, "Managed")
    pod_subnet_id                 = optional(string)
    os_sku                        = optional(string)
    proximity_placement_group_id  = optional(string)
    spot_max_price                = optional(number)
    snapshot_id                   = optional(string)
    type                          = optional(string, "VirtualMachineScaleSets")
    tags                          = optional(map(string))
    scale_down_mode               = optional(string, "Delete")
    temporary_name_for_rotation   = optional(string)
    ultra_ssd_enabled             = optional(bool, false)
    vnet_subnet_id                = optional(string)
    workload_runtime              = optional(string)
    zones                         = optional(set(string))
    max_count                     = optional(number)
    min_count                     = optional(number)
    node_count                    = optional(number)
    kubelet_config = optional(object({
      allowed_unsafe_sysctls    = optional(set(string))
      container_log_max_line    = optional(number)
      container_log_max_size_mb = optional(number)
      cpu_cfs_quota_enabled     = optional(bool, true)
      cpu_cfs_quota_period      = optional(string)
      cpu_manager_policy        = optional(string)
      image_gc_high_threshold   = optional(number)
      image_gc_low_threshold    = optional(number)
      pod_max_pid               = optional(number)
      topology_manager_policy   = optional(string)
    }))
    linux_os_config = optional(object({
      swap_file_size_mb             = optional(number)
      transparent_huge_page_defrag  = optional(string)
      transparent_huge_page_enabled = optional(string)
      sysctl_config = optional(object({
        fs_aio_max_nr                      = optional(number)
        fs_file_max                        = optional(number)
        fs_inotify_max_user_watches        = optional(number)
        fs_nr_open                         = optional(number)
        kernel_threads_max                 = optional(number)
        net_core_netdev_max_backlog        = optional(number)
        net_core_optmem_max                = optional(number)
        net_core_rmem_default              = optional(number)
        net_core_rmem_max                  = optional(number)
        net_core_somaxconn                 = optional(number)
        net_core_wmem_default              = optional(number)
        net_core_wmem_max                  = optional(number)
        net_ipv4_ip_local_port_range_max   = optional(number)
        net_ipv4_ip_local_port_range_min   = optional(number)
        net_ipv4_neigh_default_gc_thresh1  = optional(number)
        net_ipv4_neigh_default_gc_thresh2  = optional(number)
        net_ipv4_neigh_default_gc_thresh3  = optional(number)
        net_ipv4_tcp_fin_timeout           = optional(number)
        net_ipv4_tcp_keepalive_intvl       = optional(number)
        net_ipv4_tcp_keepalive_probes      = optional(number)
        net_ipv4_tcp_keepalive_time        = optional(number)
        net_ipv4_tcp_max_syn_backlog       = optional(number)
        net_ipv4_tcp_max_tw_buckets        = optional(number)
        net_ipv4_tcp_tw_reuse              = optional(bool)
        net_netfilter_nf_conntrack_buckets = optional(number)
        net_netfilter_nf_conntrack_max     = optional(number)
        vm_max_map_count                   = optional(number)
        vm_swappiness                      = optional(number)
        vm_vfs_cache_pressure              = optional(number)
      }))
    }))
    node_network_profile = optional(object({
      application_security_group_ids = optional(list(string))
      node_public_ip_tags            = optional(map(string))
      allowed_host_ports = optional(list(object({
        port_start = optional(number)
        port_end   = optional(number)
        protocol   = optional(string)
      })))
    }))
    upgrade_settings = optional(object({
      drain_timeout_in_minutes      = optional(number)
      node_soak_duration_in_minutes = optional(number, 0)
      max_surge                     = string
    }))
  })
  default     = null
  description = <<DESCRIPTION
* `default_node_pool` - (Required) Specifies configuration for "System" mode node pool. A `default_node_pool` block as defined below.
A `default_node_pool` block supports the following:

-> **Note:** Changing certain properties of the `default_node_pool` is done by cycling the system node pool of the cluster. When cycling the system node pool, it doesn't perform cordon and drain, and it will disrupt rescheduling pods currently running on the previous system node pool.`temporary_name_for_rotation` must be specified when changing any of the following properties: `host_encryption_enabled`, `node_public_ip_enabled`, `fips_enabled`, `kubelet_config`, `kubelet_disk_type`, `linux_os_config`, `max_pods`, `only_critical_addons_enabled`, `os_disk_size_gb`, `os_disk_type`, `os_sku`, `pod_subnet_id`, `snapshot_id`, `ultra_ssd_enabled`, `vnet_subnet_id`, `vm_size`, `zones`.
  * `name` - (Required) The name which should be used for the default Kubernetes Node Pool.
  * `vm_size` - (Required) The size of the Virtual Machine, such as `Standard_DS2_v2`. `temporary_name_for_rotation` must be specified when attempting a resize.
  * `capacity_reservation_group_id` - (Optional) Specifies the ID of the Capacity Reservation Group within which this AKS Cluster should be created. Changing this forces a new resource to be created.
  * `auto_scaling_enabled` - (Optional) Should [the Kubernetes Auto Scaler](https://docs.microsoft.com/azure/aks/cluster-autoscaler) be enabled for this Node Pool?

  -> **Note:** This requires that the `type` is set to `VirtualMachineScaleSets`.

  -> **Note:** If you're using AutoScaling, you may wish to use [Terraform's `ignore_changes` functionality](https://www.terraform.io/docs/language/meta-arguments/lifecycle.html#ignore_changes) to ignore changes to the `node_count` field.
  * `host_encryption_enabled` - (Optional) Should the nodes in the Default Node Pool have host encryption enabled? `temporary_name_for_rotation` must be specified when changing this property.

  -> **Note:** This requires that the  Feature `Microsoft.ContainerService/EnableEncryptionAtHost` is enabled and the Resource Provider is registered.
  * `node_public_ip_enabled` - (Optional) Should nodes in this Node Pool have a Public IP Address? `temporary_name_for_rotation` must be specified when changing this property.
  * `gpu_instance` - (Optional) Specifies the GPU MIG instance profile for supported GPU VM SKU. The allowed values are `MIG1g`, `MIG2g`, `MIG3g`, `MIG4g` and `MIG7g`. Changing this forces a new resource to be created.
  * `host_group_id` - (Optional) Specifies the ID of the Host Group within which this AKS Cluster should be created. Changing this forces a new resource to be created.
  * `fips_enabled` - (Optional) Should the nodes in this Node Pool have Federal Information Processing Standard enabled? `temporary_name_for_rotation` must be specified when changing this block. Changing this forces a new resource to be created.
  * `kubelet_disk_type` - (Optional) The type of disk used by kubelet. Possible values are `OS` and `Temporary`. `temporary_name_for_rotation` must be specified when changing this block.
  * `max_pods` - (Optional) The maximum number of pods that can run on each agent. `temporary_name_for_rotation` must be specified when changing this property.
  * `node_public_ip_prefix_id` - (Optional) Resource ID for the Public IP Addresses Prefix for the nodes in this Node Pool. `node_public_ip_enabled` should be `true`. Changing this forces a new resource to be created.
  * `node_labels` - (Optional) A map of Kubernetes labels which should be applied to nodes in the Default Node Pool.
  * `only_critical_addons_enabled` - (Optional) Enabling this option will taint default node pool with `CriticalAddonsOnly=true:NoSchedule` taint. `temporary_name_for_rotation` must be specified when changing this property.
  * `orchestrator_version` - (Optional) Version of Kubernetes used for the Agents. If not specified, the default node pool will be created with the version specified by `kubernetes_version`. If both are unspecified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). AKS does not require an exact patch version to be specified, minor version aliases such as `1.22` are also supported. - The minor version's latest GA patch is automatically chosen in that case. More details can be found in [the documentation](https://docs.microsoft.com/en-us/azure/aks/supported-kubernetes-versions?tabs=azure-cli#alias-minor-version).

  -> **Note:** This version must be supported by the Kubernetes Cluster - as such the version of Kubernetes used on the Cluster/Control Plane may need to be upgraded first.
  * `os_disk_size_gb` - (Optional) The size of the OS Disk which should be used for each agent in the Node Pool. `temporary_name_for_rotation` must be specified when attempting a change.
  * `os_disk_type` - (Optional) The type of disk which should be used for the Operating System. Possible values are `Ephemeral` and `Managed`. Defaults to `Managed`. `temporary_name_for_rotation` must be specified when attempting a change.
  * `os_sku` - (Optional) Specifies the OS SKU used by the agent pool. Possible values are `AzureLinux`, `Ubuntu`, `Windows2019` and `Windows2022`. If not specified, the default is `Ubuntu` if OSType=Linux or `Windows2019` if OSType=Windows. And the default Windows OSSKU will be changed to `Windows2022` after Windows2019 is deprecated. Changing this from `AzureLinux` or `Ubuntu` to `AzureLinux` or `Ubuntu` will not replace the resource, otherwise `temporary_name_for_rotation` must be specified when attempting a change.
  * `pod_subnet_id` - (Optional) The ID of the Subnet where the pods in the default Node Pool should exist.
  * `proximity_placement_group_id` - (Optional) The ID of the Proximity Placement Group. Changing this forces a new resource to be created.
  * `scale_down_mode` - (Optional) Specifies the autoscaling behaviour of the Kubernetes Cluster. Allowed values are `Delete` and `Deallocate`. Defaults to `Delete`.
  * `snapshot_id` - (Optional) The ID of the Snapshot which should be used to create this default Node Pool. `temporary_name_for_rotation` must be specified when changing this property.
  * `temporary_name_for_rotation` - (Optional) Specifies the name of the temporary node pool used to cycle the default node pool for VM resizing.
  * `type` - (Optional) The type of Node Pool which should be created. Possible values are `VirtualMachineScaleSets`. Defaults to `VirtualMachineScaleSets`. Changing this forces a new resource to be created.

  -> **Note:** When creating a cluster that supports multiple node pools, the cluster must use `VirtualMachineScaleSets`. For more information on the limitations of clusters using multiple node pools see [the documentation](https://learn.microsoft.com/en-us/azure/aks/use-multiple-node-pools#limitations).
  * `tags` - (Optional) A mapping of tags to assign to the Node Pool.

  ~> **Note:** At this time there's a bug in the AKS API where Tags for a Node Pool are not stored in the correct case - you [may wish to use Terraform's `ignore_changes` functionality to ignore changes to the casing](https://www.terraform.io/language/meta-arguments/lifecycle#ignore_changess) until this is fixed in the AKS API.
  * `ultra_ssd_enabled` - (Optional) Used to specify whether the UltraSSD is enabled in the Default Node Pool. Defaults to `false`. See [the documentation](https://docs.microsoft.com/azure/aks/use-ultra-disks) for more information. `temporary_name_for_rotation` must be specified when attempting a change.
  * `vnet_subnet_id` - (Optional) The ID of a Subnet where the Kubernetes Node Pool should exist.

  ~> **Note:** A Route Table must be configured on this Subnet.
  * `workload_runtime` - (Optional) Specifies the workload runtime used by the node pool. Possible value is `OCIContainer`.
  * `zones` - (Optional) Specifies a list of Availability Zones in which this Kubernetes Cluster should be located. `temporary_name_for_rotation` must be specified when changing this property.If `auto_scaling_enabled` is set to `true`, then the following fields can also be configured:

  -> **Note:** This requires that the `type` is set to `VirtualMachineScaleSets` and that `load_balancer_sku` is set to `standard`.
  * `max_count` - (Optional) The maximum number of nodes which should exist in this Node Pool. If specified this must be between `1` and `1000`.
  * `min_count` - (Optional) The minimum number of nodes which should exist in this Node Pool. If specified this must be between `1` and `1000`.
  * `node_count` - (Optional) The initial number of nodes which should exist in this Node Pool. If specified this must be between `1` and `1000` and between `min_count` and `max_count`.

  -> **Note:** If specified you may wish to use [Terraform's `ignore_changes` functionality](https://www.terraform.io/language/meta-arguments/lifecycle#ignore_changess) to ignore changes to this field.

  -> **Note:** If `auto_scaling_enabled` is set to `false` both `min_count` and `max_count` fields need to be set to `null` or omitted from the configuration.
  * `kubelet_config` - (Optional) A `kubelet_config` block as defined below. `temporary_name_for_rotation` must be specified when changing this block.
  * `linux_os_config` - (Optional) A `linux_os_config` block as defined below. `temporary_name_for_rotation` must be specified when changing this block.
  * `node_network_profile` - (Optional) A `node_network_profile` block as documented below.
  * `upgrade_settings` - (Optional) A `upgrade_settings` block as documented below.

A `kubelet_config` block supports the following:
  * `allowed_unsafe_sysctls` - (Optional) Specifies the allow list of unsafe sysctls command or patterns (ending in `*`).
  * `container_log_max_line` - (Optional) Specifies the maximum number of container log files that can be present for a container. must be at least 2.
  * `container_log_max_size_mb` - (Optional) Specifies the maximum size (e.g. 10MB) of container log file before it is rotated.
  * `cpu_cfs_quota_enabled` - (Optional) Is CPU CFS quota enforcement for containers enabled? Defaults to `true`.
  * `cpu_cfs_quota_period` - (Optional) Specifies the CPU CFS quota period value.
  * `cpu_manager_policy` - (Optional) Specifies the CPU Manager policy to use. Possible values are `none` and `static`,.
  * `image_gc_high_threshold` - (Optional) Specifies the percent of disk usage above which image garbage collection is always run. Must be between `0` and `100`.
  * `image_gc_low_threshold` - (Optional) Specifies the percent of disk usage lower than which image garbage collection is never run. Must be between `0` and `100`.
  * `pod_max_pid` - (Optional) Specifies the maximum number of processes per pod.
  * `topology_manager_policy` - (Optional) Specifies the Topology Manager policy to use. Possible values are `none`, `best-effort`, `restricted` or `single-numa-node`.

A `linux_os_config` block supports the following:
  * `swap_file_size_mb` - (Optional) Specifies the size of the swap file on each node in MB.
  * `transparent_huge_page_defrag` - (Optional) specifies the defrag configuration for Transparent Huge Page. Possible values are `always`, `defer`, `defer+madvise`, `madvise` and `never`.
  * `transparent_huge_page_enabled` - (Optional) Specifies the Transparent Huge Page enabled configuration. Possible values are `always`, `madvise` and `never`.
  * `sysctl_config` - (Optional) A `sysctl_config` block as defined below.

A `sysctl_config` block supports the following:

~> **Note:** For more information, please refer to [Linux Kernel Doc](https://www.kernel.org/doc/html/latest/admin-guide/sysctl/index.html).
  * `fs_aio_max_nr` - (Optional) The sysctl setting fs.aio-max-nr. Must be between `65536` and `6553500`.
  * `fs_file_max` - (Optional) The sysctl setting fs.file-max. Must be between `8192` and `12000500`.
  * `fs_inotify_max_user_watches` - (Optional) The sysctl setting fs.inotify.max_user_watches. Must be between `781250` and `2097152`.
  * `fs_nr_open` - (Optional) The sysctl setting fs.nr_open. Must be between `8192` and `20000500`.
  * `kernel_threads_max` - (Optional) The sysctl setting kernel.threads-max. Must be between `20` and `513785`.
  * `net_core_netdev_max_backlog` - (Optional) The sysctl setting net.core.netdev_max_backlog. Must be between `1000` and `3240000`.
  * `net_core_optmem_max` - (Optional) The sysctl setting net.core.optmem_max. Must be between `20480` and `4194304`.
  * `net_core_rmem_default` - (Optional) The sysctl setting net.core.rmem_default. Must be between `212992` and `134217728`.
  * `net_core_rmem_max` - (Optional) The sysctl setting net.core.rmem_max. Must be between `212992` and `134217728`.
  * `net_core_somaxconn` - (Optional) The sysctl setting net.core.somaxconn. Must be between `4096` and `3240000`.
  * `net_core_wmem_default` - (Optional) The sysctl setting net.core.wmem_default. Must be between `212992` and `134217728`.
  * `net_core_wmem_max` - (Optional) The sysctl setting net.core.wmem_max. Must be between `212992` and `134217728`.
  * `net_ipv4_ip_local_port_range_max` - (Optional) The sysctl setting net.ipv4.ip_local_port_range max value. Must be between `32768` and `65535`.
  * `net_ipv4_ip_local_port_range_min` - (Optional) The sysctl setting net.ipv4.ip_local_port_range min value. Must be between `1024` and `60999`.
  * `net_ipv4_neigh_default_gc_thresh1` - (Optional) The sysctl setting net.ipv4.neigh.default.gc_thresh1. Must be between `128` and `80000`.
  * `net_ipv4_neigh_default_gc_thresh2` - (Optional) The sysctl setting net.ipv4.neigh.default.gc_thresh2. Must be between `512` and `90000`.
  * `net_ipv4_neigh_default_gc_thresh3` - (Optional) The sysctl setting net.ipv4.neigh.default.gc_thresh3. Must be between `1024` and `100000`.
  * `net_ipv4_tcp_fin_timeout` - (Optional) The sysctl setting net.ipv4.tcp_fin_timeout. Must be between `5` and `120`.
  * `net_ipv4_tcp_keepalive_intvl` - (Optional) The sysctl setting net.ipv4.tcp_keepalive_intvl. Must be between `10` and `90`.
  * `net_ipv4_tcp_keepalive_probes` - (Optional) The sysctl setting net.ipv4.tcp_keepalive_probes. Must be between `1` and `15`.
  * `net_ipv4_tcp_keepalive_time` - (Optional) The sysctl setting net.ipv4.tcp_keepalive_time. Must be between `30` and `432000`.
  * `net_ipv4_tcp_max_syn_backlog` - (Optional) The sysctl setting net.ipv4.tcp_max_syn_backlog. Must be between `128` and `3240000`.
  * `net_ipv4_tcp_max_tw_buckets` - (Optional) The sysctl setting net.ipv4.tcp_max_tw_buckets. Must be between `8000` and `1440000`.
  * `net_ipv4_tcp_tw_reuse` - (Optional) The sysctl setting net.ipv4.tcp_tw_reuse.
  * `net_netfilter_nf_conntrack_buckets` - (Optional) The sysctl setting net.netfilter.nf_conntrack_buckets. Must be between `65536` and `524288`.
  * `net_netfilter_nf_conntrack_max` - (Optional) The sysctl setting net.netfilter.nf_conntrack_max. Must be between `131072` and `2097152`.
  * `vm_max_map_count` - (Optional) The sysctl setting vm.max_map_count. Must be between `65530` and `262144`.
  * `vm_swappiness` - (Optional) The sysctl setting vm.swappiness. Must be between `0` and `100`.
  * `vm_vfs_cache_pressure` - (Optional) The sysctl setting vm.vfs_cache_pressure. Must be between `0` and `100`.

A `node_network_profile` block supports the following:
  * `application_security_group_ids` - (Optional) A list of Application Security Group IDs which should be associated with this Node Pool.
  * `node_public_ip_tags` - (Optional) Specifies a mapping of tags to the instance-level public IPs. Changing this forces a new resource to be created.
  * `allowed_host_ports` - (Optional) One or more `allowed_host_ports` blocks as defined below.

An `allowed_host_ports` block supports the following:
  * `port_start` - (Optional) Specifies the start of the port range.
  * `port_end` - (Optional) Specifies the end of the port range.
  * `protocol` - (Optional) Specifies the protocol of the port range. Possible values are `TCP` and `UDP`.

A `upgrade_settings` block supports the following:
  * `drain_timeout_in_minutes` - (Optional) The amount of time in minutes to wait on eviction of pods and graceful termination per node. This eviction wait time honors pod disruption budgets for upgrades. If this time is exceeded, the upgrade fails. Unsetting this after configuring it will force a new resource to be created.
  * `node_soak_duration_in_minutes` - (Optional) The amount of time in minutes to wait after draining a node and before reimaging and moving on to next node. Defaults to `0`.
  * `max_surge` - (Required) The maximum number or percentage of nodes which will be added to the Node Pool size during an upgrade.

  -> **Note:** If a percentage is provided, the number of surge nodes is calculated from the `node_count` value on the current cluster. Node surge can allow a cluster to have more nodes than `max_count` during an upgrade. Ensure that your cluster has enough [IP space](https://docs.microsoft.com/azure/aks/upgrade-cluster#customize-node-surge-upgrade) during an upgrade.

Example Input:
```
default_node_pool = {
  name                         = "nodepool1"
  vm_size                      = "Standard_DS2_v2"
  auto_scaling_enabled         = true
  host_encryption_enabled      = true
  node_public_ip_enabled       = false
  fips_enabled                 = false
  kubelet_disk_type            = "OS"
  max_pods                     = 110
  only_critical_addons_enabled = true
  os_disk_size_gb              = 30
  os_disk_type                 = "Managed"
  pod_subnet_id                = module.snet-pods.subnet.id
  os_sku                       = "Ubuntu"
  type                         = "VirtualMachineScaleSets"
  scale_down_mode              = "Delete"
  temporary_name_for_rotation  = "tempnodepool"
  ultra_ssd_enabled            = false
  vnet_subnet_id               = module.snet-nodes.subnet.id
  workload_runtime             = "OCIContainer"
  zones                        = ["1", "2"]
  max_count                    = 3
  min_count                    = 1
  node_count                   = 1

  tags = {
    environment = "test"
    team        = "devops"
  }

  kubelet_config = {
    allowed_unsafe_sysctls    = ["net.core.somaxconn"]
    container_log_max_line    = 10000
    container_log_max_size_mb = 100
    cpu_cfs_quota_enabled     = true
    cpu_cfs_quota_period      = "100ms"
    cpu_manager_policy        = "none"
    image_gc_high_threshold   = 85
    image_gc_low_threshold    = 50
    pod_max_pid               = 8192
    topology_manager_policy   = "none"
  }

  linux_os_config = {
    swap_file_size_mb               = 0
    transparent_huge_page_defrag    = "always"
    transparent_huge_page_enabled   = "always"
    disable_password_authentication = true
    sysctl_config = {
      fs_file_max        = "1000000"
      net_core_somaxconn = "4096"
      vm_swappiness      = "60"
    }
  }

  node_network_profile = {
    allowed_host_ports = [{
      port_start = 30000
      port_end   = 32767
      protocol   = "TCP"
    },
    {
      port_start = 30000
      port_end   = 32767
      protocol   = "UDP"
    }]
  }

  upgrade_settings = {
    max_surge                     = "25%"
    drain_timeout_in_minutes      = 15
    node_soak_duration_in_minutes = 0
  }
}
```
DESCRIPTION
}

variable "aci_connector_linux" {
  type = object({
    subnet_name = string
  })
  default     = null
  description = <<DESCRIPTION
* `aci_connector_linux` - (Optional) A `aci_connector_linux` block as defined below. For more details, please visit [Create and configure an AKS cluster to use virtual nodes](https://docs.microsoft.com/azure/aks/virtual-nodes-portal).
An `aci_connector_linux` block supports the following:
  * `subnet_name` - (Required) The subnet name for the virtual nodes to run.
  
  ```
  resource "azurerm_subnet" "virtual" {
    delegation {    
      name = "aciDelegation"    
      service_delegation { 
        name    = "Microsoft.ContainerInstance/containerGroups"
        actions = ["Microsoft.Network/virtualNetworks/subnets/action"]    
      }  
    }
  }
  ```

  -> **Note:** At this time ACI Connectors are not supported in Azure China.

  -> **Note:** AKS will add a delegation to the subnet named here. To prevent further runs from failing you should make sure that the subnet you create for virtual nodes has a delegation, like so.

Example Input:
```
aci_connector_linux = {
  subnet_name = azurerm_subnet.virtual.name
}
```
DESCRIPTION
}

variable "api_server_access_profile" {
  type = object({
    authorized_ip_ranges = optional(set(string))
  })
  default     = null
  description = <<DESCRIPTION
* `api_server_access_profile` - (Optional) An `api_server_access_profile` block as defined below.
An `api_server_access_profile` block supports the following:
  * `authorized_ip_ranges` - (Optional) Set of authorized IP ranges to allow access to API server, e.g. ["198.51.100.0/24"].

Example Input:
```
api_server_access_profile = {
  authorized_ip_ranges = ["10.20.0.0/24", "192.168.10.0/24"]
}
```
DESCRIPTION
}

variable "auto_scaler_profile" {
  type = object({
    balance_similar_node_groups                   = optional(bool, false)
    daemonset_eviction_for_empty_nodes_enabled    = optional(bool, false)
    daemonset_eviction_for_occupied_nodes_enabled = optional(bool, true)
    expander                                      = optional(string, "random")
    ignore_daemonsets_utilization_enabled         = optional(bool, false)
    max_graceful_termination_sec                  = optional(string, "600")
    max_node_provisioning_time                    = optional(string, "15m")
    max_unready_nodes                             = optional(number, 3)
    max_unready_percentage                        = optional(number, 45)
    new_pod_scale_up_delay                        = optional(string, "10s")
    scale_down_delay_after_add                    = optional(string, "10m")
    scale_down_delay_after_delete                 = optional(string, "10s")
    scale_down_delay_after_failure                = optional(string, "3m")
    scan_interval                                 = optional(string, "10s")
    scale_down_unneeded                           = optional(string, "10m")
    scale_down_unready                            = optional(string, "20m")
    scale_down_utilization_threshold              = optional(string, "0.5")
    empty_bulk_delete_max                         = optional(string, "10")
    skip_nodes_with_local_storage                 = optional(bool, true)
    skip_nodes_with_system_pods                   = optional(bool, true)
  })
  default     = null
  description = <<DESCRIPTION
* `auto_scaler_profile` - (Optional) A `auto_scaler_profile` block as defined below.
An `auto_scaler_profile` block supports the following:
  * `balance_similar_node_groups` - (Optional) Detect similar node groups and balance the number of nodes between them. Defaults to `false`.
  * `daemonset_eviction_for_empty_nodes_enabled` - (Optional) Whether DaemonSet pods will be gracefully terminated from empty nodes. Defaults to `false`.
  * `daemonset_eviction_for_occupied_nodes_enabled` - (Optional) Whether DaemonSet pods will be gracefully terminated from non-empty nodes. Defaults to `true`.
  * `expander` - (Optional) Expander to use. Possible values are `least-waste`, `priority`, `most-pods` and `random`. Defaults to `random`.
  * `ignore_daemonsets_utilization_enabled` - (Optional) Whether DaemonSet pods will be ignored when calculating resource utilization for scale down. Defaults to `false`.
  * `max_graceful_termination_sec` - (Optional) Maximum number of seconds the cluster autoscaler waits for pod termination when trying to scale down a node. Defaults to `600`.
  * `max_node_provisioning_time` - (Optional) Maximum time the autoscaler waits for a node to be provisioned. Defaults to `15m`.
  * `max_unready_nodes` - (Optional) Maximum Number of allowed unready nodes. Defaults to `3`.
  * `max_unready_percentage` - (Optional) Maximum percentage of unready nodes the cluster autoscaler will stop if the percentage is exceeded. Defaults to `45`.
  * `new_pod_scale_up_delay` - (Optional) For scenarios like burst/batch scale where you don't want CA to act before the kubernetes scheduler could schedule all the pods, you can tell CA to ignore unscheduled pods before they're a certain age. Defaults to `10s`.
  * `scale_down_delay_after_add` - (Optional) How long after the scale up of AKS nodes the scale down evaluation resumes. Defaults to `10m`.
  * `scale_down_delay_after_delete` - (Optional) How long after node deletion that scale down evaluation resumes. Defaults to the value used for `scan_interval`.
  * `scale_down_delay_after_failure` - (Optional) How long after scale down failure that scale down evaluation resumes. Defaults to `3m`.
  * `scan_interval` - (Optional) How often the AKS Cluster should be re-evaluated for scale up/down. Defaults to `10s`.
  * `scale_down_unneeded` - (Optional) How long a node should be unneeded before it is eligible for scale down. Defaults to `10m`.
  * `scale_down_unready` - (Optional) How long an unready node should be unneeded before it is eligible for scale down. Defaults to `20m`.
  * `scale_down_utilization_threshold` - (Optional) Node utilization level, defined as sum of requested resources divided by capacity, below which a node can be considered for scale down. Defaults to `0.5`.
  * `empty_bulk_delete_max` - (Optional) Maximum number of empty nodes that can be deleted at the same time. Defaults to `10`.
  * `skip_nodes_with_local_storage` - (Optional) If `true` cluster autoscaler will never delete nodes with pods with local storage, for example, EmptyDir or HostPath. Defaults to `true`.
  * `skip_nodes_with_system_pods` - (Optional) If `true` cluster autoscaler will never delete nodes with pods from kube-system (except for DaemonSet or mirror pods). Defaults to `true`.

Example Input:
```
auto_scaler_profile = {
  balance_similar_node_groups                   = true
  daemonset_eviction_for_empty_nodes_enabled    = true
  daemonset_eviction_for_occupied_nodes_enabled = false
  expander                                      = "least-waste"
  ignore_daemonsets_utilization_enabled         = true
  max_graceful_termination_sec                  = "600"
  max_node_provisioning_time                    = "15m"
  max_unready_nodes                             = 5
  max_unready_percentage                        = 50
  new_pod_scale_up_delay                        = "10s"
  scale_down_delay_after_add                    = "10m"
  scale_down_delay_after_delete                 = "10s"
  scale_down_delay_after_failure                = "3m"
  scan_interval                                 = "10s"
  scale_down_unneeded                           = "10m"
  scale_down_unready                            = "20m"
  scale_down_utilization_threshold              = "0.5"
  empty_bulk_delete_max                         = "10"
  skip_nodes_with_local_storage                 = true
  skip_nodes_with_system_pods                   = true
}
```
DESCRIPTION
}

variable "azure_active_directory_role_based_access_control" {
  type = object({
    tenant_id              = optional(string)
    admin_group_object_ids = optional(list(string))
    azure_rbac_enabled     = optional(bool)
  })
  default     = null
  description = <<DESCRIPTION
* `azure_active_directory_role_based_access_control` - (Optional) A `azure_active_directory_role_based_access_control` block as defined below.
An `azure_active_directory_role_based_access_control` block supports the following:
  * `tenant_id` - (Optional) The Tenant ID used for Azure Active Directory Application. If this isn't specified the Tenant ID of the current Subscription is used.
  * `admin_group_object_ids` - (Optional) A list of Object IDs of Azure Active Directory Groups which should have Admin Role on the Cluster.
  * `azure_rbac_enabled` - (Optional) Is Role Based Access Control based on Azure AD enabled?

Example Input:
```
azure_active_directory_role_based_access_control = {
  tenant_id              = "00000000-0000-0000-0000-000000000000"
  admin_group_object_ids = ["11111111-1111-1111-1111-111111111111", "22222222-2222-2222-2222-222222222222"]
  azure_rbac_enabled     = true
}
```
DESCRIPTION
}

variable "confidential_computing" {
  type = object({
    sgx_quote_helper_enabled = bool
  })
  default     = null
  description = <<DESCRIPTION
* `confidential_computing` - (Optional) A `confidential_computing` block as defined below. For more details please [the documentation](https://learn.microsoft.com/en-us/azure/confidential-computing/confidential-nodes-aks-overview)
A `confidential_computing` block supports the following:
  * `sgx_quote_helper_enabled` - (Required) Should the SGX quote helper be enabled?

Example Input:
```
confidential_computing = {
  sgx_quote_helper_enabled = true
}
```
DESCRIPTION
}

variable "http_proxy_config" {
  type = object({
    http_proxy  = optional(string)
    https_proxy = optional(string)
    no_proxy    = optional(set(string))
    trusted_ca  = optional(string)
  })
  default     = null
  description = <<DESCRIPTION
* `http_proxy_config` - (Optional) A `http_proxy_config` block as defined below.
A `http_proxy_config` block supports the following:
  * `http_proxy` - (Optional) The proxy address to be used when communicating over HTTP.
  * `https_proxy` - (Optional) The proxy address to be used when communicating over HTTPS.
  * `no_proxy` - (Optional) The list of domains that will not use the proxy for communication.

  -> **Note:** If you specify the `default_node_pool[0].vnet_subnet_id`, be sure to include the Subnet CIDR in the `no_proxy` list.

  -> **Note:** You may wish to use [Terraform's `ignore_changes` functionality](https://www.terraform.io/docs/language/meta-arguments/lifecycle.html#ignore_changes) to ignore the changes to this field.
  * `trusted_ca` - (Optional) The base64 encoded alternative CA certificate content in PEM format.

Example Input:
```
http_proxy_config = {
  http_proxy  = "http://proxy.example.com:8080"
  https_proxy = "https://proxy.example.com:8443"
  no_proxy    = ["localhost", "127.0.0.1"]
  trusted_ca = filebase64("path/to/ca.pem")
}
```
DESCRIPTION
}

variable "identity" {
  type = object({
    type         = string
    identity_ids = optional(set(string))
  })
  default     = null
  description = <<DESCRIPTION
* `identity` - (Optional) An `identity` block as defined below. One of either `identity` or `service_principal` must be specified.

!> **Note:** A migration scenario from `service_principal` to `identity` is supported. When upgrading `service_principal` to `identity`, your cluster's control plane and addon pods will switch to use managed identity, but the kubelets will keep using your configured `service_principal` until you upgrade your Node Pool.
An `identity` block supports the following:
  * `type` - (Required) Specifies the type of Managed Service Identity that should be configured on this Kubernetes Cluster. Possible values are `SystemAssigned` or `UserAssigned`.
  * `identity_ids` - (Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this Kubernetes Cluster.

  ~> **Note:** This is required when `type` is set to `UserAssigned`. Currently only one User Assigned Identity is supported.

Example Input:
```
identity = {
  type         = "SystemAssigned"
  identity_ids = ["/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ManagedIdentity/userAssignedIdentities/myUserAssignedIdentity"]
}
```
DESCRIPTION
}

variable "ingress_application_gateway" {
  type = object({
    gateway_id   = optional(string)
    gateway_name = optional(string)
    subnet_cidr  = optional(string)
    subnet_id    = optional(string)
  })
  default     = null
  description = <<DESCRIPTION
* `ingress_application_gateway` - (Optional) A `ingress_application_gateway` block as defined below.

-> **Note:** Since the Application Gateway is deployed inside a Virtual Network, users (and Service Principals) that are operating the Application Gateway must have the `Microsoft.Network/virtualNetworks/subnets/join/action` permission on the Virtual Network or Subnet. For more details, please visit [Virtual Network Permission](https://learn.microsoft.com/en-us/azure/application-gateway/configuration-infrastructure#virtual-network-permission).
An `ingress_application_gateway` block supports the following:
  * `gateway_id` - (Optional) The ID of the Application Gateway to integrate with the ingress controller of this Kubernetes Cluster. See [this](https://docs.microsoft.com/azure/application-gateway/tutorial-ingress-controller-add-on-existing) page for further details.
  * `gateway_name` - (Optional) The name of the Application Gateway to be used or created in the Nodepool Resource Group, which in turn will be integrated with the ingress controller of this Kubernetes Cluster. See [this](https://docs.microsoft.com/azure/application-gateway/tutorial-ingress-controller-add-on-new) page for further details.
  * `subnet_cidr` - (Optional) The subnet CIDR to be used to create an Application Gateway, which in turn will be integrated with the ingress controller of this Kubernetes Cluster. See [this](https://docs.microsoft.com/azure/application-gateway/tutorial-ingress-controller-add-on-new) page for further details.
  * `subnet_id` - (Optional) The ID of the subnet on which to create an Application Gateway, which in turn will be integrated with the ingress controller of this Kubernetes Cluster. See [this](https://docs.microsoft.com/azure/application-gateway/tutorial-ingress-controller-add-on-new) page for further details.

  -> **Note:** Exactly one of `gateway_id`, `gateway_name`, `subnet_id`, or `subnet_cidr` must be specified.

  -> **Note:** If specifying `ingress_application_gateway` in conjunction with `only_critical_addons_enabled`, the AGIC pod will fail to start. A separate `azurerm_kubernetes_cluster_node_pool` is required to run the AGIC pod successfully. This is because AGIC is classed as a "non-critical addon".

Example Input:
```
ingress_application_gateway = {
  gateway_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.Network/applicationGateways/myAppGateway"
  gateway_name = "myAppGateway"
  subnet_cidr  = "10.20.0.0/24"
}
```
DESCRIPTION
}

variable "key_management_service" {
  type = object({
    key_vault_key_id         = string
    key_vault_network_access = optional(string, "Public")
  })
  default     = null
  description = <<DESCRIPTION
* `key_management_service` - (Optional) A `key_management_service` block as defined below. For more details, please visit [Key Management Service (KMS) etcd encryption to an AKS cluster](https://learn.microsoft.com/en-us/azure/aks/use-kms-etcd-encryption).
A `key_management_service` block supports the following:
  * `key_vault_key_id` - (Required) Identifier of Azure Key Vault key. See [key identifier format](https://learn.microsoft.com/en-us/azure/key-vault/general/about-keys-secrets-certificates#vault-name-and-object-name) for more details.
  * `key_vault_network_access` - (Optional) Network access of the key vault Network access of key vault. The possible values are `Public` and `Private`. `Public` means the key vault allows public access from all networks. `Private` means the key vault disables public access and enables private link. Defaults to `Public`.

Example Input:
```
key_management_service = {
  key_vault_key_id         = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.KeyVault/vaults/myKeyVault/keys/myKey"
  key_vault_network_access = "Private"
}
```
DESCRIPTION
}

variable "key_vault_secrets_provider" {
  type = object({
    secret_rotation_enabled  = optional(bool)
    secret_rotation_interval = optional(string, "2m")
  })
  default     = null
  description = <<DESCRIPTION
* `key_vault_secrets_provider` - (Optional) A `key_vault_secrets_provider` block as defined below. For more details, please visit [Azure Keyvault Secrets Provider for AKS](https://docs.microsoft.com/azure/aks/csi-secrets-store-driver).
A `key_vault_secrets_provider` block supports the following:
  * `secret_rotation_enabled` - (Optional) Should the secret store CSI driver on the AKS cluster be enabled?
  * `secret_rotation_interval` - (Optional) The interval to poll for secret rotation. This attribute is only set when `secret_rotation_enabled` is true. Defaults to `2m`.

  -> **Note:** To enable`key_vault_secrets_provider` either `secret_rotation_enabled` or `secret_rotation_interval` must be specified.

Example Input:
```
key_vault_secrets_provider = {
  secret_rotation_enabled  = true
  secret_rotation_interval = "2m"
}
```
DESCRIPTION
}

variable "kubelet_identity" {
  type = object({
    client_id                 = optional(string)
    object_id                 = optional(string)
    user_assigned_identity_id = optional(string)
  })
  default     = null
  description = <<DESCRIPTION
* `kubelet_identity` - (Optional) A `kubelet_identity` block as defined below.
The `kubelet_identity` block supports the following:
  * `client_id` - (Optional) The Client ID of the user-defined Managed Identity to be assigned to the Kubelets. If not specified a Managed Identity is created automatically. Changing this forces a new resource to be created.
  * `object_id` - (Optional) The Object ID of the user-defined Managed Identity assigned to the Kubelets.If not specified a Managed Identity is created automatically. Changing this forces a new resource to be created.
  * `user_assigned_identity_id` - (Optional) The ID of the User Assigned Identity assigned to the Kubelets. If not specified a Managed Identity is created automatically. Changing this forces a new resource to be created.

  -> **Note:** When `kubelet_identity` is enabled - The `type` field in the `identity` block must be set to `UserAssigned` and `identity_ids` must be set.

Example Input:
```
kubelet_identity = {
  client_id                 = "00000000-0000-0000-0000-000000000000"
  object_id                 = "11111111-1111-1111-1111-111111111111"
  user_assigned_identity_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ManagedIdentity/userAssignedIdentities/myUserAssignedIdentity"
}
```
DESCRIPTION
}

variable "linux_profile" {
  type = object({
    admin_username = string
    ssh_key = object({
      key_data = string
    })
  })
  default     = null
  description = <<DESCRIPTION
* `linux_profile` - (Optional) A `linux_profile` block as defined below.
A `linux_profile` block supports the following:
  * `admin_username` - (Required) The Admin Username for the Cluster. Changing this forces a new resource to be created.
  * `ssh_key` - (Required) An `ssh_key` block as defined below. Only one is currently allowed. Changing this will update the key on all node pools. More information can be found in [the documentation](https://learn.microsoft.com/en-us/azure/aks/node-access#update-ssh-key-on-an-existing-aks-cluster-preview).

A `ssh_key` block supports the following:
  * `key_data` - (Required) The Public SSH Key used to access the cluster. Changing this forces a new resource to be created.

Example Input:
```
linux_profile = {
  admin_username = "azureuser"
  ssh_key = {
    key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCy..."
  }
}
```
DESCRIPTION
}

variable "maintenance_window" {
  type = object({
    allowed = optional(set(object({
      day   = string
      hours = set(number)
    })))
    not_allowed = optional(set(object({
      end   = string
      start = string
    })))
  })
  default     = null
  description = <<DESCRIPTION
* `maintenance_window` - (Optional) A `maintenance_window` block as defined below.
A `maintenance_window` block supports the following:
  * `allowed` - (Optional) One or more `allowed` blocks as defined below.
  * `not_allowed` - (Optional) One or more `not_allowed` block as defined below.

An `allowed` block supports the following:
  * `day` - (Required) A day in a week. Possible values are `Sunday`, `Monday`, `Tuesday`, `Wednesday`, `Thursday`, `Friday` and `Saturday`.
  * `hours` - (Required) An array of hour slots in a day. For example, specifying `1` will allow maintenance from 1:00am to 2:00am. Specifying `1`, `2` will allow maintenance from 1:00am to 3:00m. Possible values are between `0` and `23`.

A `not_allowed` block supports the following:
  * `end` - (Required) The end of a time span, formatted as an RFC3339 string.
  * `start` - (Required) The start of a time span, formatted as an RFC3339 string.

Example Input:
```
maintenance_window = {
  allowed = [{
    day   = "Monday"
    hours = [1, 2, 3]
  }, {
    day   = "Tuesday"
    hours = [4, 5]
  }]
  not_allowed = [{
    start = "2023-01-01T00:00:00Z"
    end   = "2023-01-01T01:00:00Z"
  }, {
    start = "2023-01-02T02:00:00Z"
    end   = "2023-01-02T03:00:00Z"
  }]
}
```
DESCRIPTION
}

variable "maintenance_window_auto_upgrade" {
  type = object({
    frequency    = string
    interval     = number
    duration     = number
    day_of_week  = optional(string)
    day_of_month = optional(number)
    week_index   = optional(string)
    start_time   = optional(string)
    utc_offset   = optional(string)
    start_date   = optional(string)
    not_allowed = optional(set(object({
      end   = string
      start = string
    })))
  })
  default     = null
  description = <<DESCRIPTION
* `maintenance_window_auto_upgrade` - (Optional) A `maintenance_window_auto_upgrade` block as defined below.
A `maintenance_window_auto_upgrade` block supports the following:
  * `frequency` - (Required) Frequency of maintenance. Possible options are `Weekly`, `AbsoluteMonthly` and `RelativeMonthly`.
  * `interval` - (Required) The interval for maintenance runs. Depending on the frequency this interval is week or month based.
  * `duration` - (Required) The duration of the window for maintenance to run in hours. Possible options are between `4` to `24`.
  * `day_of_week` - (Optional) The day of the week for the maintenance run. Required in combination with weekly frequency. Possible values are `Friday`, `Monday`, `Saturday`, `Sunday`, `Thursday`, `Tuesday` and `Wednesday`.
  * `day_of_month` - (Optional) The day of the month for the maintenance run. Required in combination with AbsoluteMonthly frequency. Value between 0 and 31 (inclusive).
  * `week_index` - (Optional) Specifies on which instance of the allowed days specified in `day_of_week` the maintenance occurs. Options are `First`, `Second`, `Third`, `Fourth`, and `Last`. Required in combination with relative monthly frequency.
  * `start_time` - (Optional) The time for maintenance to begin, based on the timezone determined by `utc_offset`. Format is `HH:mm`.
  * `utc_offset` - (Optional) Used to determine the timezone for cluster maintenance.
  * `start_date` - (Optional) The date on which the maintenance window begins to take effect.
  * `not_allowed` - (Optional) One or more `not_allowed` block as defined below.

A `not_allowed` block supports the following:
  * `end` - (Required) The end of a time span, formatted as an RFC3339 string.
  * `start` - (Required) The start of a time span, formatted as an RFC3339 string.

Example Input:
```
maintenance_window_auto_upgrade = {
  frequency    = "Weekly"
  interval     = 1
  duration     = 4
  day_of_week  = "Monday"
  start_time   = "02:00"
  utc_offset   = "+00:00"
  start_date   = "2023-01-01"
  not_allowed = [{
    start = "2023-01-01T00:00:00Z"
    end   = "2023-01-01T01:00:00Z"
  }]
}
```
DESCRIPTION
}

variable "maintenance_window_node_os" {
  type = object({
    frequency    = string
    interval     = number
    duration     = number
    day_of_week  = optional(string)
    day_of_month = optional(number)
    week_index   = optional(string)
    start_time   = optional(string)
    utc_offset   = optional(string)
    start_date   = optional(string)
    not_allowed = optional(set(object({
      end   = string
      start = string
    })))
  })
  default     = null
  description = <<DESCRIPTION
* `maintenance_window_node_os` - (Optional) A `maintenance_window_node_os` block as defined below.
A `maintenance_window_node_os` block supports the following:
  * `frequency` - (Required) Frequency of maintenance. Possible options are `Daily`, `Weekly`, `AbsoluteMonthly` and `RelativeMonthly`.
  * `interval` - (Required) The interval for maintenance runs. Depending on the frequency this interval is week or month based.
  * `duration` - (Required) The duration of the window for maintenance to run in hours. Possible options are between `4` to `24`.
  * `day_of_week` - (Optional) The day of the week for the maintenance run. Required in combination with weekly frequency. Possible values are `Friday`, `Monday`, `Saturday`, `Sunday`, `Thursday`, `Tuesday` and `Wednesday`.
  * `day_of_month` - (Optional) The day of the month for the maintenance run. Required in combination with AbsoluteMonthly frequency. Value between 0 and 31 (inclusive).
  * `week_index` - (Optional) The week in the month used for the maintenance run. Options are `First`, `Second`, `Third`, `Fourth`, and `Last`.
  * `start_time` - (Optional) The time for maintenance to begin, based on the timezone determined by `utc_offset`. Format is `HH:mm`.
  * `utc_offset` - (Optional) Used to determine the timezone for cluster maintenance.
  * `start_date` - (Optional) The date on which the maintenance window begins to take effect.
  * `not_allowed` - (Optional) One or more `not_allowed` block as defined below.

A `not_allowed` block supports the following:
  * `end` - (Required) The end of a time span, formatted as an RFC3339 string.
  * `start` - (Required) The start of a time span, formatted as an RFC3339 string.

Example Input:
```
maintenance_window_node_os = {
  frequency    = "Weekly"
  interval     = 1
  duration     = 4
  day_of_week  = "Monday"
  start_time   = "02:00"
  utc_offset   = "+00:00"
  start_date   = "2023-01-01"
  not_allowed = [{
    start = "2023-01-01T00:00:00Z"
    end   = "2023-01-01T01:00:00Z"
  }]
}
```
DESCRIPTION
}

variable "microsoft_defender" {
  type = object({
    log_analytics_workspace_id = string
  })
  default     = null
  description = <<DESCRIPTION
* `microsoft_defender` - (Optional) A `microsoft_defender` block as defined below.
A `microsoft_defender` block supports the following:
  * `log_analytics_workspace_id` - (Required) Specifies the ID of the Log Analytics Workspace where the audit logs collected by Microsoft Defender should be sent to.

Example Input:
```
microsoft_defender = {
  log_analytics_workspace_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.OperationalInsights/workspaces/myWorkspace"
}
```
DESCRIPTION
}

variable "monitor_metrics" {
  type = object({
    annotations_allowed = optional(string)
    labels_allowed      = optional(string)
  })
  default     = null
  description = <<DESCRIPTION
* `monitor_metrics` - (Optional) Specifies a Prometheus add-on profile for the Kubernetes Cluster. A `monitor_metrics` block as defined below.

-> **Note:** If deploying Managed Prometheus, the `monitor_metrics` properties are required to configure the cluster for metrics collection. If no value is needed, set properties to `null`.
An `monitor_metrics` block supports the following:
  * `annotations_allowed` - (Optional) Specifies a comma-separated list of Kubernetes annotation keys that will be used in the resource's labels metric.
  * `labels_allowed` - (Optional) Specifies a Comma-separated list of additional Kubernetes label keys that will be used in the resource's labels metric.

  -> **Note:** Both properties `annotations_allowed` and `labels_allowed` are required if you are enabling Managed Prometheus with an existing Azure Monitor Workspace.

Example Input:
```
monitor_metrics = {
  annotations_allowed = "kubernetes.io/created-for/pvc/name,kubernetes.io/created-for/pod/name"
  labels_allowed      = "app,component,release"
}
```
DESCRIPTION
}

variable "network_profile" {
  type = object({
    network_plugin      = string
    network_mode        = optional(string)
    network_policy      = optional(string)
    dns_service_ip      = optional(string)
    network_data_plane  = optional(string, "azure")
    network_plugin_mode = optional(string)
    outbound_type       = optional(string, "loadBalancer")
    pod_cidr            = optional(string)
    pod_cidrs           = optional(list(string))
    service_cidr        = optional(string)
    service_cidrs       = optional(list(string))
    ip_versions         = optional(list(string))
    load_balancer_sku   = optional(string, "standard")
    load_balancer_profile = optional(object({
      backend_pool_type           = optional(string, "NodeIPConfiguration")
      idle_timeout_in_minutes     = optional(number, 30)
      managed_outbound_ip_count   = optional(number)
      managed_outbound_ipv6_count = optional(number)
      outbound_ip_address_ids     = optional(set(string))
      outbound_ip_prefix_ids      = optional(set(string))
      outbound_ports_allocated    = optional(number, 0)
    }))
    nat_gateway_profile = optional(object({
      idle_timeout_in_minutes   = optional(number, 4)
      managed_outbound_ip_count = optional(number)
    }))
  })
  default     = null
  description = <<DESCRIPTION
* `network_profile` - (Optional) A `network_profile` block as defined below. Changing this forces a new resource to be created.

-> **Note:** If `network_profile` is not defined, `kubenet` profile will be used by default.
A `network_profile` block supports the following:
  * `network_plugin` - (Required) Network plugin to use for networking. Currently supported values are `azure`, `kubenet` and `none`. Changing this forces a new resource to be created.

  -> **Note:** When `network_plugin` is set to `azure` - the `pod_cidr` field must not be set, unless specifying `network_plugin_mode` to `overlay`.
  * `network_mode` - (Optional) Network mode to be used with Azure CNI. Possible values are `bridge` and `transparent`. Changing this forces a new resource to be created.

  ~> **Note:** `network_mode` can only be set to `bridge` for existing Kubernetes Clusters and cannot be used to provision new Clusters - this will be removed by Azure in the future.

  ~> **Note:** This property can only be set when `network_plugin` is set to `azure`.
  * `network_policy` - (Optional) Sets up network policy to be used with Azure CNI. [Network policy allows us to control the traffic flow between pods](https://docs.microsoft.com/azure/aks/use-network-policies). Currently supported values are `calico`, `azure` and `cilium`.

  ~> **Note:** When `network_policy` is set to `azure`, the `network_plugin` field can only be set to `azure`.

  ~> **Note:** When `network_policy` is set to `cilium`, the `network_data_plane` field must be set to `cilium`.
  * `dns_service_ip` - (Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). Changing this forces a new resource to be created.
  * `network_data_plane` - (Optional) Specifies the data plane used for building the Kubernetes network. Possible values are `azure` and `cilium`. Defaults to `azure`. Disabling this forces a new resource to be created.

  ~> **Note:** When `network_data_plane` is set to `cilium`, the `network_plugin` field can only be set to `azure`.

  ~> **Note:** When `network_data_plane` is set to `cilium`, one of either `network_plugin_mode = "overlay"` or `pod_subnet_id` must be specified.
  * `network_plugin_mode` - (Optional) Specifies the network plugin mode used for building the Kubernetes network. Possible value is `overlay`.

  ~> **Note:** When `network_plugin_mode` is set to `overlay`, the `network_plugin` field can only be set to `azure`. When upgrading from Azure CNI without overlay, `pod_subnet_id` must be specified.
  * `outbound_type` - (Optional) The outbound (egress) routing method which should be used for this Kubernetes Cluster. Possible values are `loadBalancer`, `userDefinedRouting`, `managedNATGateway` and `userAssignedNATGateway`. Defaults to `loadBalancer`. More information on supported migration paths for `outbound_type` can be found in [this documentation](https://learn.microsoft.com/azure/aks/egress-outboundtype#updating-outboundtype-after-cluster-creation).
  * `pod_cidr` - (Optional) The CIDR to use for pod IP addresses. This field can only be set when `network_plugin` is set to `kubenet` or `network_plugin_mode` is set to `overlay`. Changing this forces a new resource to be created.
  * `pod_cidrs` - (Optional) A list of CIDRs to use for pod IP addresses. For single-stack networking a single IPv4 CIDR is expected. For dual-stack networking an IPv4 and IPv6 CIDR are expected. Changing this forces a new resource to be created.
  * `service_cidr` - (Optional) The Network Range used by the Kubernetes service. Changing this forces a new resource to be created.
  * `service_cidrs` - (Optional) A list of CIDRs to use for Kubernetes services. For single-stack networking a single IPv4 CIDR is expected. For dual-stack networking an IPv4 and IPv6 CIDR are expected. Changing this forces a new resource to be created.Examples of how to use [AKS with Advanced Networking](https://docs.microsoft.com/azure/aks/networking-overview#advanced-networking) can be [found in the `./examples/kubernetes/` directory in the GitHub repository](https://github.com/hashicorp/terraform-provider-azurerm/tree/main/examples/kubernetes).

  ~> **Note:** This range should not be used by any network element on or connected to this VNet. Service address CIDR must be smaller than /12. `docker_bridge_cidr`, `dns_service_ip` and `service_cidr` should all be empty or all should be set.
  * `ip_versions` - (Optional) Specifies a list of IP versions the Kubernetes Cluster will use to assign IP addresses to its nodes and pods. Possible values are `IPv4` and/or `IPv6`. `IPv4` must always be specified. Changing this forces a new resource to be created.

  -> **Note:** To configure dual-stack networking `ip_versions` should be set to `["IPv4", "IPv6"]`.

  -> **Note:** Dual-stack networking requires that the Preview Feature `Microsoft.ContainerService/AKS-EnableDualStack` is enabled and the Resource Provider is re-registered, see [the documentation](https://docs.microsoft.com/azure/aks/configure-kubenet-dual-stack?tabs=azure-cli%2Ckubectl#register-the-aks-enabledualstack-preview-feature) for more information.
  * `load_balancer_sku` - (Optional) Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are `basic` and `standard`. Defaults to `standard`. Changing this forces a new resource to be created.
  * `load_balancer_profile` - (Optional) A `load_balancer_profile` block as defined below. This can only be specified when `load_balancer_sku` is set to `standard`. Changing this forces a new resource to be created.
  * `nat_gateway_profile` - (Optional) A `nat_gateway_profile` block as defined below. This can only be specified when `load_balancer_sku` is set to `standard` and `outbound_type` is set to `managedNATGateway` or `userAssignedNATGateway`. Changing this forces a new resource to be created.

A `load_balancer_profile` block supports the following:

~> **Note:** The fields `managed_outbound_ip_count`, `outbound_ip_address_ids` and `outbound_ip_prefix_ids` are mutually exclusive. Note that when specifying `outbound_ip_address_ids` ([azurerm_public_ip](/docs/providers/azurerm/r/public_ip.html)) the SKU must be `standard`.
  * `backend_pool_type` - (Optional) The type of the managed inbound Load Balancer Backend Pool. Possible values are `NodeIP` and `NodeIPConfiguration`. Defaults to `NodeIPConfiguration`. See [the documentation](https://learn.microsoft.com/en-us/azure/aks/load-balancer-standard#change-the-inbound-pool-type) for more information.
  * `idle_timeout_in_minutes` - (Optional) Desired outbound flow idle timeout in minutes for the cluster load balancer. Must be between `4` and `100` inclusive. Defaults to `30`.
  * `managed_outbound_ip_count` - (Optional) Count of desired managed outbound IPs for the cluster load balancer. Must be between `1` and `100` inclusive.
  * `managed_outbound_ipv6_count` - (Optional) The desired number of IPv6 outbound IPs created and managed by Azure for the cluster load balancer. Must be in the range of 1 to 100 (inclusive). The default value is 0 for single-stack and 1 for dual-stack.

  ~> **Note:** `managed_outbound_ipv6_count` requires dual-stack networking. To enable dual-stack networking the Preview Feature `Microsoft.ContainerService/AKS-EnableDualStack` needs to be enabled and the Resource Provider re-registered, see [the documentation](https://docs.microsoft.com/azure/aks/configure-kubenet-dual-stack?tabs=azure-cli%2Ckubectl#register-the-aks-enabledualstack-preview-feature) for more information.
  * `outbound_ip_address_ids` - (Optional) The ID of the Public IP Addresses which should be used for outbound communication for the cluster load balancer.

  -> **Note:** Set `outbound_ip_address_ids` to an empty slice `[]` in order to unlink it from the cluster. Unlinking a `outbound_ip_address_ids` will revert the load balancing for the cluster back to a managed one.
  * `outbound_ip_prefix_ids` - (Optional) The ID of the outbound Public IP Address Prefixes which should be used for the cluster load balancer.

  -> **Note:** Set `outbound_ip_prefix_ids` to an empty slice `[]` in order to unlink it from the cluster. Unlinking a `outbound_ip_prefix_ids` will revert the load balancing for the cluster back to a managed one.
  * `outbound_ports_allocated` - (Optional) Number of desired SNAT port for each VM in the clusters load balancer. Must be between `0` and `64000` inclusive. Defaults to `0`.

A `nat_gateway_profile` block supports the following:
  * `idle_timeout_in_minutes` - (Optional) Desired outbound flow idle timeout in minutes for the managed nat gateway. Must be between `4` and `120` inclusive. Defaults to `4`.
  * `managed_outbound_ip_count` - (Optional) Count of desired managed outbound IPs for the managed nat gateway. Must be between `1` and `16` inclusive.

Example Input:
```
network_profile = {
  network_plugin      = "azure"
  network_policy      = "calico"
  network_data_plane  = "azure"
  outbound_type       = "loadBalancer"
  pod_cidrs = [
    module.snet-pods.subnet.address_prefixes[0],
  ]
  service_cidrs     = ["10.254.0.0/16"]
  dns_service_ip    = "10.254.0.254"
  ip_versions       = ["IPv4"]
  load_balancer_sku = "standard"
  load_balancer_profile = {
    backend_pool_type        = "NodeIPConfiguration"
    idle_timeout_in_minutes  = 4
    outbound_ports_allocated = 0
  }
}
```
DESCRIPTION
}

variable "oms_agent" {
  type = object({
    log_analytics_workspace_id      = string
    msi_auth_for_monitoring_enabled = optional(bool)
  })
  default     = null
  description = <<DESCRIPTION
* `oms_agent` - (Optional) A `oms_agent` block as defined below.

An `oms_agent` block supports the following:
  * `log_analytics_workspace_id` - (Required) The ID of the Log Analytics Workspace which the OMS Agent should send data to.
  * `msi_auth_for_monitoring_enabled` - (Optional) Is managed identity authentication for monitoring enabled?

Example Input:
```
oms_agent = {
  log_analytics_workspace_id      = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.OperationalInsights/workspaces/myWorkspace"
  msi_auth_for_monitoring_enabled = true
}
```
DESCRIPTION
}

variable "service_mesh_profile" {
  type = object({
    mode                             = string
    revisions                        = list(string)
    internal_ingress_gateway_enabled = optional(bool)
    external_ingress_gateway_enabled = optional(bool)
    certificate_authority = optional(object({
      key_vault_id           = string
      root_cert_object_name  = string
      cert_chain_object_name = string
      cert_object_name       = string
      key_object_name        = string
    }))
  })
  default     = null
  description = <<DESCRIPTION
* `service_mesh_profile` - (Optional) A `service_mesh_profile` block as defined below.
A `service_mesh_profile` block supports the following:
  * `mode` - (Required) The mode of the service mesh. Possible value is `Istio`.
  * `revisions` - (Required) Specify 1 or 2 Istio control plane revisions for managing minor upgrades using the canary upgrade process. For example, create the resource with `revisions` set to `["asm-1-20"]`, or leave it empty (the `revisions` will only be known after apply). To start the canary upgrade, change `revisions` to `["asm-1-20", "asm-1-21"]`. To roll back the canary upgrade, revert to `["asm-1-20"]`. To confirm the upgrade, change to `["asm-1-21"]`.

  -> **Note:** Upgrading to a new (canary) revision does not affect existing sidecar proxies. You need to apply the canary revision label to selected namespaces and restart pods with kubectl to inject the new sidecar proxy. [Learn more](https://istio.io/latest/docs/setup/upgrade/canary/#data-plane).
  * `internal_ingress_gateway_enabled` - (Optional) Is Istio Internal Ingress Gateway enabled?
  * `external_ingress_gateway_enabled` - (Optional) Is Istio External Ingress Gateway enabled?

  -> **Note:** Currently only one Internal Ingress Gateway and one External Ingress Gateway are allowed per cluster
  * `certificate_authority` - (Optional) A `certificate_authority` block as defined below. When this property is specified, `key_vault_secrets_provider` is also required to be set. This configuration allows you to bring your own root certificate and keys for Istio CA in the Istio-based service mesh add-on for Azure Kubernetes Service.

A `certificate_authority` block supports the following:
  * `key_vault_id` - (Required) The resource ID of the Key Vault.
  * `root_cert_object_name` - (Required) The root certificate object name in Azure Key Vault.
  * `cert_chain_object_name` - (Required) The certificate chain object name in Azure Key Vault.
  * `cert_object_name` - (Required) The intermediate certificate object name in Azure Key Vault.
  * `key_object_name` - (Required) The intermediate certificate private key object name in Azure Key Vault.

  -> **Note:** For more information on [Istio-based service mesh add-on with plug-in CA certificates and how to generate these certificates](https://learn.microsoft.com/en-us/azure/aks/istio-plugin-ca)

Example Input:
```
service_mesh_profile = {
  mode                             = "Istio"
  revisions                        = ["asm-1-20"]
  internal_ingress_gateway_enabled = true
  external_ingress_gateway_enabled = true
  certificate_authority = {
    key_vault_id           = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.KeyVault/vaults/myKeyVault"
    root_cert_object_name  = "rootCert"
    cert_chain_object_name = "certChain"
    cert_object_name       = "cert"
    key_object_name        = "key"
  }
}
```
DESCRIPTION
}

variable "workload_autoscaler_profile" {
  type = object({
    keda_enabled                    = optional(bool)
    vertical_pod_autoscaler_enabled = optional(bool)
  })
  default     = null
  description = <<DESCRIPTION
* `workload_autoscaler_profile` - (Optional) A `workload_autoscaler_profile` block defined below.
A `workload_autoscaler_profile` block supports the following:
  * `keda_enabled` - (Optional) Specifies whether KEDA Autoscaler can be used for workloads.
  * `vertical_pod_autoscaler_enabled` - (Optional) Specifies whether Vertical Pod Autoscaler should be enabled.

  -> **Note:** This requires that the Preview Feature `Microsoft.ContainerService/AKS-VPAPreview` is enabled and the Resource Provider is re-registered, see [the documentation]([Microsoft.ContainerService/AKS-VPAPreview](https://learn.microsoft.com/en-us/azure/aks/vertical-pod-autoscaler#register-the-aks-vpapreview-feature-flag) for more information.

Example Input:
```
workload_autoscaler_profile = {
  keda_enabled                    = true
  vertical_pod_autoscaler_enabled = true
}
```
DESCRIPTION
}

variable "service_principal" {
  type = object({
    client_id     = string
    client_secret = string
  })
  default     = null
  description = <<DESCRIPTION
* `service_principal` - (Optional) A `service_principal` block as documented below. One of either `identity` or `service_principal` must be specified.

!> **Note:** A migration scenario from `service_principal` to `identity` is supported. When upgrading `service_principal` to `identity`, your cluster's control plane and addon pods will switch to use managed identity, but the kubelets will keep using your configured `service_principal` until you upgrade your Node Pool.
A `service_principal` block supports the following:
  * `client_id` - (Required) The Client ID for the Service Principal.
  * `client_secret` - (Required) The Client Secret for the Service Principal.

Example Input:
```
service_principal = {
  client_id     = "00000000-0000-0000-0000-000000000000"
  client_secret = "00000000-0000-0000-0000-000000000000"
}
```
DESCRIPTION
}

variable "storage_profile" {
  type = object({
    blob_driver_enabled         = optional(bool, false)
    disk_driver_enabled         = optional(bool, true)
    file_driver_enabled         = optional(bool, true)
    snapshot_controller_enabled = optional(bool, true)
  })
  default     = null
  description = <<DESCRIPTION
* `storage_profile` - (Optional) A `storage_profile` block as defined below.
A `storage_profile` block supports the following:
  * `blob_driver_enabled` - (Optional) Is the Blob CSI driver enabled? Defaults to `false`.
  * `disk_driver_enabled` - (Optional) Is the Disk CSI driver enabled? Defaults to `true`.
  * `file_driver_enabled` - (Optional) Is the File CSI driver enabled? Defaults to `true`.
  * `snapshot_controller_enabled` - (Optional) Is the Snapshot Controller enabled? Defaults to `true`.

Example Input:
```
storage_profile = {
  blob_driver_enabled         = true
  disk_driver_e
  nabled         = true
  file_driver_enabled         = true
  snapshot_controller_enabled = true
}
```
DESCRIPTION
}

variable "upgrade_override" {
  type = object({
    force_upgrade_enabled = bool
    effective_until       = optional(string)
  })
  default     = null
  description = <<DESCRIPTION
* `upgrade_override` - (Optional) A `upgrade_override` block as defined below.
The `upgrade_override` block supports the following:

-> **Note:** Once set, the `upgrade_override` block cannot be removed from the configuration.
  * `force_upgrade_enabled` - (Required) Whether to force upgrade the cluster. Possible values are `true` or `false`.

  !> **Note:** The `force_upgrade_enabled` field instructs the upgrade operation to bypass upgrade protections (e.g. checking for deprecated API usage) which may render the cluster inoperative after the upgrade process has completed. Use the `force_upgrade_enabled` option with extreme caution only.
  * `effective_until` - (Optional) Specifies the duration, in RFC 3339 format (e.g., `2025-10-01T13:00:00Z`), the `upgrade_override` values are effective. This field must be set for the `upgrade_override` values to take effect. The date-time must be within the next 30 days.

  -> **Note:** This only matches the start time of an upgrade, and the effectiveness won't change once an upgrade starts even if the `effective_until` value expires as the upgrade proceeds.

Example Input:
```
upgrade_override = {
  force_upgrade_enabled = true
  effective_until       = "2025-10-01T13:00:00Z"
}
```
DESCRIPTION
}

variable "web_app_routing" {
  type = object({
    dns_zone_ids = list(string)
  })
  default     = null
  description = <<DESCRIPTION
* `web_app_routing` - (Optional) A `web_app_routing` block as defined below.
A `web_app_routing` block supports the following:
  * `dns_zone_ids` - (Required) Specifies the list of the DNS Zone IDs in which DNS entries are created for applications deployed to the cluster when Web App Routing is enabled. If not using Bring-Your-Own DNS zones this property should be set to an empty list.

Example Input:
```
web_app_routing = {
  dns_zone_ids = [
    "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.Network/privateDnsZones/myzone.com",
  ]
}
```
DESCRIPTION
}

variable "windows_profile" {
  type = object({
    admin_username = string
    admin_password = optional(string)
    license        = optional(string)
    gmsa = optional(object({
      dns_server  = string
      root_domain = string
    }))
  })
  default     = null
  description = <<DESCRIPTION
* `windows_profile` - (Optional) A `windows_profile` block as defined below.
A `windows_profile` block supports the following:
  * `admin_username` - (Required) The Admin Username for Windows VMs. Changing this forces a new resource to be created.
  * `admin_password` - (Optional) The Admin Password for Windows VMs. Length must be between 14 and 123 characters.
  * `license` - (Optional) Specifies the type of on-premise license which should be used for Node Pool Windows Virtual Machine. At this time the only possible value is `Windows_Server`.
  * `gmsa` - (Optional) A `gmsa` block as defined below.

A `gmsa` block supports the following:
  * `dns_server` - (Required) Specifies the DNS server for Windows gMSA. Set this to an empty string if you have configured the DNS server in the VNet which was used to create the managed cluster.
  * `root_domain` - (Required) Specifies the root domain name for Windows gMSA. Set this to an empty string if you have configured the DNS server in the VNet which was used to create the managed cluster.

  -> **Note:** The properties `dns_server` and `root_domain` must both either be set or unset, i.e. empty.

Example Input:
```
windows_profile = {
  admin_username = "azureuser"
  admin_password = "CHNGEME1234567890!"
  license        = "Windows_Server"
}
DESCRIPTION
}

variable "timeouts" {
  type = object({
    create = optional(string, "90")
    read   = optional(string, "5")
    update = optional(string, "90")
    delete = optional(string, "90")
  })
  default     = null
  description = <<DESCRIPTION
The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/language/resources/syntax#operation-timeouts) for certain actions:
  * `create` - (Defaults to 90 minutes) Used when creating the Kubernetes Cluster.
  * `read` - (Defaults to 5 minutes) Used when retrieving the Kubernetes Cluster.
  * `update` - (Defaults to 90 minutes) Used when updating the Kubernetes Cluster.
  * `delete` - (Defaults to 90 minutes) Used when deleting the Kubernetes Cluster.

Example Input:
```
timeouts = {
  create = "90"
  read   = "5"
  update = "90"
  delete = "90"
}
```
DESCRIPTION
}

# kubernetes_cluster_trusted_access_role_binding
variable "trusted_access_role_binding" {
  type = map(object({
    kubernetes_cluster_id = optional(string)
    name                  = string
    roles                 = list(string)
    source_resource_id    = string
    timeouts = optional(object({
      create = optional(string, "30")
      read   = optional(string, "5")
      update = optional(string, "30")
      delete = optional(string, "30")
    }))
  }))
  default     = null
  description = <<DESCRIPTION
* `kubernetes_cluster_trusted_access_role_binding` - (Optional) The `kubernetes_cluster_trusted_access_role_binding` block resource as defined below.
  * `kubernetes_cluster_id` - (Required) Specifies the Kubernetes Cluster Id within which this Kubernetes Cluster Trusted Access Role Binding should exist. Changing this forces a new Kubernetes Cluster Trusted Access Role Binding to be created.
  * `name` - (Required) Specifies the name of this Kubernetes Cluster Trusted Access Role Binding. Changing this forces a new Kubernetes Cluster Trusted Access Role Binding to be created.
  * `roles` - (Required) A list of roles to bind, each item is a resource type qualified role name.
  * `source_resource_id` - (Required) The ARM resource ID of source resource that trusted access is configured for. Changing this forces a new Kubernetes Cluster Trusted Access Role Binding to be created.

The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/docs/configuration/resources.html#timeouts) for certain actions:
  * `create` - (Defaults to 30 minutes) Used when creating the Kubernetes Cluster Trusted Access Role Binding.
  * `read` - (Defaults to 5 minutes) Used when retrieving the Kubernetes Cluster Trusted Access Role Binding.
  * `update` - (Defaults to 30 minutes) Used when updating the Kubernetes Cluster Trusted Access Role Binding.
  * `delete` - (Defaults to 30 minutes) Used when deleting the Kubernetes Cluster Trusted Access Role Binding.

Example Input:
```
kubernetes_cluster_trusted_access_role_binding = {
  "example" = {
    kubernetes_cluster_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ContainerService/managedClusters/myCluster"
    name                  = "example-role-binding"
    roles                 = ["Microsoft.ContainerService/managedClusters/clusterAdmin"]
    source_resource_id    = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.ContainerService/managedClusters/myCluster"
    timeouts = {
      create = "30"
      read   = "5"
      update = "30"
      delete = "30"
    }
  }
}
```
DESCRIPTION
}