# ✅ Setup Checklist

- ✅ Azure Subscription with Owner or Contributor access
- ✅ GitHub Account with repository access
- ✅ Entra ID (Azure AD) App Registration for OIDC
- ✅ Azure Storage Account and Container for Terraform state
- ✅ Required tooling installed (Terraform CLI, Azure CLI, Git, VS Code optional)
- ✅ GitHub repository secrets configured (`AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`)
- ✅ Azure role assignments for the App Registration
- ✅ Repository cloned and Terraform initialized

---

# 🔒 Permissions Required

- ✅ **Azure Subscription:** Owner or Contributor role to create resources and assign roles
- ✅ **Resource Group:** Contributor role for resource creation and management
- ✅ **Storage Account:** Contributor or Storage Blob Data Contributor for state file access
- ✅ **Entra ID (Azure AD):** Application Administrator or higher to register applications and manage federated credentials
- ✅ **GitHub Repository:** Admin or Maintainer to configure repository secrets and workflows
- ✅ **App Registration:** Permission to assign roles at the subscription/resource group level (User Access Administrator or Owner)

---

# 🚀 Setup Instructions for Cummins Terraform Lab

This guide will help you set up your environment to use Terraform and GitHub Actions for managing Azure resources in this repository.

---

## 📋 Prerequisites

- **Azure Subscription** with Owner or Contributor access
- **GitHub Account** with access to the repository
- **Entra ID (Azure AD) Admin** access to register applications
- **Local Machine Requirements:**
  - [Terraform CLI](https://www.terraform.io/downloads.html) (v1.8.5 or later)
  - [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) (latest)
  - [Git](https://git-scm.com/downloads)
  - Optional: [Visual Studio Code](https://code.visualstudio.com/) with Terraform extension

---

## ☁️ Azure Storage Account for Remote State

Terraform uses a remote backend to store state files securely.

1. **Create a Resource Group** (if not already created):

   ```sh
   az group create --name <resource-group-name> --location <azure-region>
   ```

2. **Create a Storage Account**:

   ```sh
   az storage account create \
     --name <storage-account-name> \
     --resource-group <resource-group-name> \
     --location <azure-region> \
     --sku Standard_LRS \
     --kind StorageV2
   ```

3. **Create a Storage Container** for state files:

   ```sh
   az storage container create \
     --name tfstate \
     --account-name <storage-account-name>
   ```

**Permissions Required:**
- ✅ Contributor on the resource group for creating storage accounts and containers

---

## 🔐 Entra ID (Azure AD) Configuration

### 1. Register a New App Registration for GitHub OIDC

- Go to **Azure Portal > Microsoft Entra ID > App registrations > New registration**
- Name: `github-actions-terraform`
- Supported account types: Single tenant (default)
- Redirect URI: *Leave blank*

**Permissions Required:**
- ✅ Application Administrator or higher in Entra ID

### 2. Configure Federated Credentials

- In the App Registration, go to **Certificates & secrets > Federated credentials**
- Click **Add credential**
- Select **GitHub Actions** as the provider
- Fill in:
  - Organization: your GitHub org
  - Repository: your GitHub repo
  - Branch: `main`, `test`, or `prod` (add one for each branch you want to deploy from)
- Save the federated credential

**Permissions Required:**
- ✅ Application Administrator or higher in Entra ID

### 3. Assign Azure Roles

- Go to **Subscriptions > [Your Subscription] > Access control (IAM) > Add > Add role assignment**
- Assign **Contributor** (or more restrictive as needed) to the App Registration's managed identity

**Permissions Required:**
- ✅ Owner or User Access Administrator on the subscription or resource group

---

## 🔑 GitHub Repository Secrets

In your GitHub repository, go to **Settings > Secrets and variables > Actions > New repository secret** and add:

- `AZURE_CLIENT_ID` — The Application (client) ID of your App Registration
- `AZURE_TENANT_ID` — The Directory (tenant) ID
- `AZURE_SUBSCRIPTION_ID` — Your Azure Subscription ID

**Permissions Required:**
- ✅ Admin or Maintainer on the GitHub repository

---

## 🛠️ Tooling Setup

### 1. Install Terraform

- [Download Terraform](https://www.terraform.io/downloads.html) and add it to your PATH.

### 2. Install Azure CLI

- [Download Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) and add it to your PATH.

### 3. (Optional) Install VS Code & Extensions

- [Download VS Code](https://code.visualstudio.com/)
- Install the **HashiCorp Terraform** extension for syntax highlighting and linting.

---

## 🚦 First-Time Initialization

1. **Clone the repository:**

   ```sh
   git clone https://github.com/<your-org>/<your-repo>.git
   cd <your-repo>
   ```

2. **Initialize Terraform in your environment directory:**

   ```sh
   cd terraform/environments/test
   terraform init -backend-config=backend.tfvars
   ```

3. **Validate the configuration:**

   ```sh
   terraform validate
   ```

4. **Plan and apply (if running locally):**

   ```sh
   terraform plan -var-file=test.auto.tfvars
   terraform apply -var-file=test.auto.tfvars
   ```

> **Note:** In CI/CD, GitHub Actions will handle these steps automatically on push.

**Permissions Required:**
- ✅ Contributor on the Azure resource group and storage account for resource creation and state management

---

## 📝 Additional Notes

- The resource group referenced in the environment configs must exist before running Terraform.
- Tagging requirements are enforced by variable validation.
- For production, repeat the setup steps in the `prod` environment directory.

---

## 📚 References

- [Terraform Azure Provider Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [GitHub Actions OIDC with Azure](https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure?tabs=azure-cli%2Clinux)
- [Azure CLI Docs](https://docs.microsoft.com/en-us/cli/azure/)

---