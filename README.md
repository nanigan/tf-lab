[![Terraform Deployment](https://github.com/cummins-sandbox/wh701_tflab/actions/workflows/terraform.yml/badge.svg)](https://github.com/cummins-sandbox/wh701_tflab/actions/workflows/terraform.yml)

# Cummins Terraform Lab Repository

## 📦 Repository Details

### 🗂️ Repository Structure

```plaintext
terraform/
├── modules/                    # Reusable Terraform modules
│   ├── vnet/                   # Virtual Network module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── key-vault/              # Key Vault module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│
├── environments/               # Environment-specific configurations
│   ├── test/
│   │   ├── main.tf             # Module instantiations for test
│   │   ├── variables.tf        # Input variable declarations
│   │   ├── test.auto.tfvars    # Automatically loaded variable values
│   │   ├── backend.tf          # Remote state backend config
│   │   └── backend.tfvars      # Backend values for test
│   ├── prod/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── prod.auto.tfvars
│   │   ├── backend.tf
│   │   └── backend.tfvars
│
└── .github/
    └── workflows/
        └── terraform.yml      # GitHub Actions workflow for CI/CD
```

---

# 📁 File Details

## 📦 Modules

The `modules/` directory contains reusable Terraform modules that encapsulate specific Azure resources. Each module includes:

- `main.tf`: Defines the resources.
- `variables.tf`: Declares input variables.
- `outputs.tf`: Exposes outputs for use in other modules or environments.

---

## 🌍 Environments

The `environments/` directory contains configurations for different deployment environments. Each environment will contain the following files:

### 🗂️ `main.tf`
Primary entry point for defining your infrastructure using Terraform. It contains the core logic for provisioning Azure resources and orchestrating modules.

#### 🎯 Purpose
  - Defines Azure infrastructure resources (e.g., resource groups, networks, storage)
  - Configures the Terraform provider (e.g., `azurerm`)
  - References reusable modules for modular deployments
  - Establishes dependencies and relationships between resources

### 🗂️ `variables.tf`
Defines input variables used throughout your Terraform configuration. These variables allow you to parameterize your infrastructure code, making it reusable and environment-agnostic.

#### 🎯 Purpose
  - Define configurable values for your infrastructure (e.g., location, resource names)
  - Promote reusability and modularity
  - Enable environment-specific customization via `.tfvars` files
  - Improve readability and maintainability of your Terraform code

### 🗂️ `test.auto.tfvars` / `prod.auto.tfvars`
Terraform variable definition files that are automatically loaded by Terraform during execution. They contain values for the input variables defined in `variables.tf`, tailored for a specific environment (e.g., test, prod).

#### 🎯 Purpose
  - Provide environment-specific values for Terraform variables
  - Simplify command-line usage by eliminating the need for `-var-file` flags
  - Support automation in CI/CD pipelines and local development
  - Enable consistent and repeatable deployments across environments

### 🗂️ `backend.tf`
The `backend.tf` file configures the **Terraform backend**, which defines where and how Terraform stores its state file. In this project, we use the **Azure Storage Account backend** to securely manage and share the Terraform state across team members and CI/CD pipelines.

#### 🎯 Purpose

- Store the Terraform state file remotely in Azure
- Enable collaboration by locking state during operations
- Prevent state corruption and ensure consistency
- Support automation in CI/CD workflows

---

## ⚙️ GitHub Actions: `terraform.yml`

The `terraform.yml` file, located in `.github/workflows/`, defines a GitHub Actions workflow that automates Terraform operations such as `init`, `plan`, and `apply`. This enables continuous integration and deployment (CI/CD) for your infrastructure code.

#### 🎯 Purpose

- Automate Terraform commands on code changes
- Ensure consistent and repeatable deployments
- Enforce best practices like formatting and validation
- Enable collaboration through pull request previews

---

## ✅ Best Practices Followed

- 🧩 Modular and reusable code
- 🏞️ Environment isolation
- ☁️ Remote state management
- 🤖 CI/CD automation
- 📑 Clear separation of concerns

---

## 🚀 How to Use

1. **Clone the repository**
2. **Configure environment variables** in the appropriate `*.auto.tfvars` files.
3. **Push changes** to the relevant branch (`test`, `prod`, or `main`) to trigger the workflow.
4. **Review deployment status** in the Actions tab.

---

## 📋 Requirements

- [Terraform CLI](https://www.terraform.io/downloads.html) `>= 1.8.5`
- Azure Subscription and Service Principal (OIDC enabled)
- GitHub repository secrets:  
  - `AZURE_CLIENT_ID`
  - `AZURE_TENANT_ID`
  - `AZURE_SUBSCRIPTION_ID`

---

## ℹ️ Notes

- The resource group is expected to be pre-created and is referenced as a data source.
- Tag validation ensures compliance with required organizational tags.
- The workflow supports both manual and branch-based deployments.

---

## 📝 License

MIT License