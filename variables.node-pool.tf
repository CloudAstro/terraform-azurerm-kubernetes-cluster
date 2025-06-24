# kubernetes_cluster_node_pool
variable "node_pool" {
  type = map(object({
    name                          = string
    kubernetes_cluster_id         = optional(string)
    vm_size                       = string
    capacity_reservation_group_id = optional(string)
    auto_scaling_enabled          = optional(bool)
    host_encryption_enabled       = optional(bool)
    node_public_ip_enabled        = optional(bool)
    eviction_policy               = optional(string, "Delete")
    host_group_id                 = optional(string)
    fips_enabled                  = optional(bool)
    gpu_instance                  = optional(string)
    kubelet_disk_type             = optional(string)
    max_pods                      = optional(number)
    mode                          = optional(string, "User")
    node_labels                   = optional(map(string))
    node_public_ip_prefix_id      = optional(string)
    node_taints                   = optional(list(string))
    orchestrator_version          = optional(string)
    os_disk_size_gb               = optional(number)
    os_disk_type                  = optional(string, "Managed")
    pod_subnet_id                 = optional(string)
    os_sku                        = optional(string)
    os_type                       = optional(string, "Linux")
    priority                      = optional(string, "Regular")
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
      node_soak_duration_in_minutes = optional(number)
      max_surge                     = string
    }))
    windows_profile = optional(object({
      outbound_nat_enabled = optional(bool, true)
    }))
    timeouts = optional(object({
      create = optional(string, "1")
      read   = optional(string, "5")
      update = optional(string, "1")
      delete = optional(string, "1")
    }))
  }))
  default     = null
  description = <<DESCRIPTION
