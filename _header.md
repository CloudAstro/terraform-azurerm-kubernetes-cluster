# Azure Kubernetes Cluster Terraform Module

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/cloudastro/kubernetes-cluster/azurerm/)

This Terraform module provisions and manages Azure Kubernetes Clusters (AKS) in Azure. It supports the creation of Kubernetes clusters with custom configurations, managing node pools, and extending clusters with additional functionalities.

## Features

- **Kubernetes Cluster Creation**: Deploy a fully managed Kubernetes cluster with custom settings such as node size, number, and location.
- **Node Pool Management**: Define and manage multiple node pools with custom configurations for workloads.
- **Cluster Extensions**: Extend the functionality of the Kubernetes cluster using extensions like monitoring or Azure Active Directory integration.
- **Custom Role Bindings**: Assign specific roles to users or services using trusted access role bindings for enhanced security and permissions control.
- **Scalable Infrastructure**: Manage scalable infrastructure by adjusting node pool settings based on demand.

## Example Usage

This example demonstrates how to deploy an Azure Kubernetes Cluster (AKS), manage node pools, and configure extensions for your Kubernetes environment.
