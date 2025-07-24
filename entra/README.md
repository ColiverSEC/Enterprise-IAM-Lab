# 🔐 Microsoft Entra ID Lab

[⬅️ Back to Enterprise IAM Lab Overview](../README.md)

This module simulates cloud identity provisioning and access management using Microsoft Entra ID (formerly Azure AD). It includes hands-on demonstrations of cloud-only user creation, hybrid sync from on-prem Active Directory, group-based license assignment, and Conditional Access policies.

---

## 📚 What This Covers

- User provisioning (manual, CSV, PowerShell)
- Entra ID Connect hybrid sync from AD DS
- Group-based license assignment
- Conditional Access enforcement (MFA, device-based policies)

---

## 📁 Lab Sections

- [`user-provisioning.md`](./user-provisioning.md)  
  ➤ Create users manually, in bulk via CSV, or with PowerShell  
  ➤ Sync identities from Active Directory via Entra Connect  
  ➤ Automate license assignment via security groups

- [`conditional_access.md`](./conditional-access.md)  
  ➤ Configure policies to enforce MFA, block legacy auth, and require compliant devices

---

## 🗂 Folder Structure

| Folder | Contents |
|--------|----------|
| [`scripts`](./scripts) | PowerShell automation for Entra tasks |
| [`screenshots`](./screenshots) | Visuals for documentation (user creation, sync, licensing, CA policies) |

---

## 🛠 Tools Used

- Microsoft Entra Admin Center  
- PowerShell (`AzureAD` module)  
- Azure AD Connect  
- Microsoft 365 Admin Center

---

## 🔗 Related Labs

- [AD-Entra-Hybrid-Lab](https://github.com/ColiverSEC/AD-Entra-Hybrid-Lab) – Domain controller setup, AD user creation, hybrid sync with Entra

---