* `kubernetes_cluster_node_pool` - (Optional) The `kubernetes_cluster_node_pool` block resource as defined below.
  * `name` - (Required) The name of the Node Pool which should be created within the Kubernetes Cluster. Changing this forces a new resource to be created.

  ~> **Note:** A Windows Node Pool cannot have a `name` longer than 6 characters.
  * `kubernetes_cluster_id` - (Required) The ID of the Kubernetes Cluster where this Node Pool should exist. Changing this forces a new resource to be created.

  ~> **Note:** The type of Default Node Pool for the Kubernetes Cluster must be `VirtualMachineScaleSets` to attach multiple node pools.
  * `vm_size` - (Required) The SKU which should be used for the Virtual Machines used in this Node Pool. Changing this property requires specifying `temporary_name_for_rotation`.
  * `capacity_reservation_group_id` - (Optional) Specifies the ID of the Capacity Reservation Group where this Node Pool should exist. Changing this forces a new resource to be created.
  * `auto_scaling_enabled` - (Optional) Whether to enable [auto-scaler](https://docs.microsoft.com/azure/aks/cluster-autoscaler).
  * `host_encryption_enabled` - (Optional) Should the nodes in this Node Pool have host encryption enabled? Changing this property requires specifying `temporary_name_for_rotation`.

  ~> **Note:** Additional fields must be configured depending on the value of this field - see below.
  * `node_public_ip_enabled` - (Optional) Should each node have a Public IP Address? Changing this property requires specifying `temporary_name_for_rotation`.
  * `eviction_policy` - (Optional) The Eviction Policy which should be used for Virtual Machines within the Virtual Machine Scale Set powering this Node Pool. Possible values are `Deallocate` and `Delete`. Changing this forces a new resource to be created.

  ~> **Note:** An Eviction Policy can only be configured when `priority` is set to `Spot` and will default to `Delete` unless otherwise specified.
  * `host_group_id` - (Optional) The fully qualified resource ID of the Dedicated Host Group to provision virtual machines from. Changing this forces a new resource to be created.
  * `fips_enabled` - (Optional) Should the nodes in this Node Pool have Federal Information Processing Standard enabled? Changing this property requires specifying `temporary_name_for_rotation`.

  ~> **Note:** FIPS support is in Public Preview - more information and details on how to opt into the Preview can be found in [this article](https://docs.microsoft.com/azure/aks/use-multiple-node-pools#add-a-fips-enabled-node-pool-preview).
  * `gpu_instance` - (Optional) Specifies the GPU MIG instance profile for supported GPU VM SKU. The allowed values are `MIG1g`, `MIG2g`, `MIG3g`, `MIG4g` and `MIG7g`. Changing this forces a new resource to be created.
  * `kubelet_disk_type` - (Optional) The type of disk used by kubelet. Possible values are `OS` and `Temporary`. Changing this property requires specifying `temporary_name_for_rotation`.
  * `max_pods` - (Optional) The maximum number of pods that can run on each agent. Changing this property requires specifying `temporary_name_for_rotation`.
  * `mode` - (Optional) Should this Node Pool be used for System or User resources? Possible values are `System` and `User`. Defaults to `User`.
  * `node_labels` - (Optional) A map of Kubernetes labels which should be applied to nodes in this Node Pool.
  * `node_public_ip_prefix_id` - (Optional) Resource ID for the Public IP Addresses Prefix for the nodes in this Node Pool. `node_public_ip_enabled` should be `true`. Changing this forces a new resource to be created.
  * `node_taints` - (Optional) A list of Kubernetes taints which should be applied to nodes in the agent pool (e.g `key=value:NoSchedule`).
  * `orchestrator_version` - (Optional) Version of Kubernetes used for the Agents. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). AKS does not require an exact patch version to be specified, minor version aliases such as `1.22` are also supported. - The minor version's latest GA patch is automatically chosen in that case. More details can be found in [the documentation](https://docs.microsoft.com/en-us/azure/aks/supported-kubernetes-versions?tabs=azure-cli#alias-minor-version).

  -> **Note:** This version must be supported by the Kubernetes Cluster - as such the version of Kubernetes used on the Cluster/Control Plane may need to be upgraded first.
  * `os_disk_size_gb` - (Optional) The Agent Operating System disk size in GB. Changing this property requires specifying `temporary_name_for_rotation`.
  * `os_disk_type` - (Optional) The type of disk which should be used for the Operating System. Possible values are `Ephemeral` and `Managed`. Defaults to `Managed`. Changing this property requires specifying `temporary_name_for_rotation`.
  * `pod_subnet_id` - (Optional) The ID of the Subnet where the pods in the Node Pool should exist. Changing this property requires specifying `temporary_name_for_rotation`.
  * `os_sku` - (Optional) Specifies the OS SKU used by the agent pool. Possible values are `AzureLinux`, `Ubuntu`, `Windows2019` and `Windows2022`. If not specified, the default is `Ubuntu` if OSType=Linux or `Windows2019` if OSType=Windows. And the default Windows OSSKU will be changed to `Windows2022` after Windows2019 is deprecated. Changing this from `AzureLinux` or `Ubuntu` to `AzureLinux` or `Ubuntu` will not replace the resource, otherwise it forces a new resource to be created.
  * `os_type` - (Optional) The Operating System which should be used for this Node Pool. Changing this forces a new resource to be created. Possible values are `Linux` and `Windows`. Defaults to `Linux`.
  * `priority` - (Optional) The Priority for Virtual Machines within the Virtual Machine Scale Set that powers this Node Pool. Possible values are `Regular` and `Spot`. Defaults to `Regular`. Changing this forces a new resource to be created.
  * `proximity_placement_group_id` - (Optional) The ID of the Proximity Placement Group where the Virtual Machine Scale Set that powers this Node Pool will be placed. Changing this forces a new resource to be created.

  -> **Note:** When setting `priority` to Spot - you must configure an `eviction_policy`, `spot_max_price` and add the applicable `node_labels` and `node_taints` [as per the Azure Documentation](https://docs.microsoft.com/azure/aks/spot-node-pool).
  * `spot_max_price` - (Optional) The maximum price you're willing to pay in USD per Virtual Machine. Valid values are `-1` (the current on-demand price for a Virtual Machine) or a positive value with up to five decimal places. Changing this forces a new resource to be created.

  ~> **Note:** This field can only be configured when `priority` is set to `Spot`.
  * `snapshot_id` - (Optional) The ID of the Snapshot which should be used to create this Node Pool. Changing this property requires specifying `temporary_name_for_rotation`.
  * `tags` - (Optional) A mapping of tags to assign to the resource.

  ~> **Note:** At this time there's a bug in the AKS API where Tags for a Node Pool are not stored in the correct case - you [may wish to use Terraform's `ignore_changes` functionality to ignore changes to the casing](https://www.terraform.io/language/meta-arguments/lifecycle#ignore_changess) until this is fixed in the AKS API.
  * `scale_down_mode` - (Optional) Specifies how the node pool should deal with scaled-down nodes. Allowed values are `Delete` and `Deallocate`. Defaults to `Delete`.
  * `temporary_name_for_rotation` - (Optional) Specifies the name of the temporary node pool used to cycle the node pool when one of the relevant properties are updated.
  * `ultra_ssd_enabled` - (Optional) Used to specify whether the UltraSSD is enabled in the Node Pool. Defaults to `false`. See [the documentation](https://docs.microsoft.com/azure/aks/use-ultra-disks) for more information. Changing this property requires specifying `temporary_name_for_rotation`.
  * `vnet_subnet_id` - (Optional) The ID of the Subnet where this Node Pool should exist. Changing this property requires specifying `temporary_name_for_rotation`.

  ~> **Note:** A route table must be configured on this Subnet.
  * `workload_runtime` - (Optional) Used to specify the workload runtime. Allowed values are `OCIContainer` and `WasmWasi`.

  ~> **Note:** WebAssembly System Interface node pools are in Public Preview - more information and details on how to opt into the preview can be found in [this article](https://docs.microsoft.com/azure/aks/use-wasi-node-pools)
  * `zones` - (Optional) Specifies a list of Availability Zones in which this Kubernetes Cluster Node Pool should be located. Changing this property requires specifying `temporary_name_for_rotation`.If `auto_scaling_enabled` is set to `true`, then the following fields can also be configured:
  * `max_count` - (Optional) The maximum number of nodes which should exist within this Node Pool. Valid values are between `0` and `1000` and must be greater than or equal to `min_count`.
  * `min_count` - (Optional) The minimum number of nodes which should exist within this Node Pool. Valid values are between `0` and `1000` and must be less than or equal to `max_count`.
  * `node_count` - (Optional) The number of nodes which should exist within this Node Pool. Valid values are between `0` and `1000` (inclusive) for user pools and between `1` and `1000` (inclusive) for system pools.
  * `kubelet_config` - (Optional) A `kubelet_config` block as defined below. Changing this requires specifying `temporary_name_for_rotation`.
  * `linux_os_config` - (Optional) A `linux_os_config` block as defined below. Changing this requires specifying `temporary_name_for_rotation`.
  * `node_network_profile` - (Optional) A `node_network_profile` block as documented below.
  * `upgrade_settings` - (Optional) A `upgrade_settings` block as documented below.
  * `windows_profile` - (Optional) A `windows_profile` block as documented below. Changing this forces a new resource to be created.

A `kubelet_config` block supports the following:
  * `allowed_unsafe_sysctls` - (Optional) Specifies the allow list of unsafe sysctls command or patterns (ending in `*`). 
  * `container_log_max_line` - (Optional) Specifies the maximum number of container log files that can be present for a container. must be at least 2. 
  * `container_log_max_size_mb` - (Optional) Specifies the maximum size (e.g. 10MB) of container log file before it is rotated. 
  * `cpu_cfs_quota_enabled` - (Optional) Is CPU CFS quota enforcement for containers enabled? Defaults to `true`.
  * `cpu_cfs_quota_period` - (Optional) Specifies the CPU CFS quota period value. 
  * `cpu_manager_policy` - (Optional) Specifies the CPU Manager policy to use. Possible values are `none` and `static`, 
  * `image_gc_high_threshold` - (Optional) Specifies the percent of disk usage above which image garbage collection is always run. Must be between `0` and `100`. 
  * `image_gc_low_threshold` - (Optional) Specifies the percent of disk usage lower than which image garbage collection is never run. Must be between `0` and `100`. 
  * `pod_max_pid` - (Optional) Specifies the maximum number of processes per pod. 
  * `topology_manager_policy` - (Optional) Specifies the Topology Manager policy to use. Possible values are `none`, `best-effort`, `restricted` or `single-numa-node`. 

A `linux_os_config` block supports the following:
  * `swap_file_size_mb` - (Optional) Specifies the size of swap file on each node in MB.
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
  * `net_ipv4_tcp_tw_reuse` - (Optional) Is sysctl setting net.ipv4.tcp_tw_reuse enabled?
  * `net_netfilter_nf_conntrack_buckets` - (Optional) The sysctl setting net.netfilter.nf_conntrack_buckets. Must be between `65536` and `524288`.
  * `net_netfilter_nf_conntrack_max` - (Optional) The sysctl setting net.netfilter.nf_conntrack_max. Must be between `131072` and `2097152`.
  * `vm_max_map_count` - (Optional) The sysctl setting vm.max_map_count. Must be between `65530` and `262144`.
  * `vm_swappiness` - (Optional) The sysctl setting vm.swappiness. Must be between `0` and `100`.
  * `vm_vfs_cache_pressure` - (Optional) The sysctl setting vm.vfs_cache_pressure. Must be between `0` and `100`.

A `node_network_profile` block supports the following:
  * `application_security_group_ids` - (Optional) A list of Application Security Group IDs which should be associated with this Node Pool.
  * `node_public_ip_tags` - (Optional) Specifies a mapping of tags to the instance-level public IPs. Changing this forces a new resource to be created.

  -> **Note:** To set the application security group, you must allow at least one host port. Without this, the configuration will fail silently. [Learn More](https://learn.microsoft.com/en-us/azure/aks/use-node-public-ips#allow-host-port-connections-and-add-node-pools-to-application-security-groups).
  * `allowed_host_ports` - (Optional) One or more `allowed_host_ports` blocks as defined below.

An `allowed_host_ports` block supports the following:
  * `port_start` - (Optional) Specifies the start of the port range.
  * `port_end` - (Optional) Specifies the end of the port range.
  * `protocol` - (Optional) Specifies the protocol of the port range. Possible values are `TCP` and `UDP`.

A `upgrade_settings` block supports the following:
  * `drain_timeout_in_minutes` - (Optional) The amount of time in minutes to wait on eviction of pods and graceful termination per node. This eviction wait time honors waiting on pod disruption budgets. If this time is exceeded, the upgrade fails. Unsetting this after configuring it will force a new resource to be created.
  * `node_soak_duration_in_minutes` - (Optional) The amount of time in minutes to wait after draining a node and before reimaging and moving on to next node.
  * `max_surge` - (Required) The maximum number or percentage of nodes which will be added to the Node Pool size during an upgrade.

A `windows_profile` block supports the following:
  * `outbound_nat_enabled` - (Optional) Should the Windows nodes in this Node Pool have outbound NAT enabled? Defaults to `true`. Changing this forces a new resource to be created.

  -> **Note:** If a percentage is provided, the number of surge nodes is calculated from the current node count on the cluster. Node surge can allow a cluster to have more nodes than `max_count` during an upgrade. Ensure that your cluster has enough [IP space](https://docs.microsoft.com/azure/aks/upgrade-cluster#customize-node-surge-upgrade) during an upgrade.

The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/language/resources/syntax#operation-timeouts) for certain actions:
  * `create` - (Defaults to 1 hour) Used when creating the Kubernetes Cluster Node Pool.
  * `read` - (Defaults to 5 minutes) Used when retrieving the Kubernetes Cluster Node Pool.
  * `update` - (Defaults to 1 hour) Used when updating the Kubernetes Cluster Node Pool.
  * `delete` - (Defaults to 1 hour) Used when deleting the Kubernetes Cluster Node Pool.

Example Input:
```
node_pool = {
  example-node-pool = {
    name                          = "example-node-pool"
    vm_size                       = "Standard_DS2_v2"
    auto_scaling_enabled          = true
    host_encryption_enabled       = true
    node_public_ip_enabled        = false
    eviction_policy               = "Delete"
    host_group_id                 = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.Compute/hostGroups/myHostGroup"
    fips_enabled                  = false
    kubelet_disk_type             = "OS"
    max_pods                      = 30
    mode                          = "User"
    node_labels                   = { "environment" = "production" }
    node_public_ip_prefix_id      = null
    orchestrator_version          = "1.22.6"
    os_disk_size_gb               = 30
    os_disk_type                  = "Managed"
    pod_subnet_id                 = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.Network/virtualNetworks/myVnet/subnets/podSubnet"
    os_sku                        = "Ubuntu"
    os_type                       = "Linux"
    priority                      = "Regular"
    type                          = "VirtualMachineScaleSets"
    tags                          = { "cost_center" = "12345" }
    scale_down_mode               = "Delete"
    temporary_name_for_rotation   = "tmppool"
    ultra_ssd_enabled             = false
    vnet_subnet_id                = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.Network/virtualNetworks/myVnet/subnets/nodeSubnet"
    workload_runtime              = null
    zones                         = ["1", "2"]
    max_count                     = 5
    min_count                     = 1
    node_count                    = 3
    kubelet_config = {
      allowed_unsafe_sysctls    = ["net.core.somaxconn"]
      container_log_max_line    = 10000
      container_log_max_size_mb = 100
      cpu_cfs_quota_enabled     = true
      cpu_cfs_quota_period      = "100ms"
      cpu_manager_policy        = "static"
      image_gc_high_threshold   = 85
      image_gc_low_threshold    = 50
      pod_max_pid               = 1000000
      topology_manager_policy   = "single-numa-node"
    }
    linux_os_config = {
      swap_file_size_mb             = 1024
      transparent_huge_page_defrag  = "always"
      transparent_huge_page_enabled = "madvise"
      sysctl_config = {
        fs_aio_max_nr                      = 1048576
        fs_file_max                        = 2097152
        fs_inotify_max_user_watches        = 524288
        fs_nr_open                         = 1048576
        kernel_threads_max                 = 500000
        net_core_netdev_max_backlog        = 10000
        net_core_optmem_max                = 1048576
        net_core_rmem_default              = 262144
        net_core_rmem_max                  = 1048576
        net_core_somaxconn                 = 1024
        net_core_wmem_default              = 262144
        net_core_wmem_max                  = 1048576
        net_ipv4_ip_local_port_range_max   = 65535
        net_ipv4_ip_local_port_range_min   = 1024
        net_ipv4_neigh_default_gc_thresh1  = 128
        net_ipv4_neigh_default_gc_thresh2  = 512
        net_ipv4_neigh_default_gc_thresh3  = 1024
        net_ipv4_tcp_fin_timeout           = 30
        net_ipv4_tcp_keepalive_intvl       = 10
        net_ipv4_tcp_keepalive_probes      = 5
        net_ipv4_tcp_keepalive_time        = 1200
        net_ipv4_tcp_max_syn_backlog       = 2048
        net_ipv4_tcp_max_tw_buckets        = 5000
        net_ipv4_tcp_tw_reuse              = true
        net_netfilter_nf_conntrack_buckets = 65536
        net_netfilter_nf_conntrack_max     = 131072
        vm_max_map_count                   = 262144
        vm_swappiness                      = 60
        vm_vfs_cache_pressure              = 50
      }
    }
    node_network_profile = {
      application_security_group_ids = ["/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.Network/applicationSecurityGroups/myASG"]
      node_public_ip_tags            = { "environment" = "production" }
      allowed_host_ports = [
        {
          port_start = 80
          port_end   = 80
          protocol   = "TCP"
        },
        {
          port_start = 443
          port_end   = 443
          protocol   = "TCP"
        }
      ]
    }
    upgrade_settings = {
      drain_timeout_in_minutes      = 15
      node_soak_duration_in_minutes = 30
      max_surge                     = "33%"
    }
    windows_profile = {
      outbound_nat_enabled = true
    }
  }
}
```
DESCRIPTION
}