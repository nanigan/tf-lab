# Terraform Azure Deployment with GitHub Actions

## 📌 Project Overview
This project demonstrates how to deploy Azure infrastructure using Terraform and GitHub Actions. It uses OpenID Connect (OIDC) for secure, secretless authentication with Azure and supports environment-specific configurations using `.tfvars` files.

---

## ✅ Prerequisites
- **Terraform** v1.6.6 or later
- **Azure Subscription**
- **GitHub Repository** with GitHub Actions enabled
- **Federated Identity Credential** configured in Azure AD for GitHub OIDC

---

## ⚙️ Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/your-org/your-repo.git
cd your-repo
