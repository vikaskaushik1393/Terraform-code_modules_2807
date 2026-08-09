# Azure Infrastructure with Terraform (Modular Architecture)

This repository contains modularized **Terraform** configuration files designed to provision multi-environment Azure infrastructure using reusable custom modules.

---

## 📁 Repository Structure

```text
.
├── Environment/
│   ├── Pre-Prod/              # Pre-Production Environment Configuration
│   │   ├── main.tf            # Module calls for Pre-Prod
│   │   ├── provider.tf        # Terraform & AzureRM provider configuration
│   │   ├── variable.tf        # Input variable definitions
│   │   └── terraform.tfvars   # Pre-Prod resource values
│   └── Prod/                  # Production Environment Configuration
│       ├── main.tf            # Module calls for Prod
│       ├── provider.tf        # Terraform & AzureRM provider configuration
│       ├── variable.tf        # Input variable definitions
│       └── terraform.tfvars   # Prod resource values
└── modules/                   # Reusable Infrastructure Modules
    ├── azurerm_resource_group/# Resource Group module
    ├── azurerm_virtual_network/# Virtual Network module
    ├── azurerm_subnets/       # Subnet module
    ├── azurerm_public_ip/     # Public IP module
    └── azurerm_virtual_machine/# Network Interface & Virtual Machine module
```

---

## 🛠️ Modules Overview

Each module utilizes `for_each` loops to dynamically provision multiple resources defined in key-value maps:

| Module | Description | Source Path |
| :--- | :--- | :--- |
| **`azurerm_resource_group`** | Provisions Azure Resource Groups. | `../../modules/azurerm_resource_group` |
| **`azurerm_virtual_network`** | Creates Azure Virtual Networks (VNet). | `../../modules/azurerm_virtual_network` |
| **`azurerm_subnets`** | Configures subnets inside Virtual Networks. | `../../modules/azurerm_subnets` |
| **`azurerm_public_ip`** | Creates static/dynamic Public IP addresses. | `../../modules/azurerm_public_ip` |
| **`azurerm_virtual_machine`** | Creates Network Interfaces (NICs) & Linux VMs. | `../../modules/azurerm_virtual_machine` |

---

## 📋 Prerequisites

Before running the Terraform configurations, ensure you have:

1. **Terraform CLI**: `v1.0.0` or higher installed.
2. **Azure CLI**: Installed and logged into your Azure account.
   ```bash
   az login
   az account set --subscription "<YOUR_SUBSCRIPTION_ID>"
   ```
3. **Permissions**: Owner or Contributor access to the targeted Azure Subscription.

---

## 🚀 Deployment Instructions

To deploy infrastructure for a specific environment (e.g., **Pre-Prod** or **Prod**):

### 1. Navigate to the Environment Directory

- For **Pre-Production**:
  ```bash
  cd Environment/Pre-Prod
  ```
- For **Production**:
  ```bash
  cd Environment/Prod
  ```

### 2. Initialize Terraform

Initialize the working directory and install required providers:

```bash
terraform init
```

### 3. Review Implementation Plan

Generate and review an execution plan:

```bash
terraform plan
```

### 4. Apply Infrastructure Changes

Deploy the resources to Azure:

```bash
terraform apply
```

### 5. Destroy Infrastructure (Optional)

To tear down the deployed resources:

```bash
terraform destroy
```

---

## ⚙️ Configuration Customization

Resource parameters (Resource Group names, VNet CIDR blocks, Subnet ranges, VM sizes, Admin credentials) are managed in each environment's `terraform.tfvars` file:

- **Pre-Prod**: [Environment/Pre-Prod/terraform.tfvars](file:///c:/Users/Admin/Documents/Devops_learning/infra/terraform/Terraform-code_modules_2807/Environment/Pre-Prod/terraform.tfvars)
- **Prod**: [Environment/Prod/terraform.tfvars](file:///c:/Users/Admin/Documents/Devops_learning/infra/terraform/Terraform-code_modules_2807/Environment/Prod/terraform.tfvars)