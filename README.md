# 🛡️ Enterprise IAM Lab

Hands-on **enterprise Identity and Access Management (IAM) lab** covering Microsoft Entra ID, Okta, Active Directory, automation, and federation protocols.

This lab demonstrates how enterprises:

- ✅ Manage identities and provision users
- ✅ Secure access with MFA and Conditional Access
- ✅ Automate lifecycle and deprovisioning workflows
- ✅ Integrate cloud and on-prem apps via federation

---

## 🗂️ Lab Modules

| Module | Description |
|--------|-------------|
| ☁️ [Microsoft Entra ID](./entra/) | Cloud and hybrid identity provisioning, group-based licensing, Conditional Access (MFA, device compliance), PowerShell automation |
| 🔐 [Okta](./okta/) | SAML/OIDC app integrations, MFA policies, JIT provisioning, lifecycle automation with Okta Workflows |
| 🧱 [Active Directory (On-Prem)](./activedirectory/) | OU structure, GPOs, delegated access, user/group management with PowerShell|
| 🔄 [Federation Protocols](./federation-protocols/) | SAML, SCIM, OAuth, and OIDC authentication flows |
| 🛡️ [Secure Access Controls](./secure-access/) | MFA policies, RBAC, Conditional Access enforcement |
| ⚙️ [Automation](./automation/) | IAM scripting with PowerShell and Okta Workflows. |
| 📌 [Real-World Tasks](./real-world-tasks.md) | Enterprise tasks mirrored in this lab. |

---

## 🖥️ Lab Environment

| Component     | Detail                            |
|---------------|-----------------------------------|
| VMs           | Windows Server 2019, Windows 10   |
| Cloud Tenants | Microsoft 365 Developer Tenant, Okta Dev Edition |
| Domain        | IDSentinelSolutions.com (verified) |
| Tools         | PowerShell, GPMC, Postman, Okta Workflows |

---

## 🔧 Tools Used

- Microsoft Entra ID (Azure AD)
- Okta Identity Cloud
- Active Directory Domain Services (AD DS)
- Microsoft Entra Admin Center
- Azure AD Connect
- PowerShell
- Group Policy Management Console (GPMC)
- Okta Workflows
- Postman

---

## 🌐 Related Lab

| Lab | Focus |
|-----|-------|
| 🔒 [Microsoft 365 Security Lab](../entra/README.md) | Security controls, policies, and monitoring in Microsoft 365. |

---

## 💡 Next Steps

Explore each module to gain **end-to-end IAM engineering skills,** from AD delegation to Okta integrations and Entra Conditional Access. Completing these labs prepares you to secure and automate enterprise identity environments like a pro.
