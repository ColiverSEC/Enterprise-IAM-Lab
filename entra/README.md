# 🔐 Microsoft Entra ID Lab

[⬅️ Back to Enterprise IAM Lab Overview](../README.md)

This lab provides hands-on experience with Microsoft Entra ID (formerly Azure AD), a modern cloud-based identity and access management platform. It covers the full spectrum of enterprise IAM tasks, including identity management, authentication, application access, governance, and monitoring.

Key focus areas include:

✅ Tenant configuration, roles, and delegation

✅ User and group provisioning (manual, bulk, PowerShell, dynamic groups)

✅ External identities (B2B/B2C) and guest lifecycle management

✅ Hybrid identity with Azure AD Connect (PHS/PTA, SSO, password writeback, monitoring)

✅ Automate Entra ID and hybrid AD users, groups, roles, licenses, and sync declaratively using Infrastructure as Code

✅ Authentication methods, MFA, Windows Hello, and self-service password reset

✅ Conditional Access policies with device compliance and session management

✅ Identity Protection and risk-based policies (user & sign-in risk)

✅ Azure resource access and RBAC, managed identities, and Key Vault security

✅ Enterprise application integrations, app registrations, and SCIM provisioning

✅ Identity Governance (access packages, PIM, access reviews, emergency accounts)

✅ Monitoring, reporting, and integration with Microsoft Sentinel and Entra Workbooks

✅ Global Secure Access for Internet and Private Access, and network-level Conditional Access

These walkthroughs simulate real-world IAM engineering tasks, preparing you to design, implement, and manage a secure, scalable, and governed identity environment across cloud and hybrid infrastructures.

---

## 📂 Lab Walkthroughs

| Walkthrough                                                           | Description                                                                                                               |
| --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| 🏁 [Initial Tenant Configuration & Roles](./initial-tenant-config.md) | Configure custom domains, assign built-in & custom roles, delegate admins, and manage tenant-wide settings.               |
| 👤 [User & Group Provisioning](./user-and-group-provisioning.md)      | Create users and groups manually, via CSV, or PowerShell. Assign licenses and configure dynamic groups.                   |
| 🌐 [External Identities (B2B/B2C)](./external-identities.md)          | Invite external users, configure collaboration, social & SAML identity providers, and manage guest lifecycle.             |
| 🔗 [Hybrid Identity with Entra Connect](./hybrid-identity.md)         | Plan, install, and manage Entra Connect. Configure PHS/PTA, seamless SSO, password writeback, and monitoring.             |
|    [🛠️ Terraform – Infrastructure as Code](./hybrid-identity.md)      | Provision and manage Entra ID and hybrid identity resources declaratively. Automate users, groups, licenses, roles, and hybrid sync. |
| 🔑 [Authentication Methods & SSPR](./authentication-methods.md)       | Enable MFA, FIDO2, Windows Hello, self-service password reset, and tenant restrictions.                                   |
| 🛡️ [Conditional Access](./conditional-access.md)                     | Plan and implement security defaults and Conditional Access policies with MFA, device compliance, and session management. |
| ⚡ [Identity Protection](./identity-protection.md)                     | Configure user & sign-in risk policies, monitor risky users, and integrate Microsoft Defender for Identity.               |
| 📲 [Enterprise App Integrations & Registration](./enterprise-apps.md) | Configure gallery apps, custom apps, app proxy, token customization, SCIM provisioning, and monitoring.                   |
| 🎛️ [Identity Governance](./identity-governance.md)                   | Implement access packages, terms of use, access reviews, PIM, and emergency access accounts.                              |
| 📊 [Monitoring & Reporting](./monitoring-reporting.md)                | Review sign-in and audit logs, diagnostic logs, and use workbooks/Sentinel dashboards.                                    |
| 🌍 [Global Secure Access](./global-secure-access.md)                  | Configure Internet & Private Access, remote networks, and Conditional Access for network resources.                       |


---

## 🛠️ Tools Used

- **Microsoft Entra Admin Center**
- **Microsoft 365 Admin Center**
- **PowerShell** (AzureAD & MSOnline modules)
- **Azure AD Connect**
- **On-Prem Windows Server** (via Hyper-V or VirtualBox)

---

## 🌐 Related Labs

| Lab | Focus |
|-----|-------|
| 🧱 [Active Directory (On-Prem)](https://github.com/ColiverSEC/Enterprise-IAM-Lab/blob/main/activedirectory/README.md) | OU design, GPOs, security hardening, delegated access, PowerShell automation. |
| 🔄 [AD-Entra-Hybrid_Lab](../entra/README.md) | Sync and federate on-prem AD with Microsoft Entra ID. |
| 🔑 [Okta IAM Lab](https://github.com/ColiverSEC/Enterprise-IAM-Lab/tree/main/okta) | App integrations, MFA policies, lifecycle automation. |

---

## 💡 Next Steps

Dive into each walkthrough to simulate real enterprise identity operations, from provisioning to security enforcement. These exercises give you confidence to design and manage Entra ID in hybrid and cloud environments.
