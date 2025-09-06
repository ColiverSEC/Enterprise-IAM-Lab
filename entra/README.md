# 🔐 Microsoft Entra ID Lab

[⬅️ Back to Enterprise IAM Lab Overview](../README.md)

This lab provides hands-on experience with Microsoft Entra ID (formerly Azure AD), a modern cloud-based identity and access management platform. It focuses on key areas such as:

- ✅ Cloud-only and hybrid identity provisioning
- ✅ Group-based licensing automation
- ✅ Conditional Access policies and MFA enforcement
- ✅ Integration with on-prem Active Directory via Entra Connect
- ✅ PowerShell automation for identity management

These walkthroughs simulate **real-world IAM engineering tasks** that security, identity, and cloud engineers perform daily.

---
## 📂 Lab Walkthroughs

| Walkthrough | Description |
|------------|-------------|
| 👤 [User Provisioning](././user-provisioning.md) | Create users manually, in bulk (CSV), or via PowerShell. Sync from on-prem AD and automate license assignment. |
| 🔗 [Hybrid Identity](./hybrid-identity.md) | Install and configure Azure AD Connect, filter OUs/attributes, and verify sync with password hash sync. |
| 🛡️ [Conditional Access](./conditional-access.md) | Enforce MFA, block legacy authentication, and apply device-compliance policies. |

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
