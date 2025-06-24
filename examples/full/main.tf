resource "azurerm_resource_group" "vnetrg" {
  name     = "rg-vnet-example"
  location = "germanywestcentral"
}

resource "azurerm_resource_group" "aks_rg" {
  name     = "rg-aks-test"
  location = "germanywestcentral"
}

module "vnet-test" {
  source = "CloudAstro/virtual-network/azurerm"

  name                = "vnet-aks-test"
  location            = azurerm_resource_group.vnetrg.location
  resource_group_name = azurerm_resource_group.vnetrg.name
  address_space       = ["10.10.0.0/24", "10.11.0.0/16"]
}

module "snet-nodes" {
  source = "CloudAstro/subnet/azurerm"

  name                 = "snet-nodes-test"
  resource_group_name  = azurerm_resource_group.vnetrg.name
  virtual_network_name = module.vnet-test.virtual_network.name
  address_prefixes     = ["10.10.0.0/24"]
}

module "snet-pods" {
  source = "CloudAstro/subnet/azurerm"

  name                 = "snet-pods-test"
  resource_group_name  = azurerm_resource_group.vnetrg.name
  virtual_network_name = module.vnet-test.virtual_network.name
  address_prefixes     = ["10.11.0.0/23"]
}

resource "azurerm_user_assigned_identity" "aks_identity" {
  name                = "aks-identity"
  location            = azurerm_resource_group.vnetrg.location
  resource_group_name = azurerm_resource_group.vnetrg.name
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "time_static" "current" {
}

module "aks-full" {
  source = "../../"

  name                                = "aks-test"
  location                            = azurerm_resource_group.aks_rg.location
  resource_group_name                 = azurerm_resource_group.aks_rg.name
  automatic_upgrade_channel           = "node-image"
  dns_prefix                          = "akstest"
  azure_policy_enabled                = true
  cost_analysis_enabled               = false
  image_cleaner_enabled               = true
  image_cleaner_interval_hours        = "24"
  kubernetes_version                  = "1.31.1"
  local_account_disabled              = false
  node_os_upgrade_channel             = "NodeImage"
  node_resource_group                 = "rg-nodes-aks-test"
  oidc_issuer_enabled                 = false
  private_cluster_enabled             = false
  private_cluster_public_fqdn_enabled = false
  workload_identity_enabled           = false
  role_based_access_control_enabled   = true
  run_command_enabled                 = true
  sku_tier                            = "Free"
  support_plan                        = "KubernetesOfficial"

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

  api_server_access_profile = {
    authorized_ip_ranges = ["10.20.0.20/32"]
  }

  auto_scaler_profile = {
    balance_similar_node_groups                   = false
    daemonset_eviction_for_empty_nodes_enabled    = false
    daemonset_eviction_for_occupied_nodes_enabled = true
    expander                                      = "random"
    ignore_daemonsets_utilization_enabled         = false
    max_graceful_termination_sec                  = "600"
    max_node_provision_time                       = "15m"
    max_unready_nodes                             = 3
    max_unready_percentage                        = 45
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

  identity = {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks_identity.id]
  }

  linux_profile = {
    admin_username = "azureuser"
    ssh_key = {
      key_data = tls_private_key.ssh_key.public_key_openssh
    }
  }

  network_profile = {
    network_plugin     = "azure"
    network_policy     = "calico"
    network_data_plane = "azure"
    outbound_type      = "loadBalancer"
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

  storage_profile = {
    blob_driver_enabled         = false
    disk_driver_enabled         = true
    file_driver_enabled         = true
    snapshot_controller_enabled = true
  }

  upgrade_override = {
    force_upgrade_enabled = true
    effective_until       = timeadd(time_static.current.rfc3339, "720h")
  }
}
