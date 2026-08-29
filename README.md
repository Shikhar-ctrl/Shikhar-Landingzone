# 🚀 Azure Landing Zone with Terraform

A modular and reusable **Azure Landing Zone** implementation using **Terraform Infrastructure as Code (IaC)**. This project provisions core Azure infrastructure components using reusable Terraform modules with controlled resource dependencies.

## 🏗️ Architecture

```text
                    Azure Landing Zone
                           │
                    ┌──────┴──────┐
                    │ Resource    │
                    │   Group     │
                    └──────┬──────┘
                           │
                           ↓
                    ┌──────────────┐
                    │ Virtual      │
                    │ Network      │
                    └──────┬───────┘
                           │
                           ↓
                    ┌──────────────┐
                    │   Subnet     │
                    └──────┬───────┘
                           │
                           ↓
                    ┌──────────────┐
                    │ Public IP    │
                    └──────┬───────┘
                           │
                           ↓
                    ┌──────────────┐
                    │ Virtual      │
                    │   Machine    │
                    └──────────────┘
```

## 📁 Project Structure

```text
Shikhar-Landingzone/
│
├── Child_folder/
│   │
│   ├── azurerm_public_ip/
│   ├── azurerm_resource_group/
│   ├── azurerm_subnet/
│   ├── azurerm_virtual_machine/
│   ├── azurerm_virtual_network/
│   └── ...
│
├── parent_folder/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── gitleakes.toml
│   ├── .terraform.lock.hcl
│   └── ...
│
├── .gitignore
├── LICENSE
└── README.md
```

## ✨ Key Features

* **Infrastructure as Code** using Terraform
* **Reusable Terraform modules** for Azure resources
* Modular separation between parent configuration and child modules
* Controlled resource provisioning using Terraform dependencies
* Azure Resource Group provisioning
* Azure Virtual Network and Subnet deployment
* Public IP provisioning
* Azure Virtual Machine deployment
* Variable-driven infrastructure configuration
* Terraform state management
* Scalable structure for adding additional Azure services
* Secret Scanning

## 🔗 Terraform Module Dependency Flow

The infrastructure is provisioned in a controlled sequence:

```text
                    Azure
                      │
              ┌───────┴───────┐
              │ Resource Group │
              └───────┬───────┘
                      │
              ┌───────▼───────┐
              │ Virtual Network│
              └───────┬───────┘
                      │
             ┌────────┴────────┐
             │                 │
       Frontend Subnet    Backend Subnet
             │                 │
           NIC/VM             NIC/VM
             │
         Public IP
```

Explicit dependencies are defined where required using Terraform's `depends_on` mechanism, while resource references can also create implicit dependencies.

For example:

```hcl
module "virtual_network" {
  depends_on = [module.resource_group]

  source = "../Child_folder/azurerm_virtual_network"
  vnet   = var.vnet
}
```

## 🧩 Modules

| Module                    | Purpose                           |
| ------------------------- | --------------------------------- |
| `azurerm_resource_group`  | Creates Azure Resource Groups     |
| `azurerm_virtual_network` | Creates Azure Virtual Network     |
| `azurerm_subnet`          | Creates Subnets inside the VNet   |
| `azurerm_public_ip`       | Creates Public IP resources       |
| `azurerm_virtual_machine` | Provisions Azure Virtual Machines |

The modular design makes the infrastructure easier to **maintain, reuse, scale, and troubleshoot**.

## 🛠️ Technologies Used

* **Microsoft Azure**
* **Terraform**
* **Azure Resource Manager**
* **Infrastructure as Code (IaC)**
* **Git & GitHub**

## 📋 Prerequisites

Before deploying the infrastructure, make sure the following are installed and configured:

* Azure subscription
* Azure CLI
* Terraform
* Git
* GitHub account
* Appropriate Azure permissions

Verify Terraform installation:

```bash
terraform version
```

Verify Azure CLI:

```bash
az version
```

Authenticate with Azure:

```bash
az login
```

Select the required subscription:

```bash
az account set --subscription "<SUBSCRIPTION_ID>"
```

## 🚀 Deployment

### 1. Clone the repository

```bash
git clone https://github.com/Shikhar-ctrl/Shikhar-Landingzone.git
```

Move into the Terraform directory:

```bash
cd Shikhar-Landingzone/parent_folder
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Format the Terraform configuration

```bash
terraform fmt -recursive
```

### 4. Validate the configuration

```bash
terraform validate
```

### 5. Review the execution plan

```bash
terraform plan
```

### 6. Deploy the infrastructure

```bash
terraform apply
```

Review the proposed changes and confirm with:

```text
yes
```

## 🧹 Destroy Infrastructure

To remove the infrastructure created by Terraform:

```bash
terraform destroy
```

> ⚠️ Use `terraform destroy` carefully, especially when working with shared or production Azure environments.

## 🔐 Terraform State

Terraform state is critical for tracking the resources managed by Terraform.

For a team or production environment, the recommended approach is to use an **Azure Storage Account as a remote Terraform backend** instead of maintaining the state file locally.

Recommended architecture:

```text
GitHub
   │
   ↓
GitHub Actions
   │
   ↓
Terraform
   │
   ↓
Azure Storage Account
   │
   └── Terraform State
```

Sensitive Terraform state files should **never be committed to GitHub**.

The repository therefore ignores:

```text
.terraform/
*.tfstate
*.tfstate.*
*.tfplan
```

## 🔒 Security Best Practices

* Do not commit Azure credentials or secrets.
* Do not commit Terraform state files.
* Use Azure Key Vault for sensitive application secrets where appropriate.
* Use GitHub Actions OIDC for secure Azure authentication.
* Use remote state for collaborative environments.
* Apply least-privilege permissions to Azure identities.
* Review `terraform plan` before applying infrastructure changes.
## 🔐 Secret Scanning

This project uses Gitleaks to detect hardcoded passwords,
API keys, tokens, and other sensitive credentials before
they are committed to the repository.

Run locally:

gitleaks dir . --config .gitleaks.toml

## 🔄 Future CI/CD Automation

This project can be integrated with **GitHub Actions** to automate Terraform operations.

Recommended workflow:

```text
Git Push / Pull Request
          ↓
Terraform Format
          ↓
Terraform Validate
          ↓
Terraform Plan
          ↓
Manual Approval
          ↓
Terraform Apply
          ↓
Azure Landing Zone
```

This allows infrastructure changes to be validated and reviewed before being applied to Azure.

## 📈 Future Enhancements

The Landing Zone can be extended with additional Azure components such as:

* Network Security Groups
* Azure Bastion
* Azure Key Vault
* Azure Storage
* Azure Monitor
* Log Analytics Workspace
* Azure Firewall
* Route Tables
* Private Endpoints
* Azure Policy
* Role-Based Access Control (RBAC)

The modular architecture makes it possible to add these services without significantly changing the existing structure.

## 🎯 Project Objective

The objective of this project is to build a **modular, reusable, and scalable Azure Landing Zone using Terraform**, while following Infrastructure as Code principles and maintaining a clean separation between resource modules and environment configuration.

---

### 👨‍💻 Author

**Shikhar Tiwari**

GitHub: [Shikhar-ctrl](https://github.com/Shikhar-ctrl)

---

⭐ If you find this project useful, consider giving the repository a star!
