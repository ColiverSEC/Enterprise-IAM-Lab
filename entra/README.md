# 🔐 Microsoft Entra ID Lab

[⬅️ Back to Enterprise IAM Lab Overview](../README.md)

This module simulates cloud identity provisioning and access management using Microsoft Entra ID (formerly Azure AD). It includes hands-on demonstrations of cloud-only user creation, hybrid sync from on-prem Active Directory, group-based license assignment, and Conditional Access policies.

---

## 📚 What This Covers

- Cloud-only user creation (manual, CSV, PowerShell)  
- Hybrid identity provisioning from on-prem AD via Entra ID Connect  
- Group-based license assignment  
- Conditional Access enforcement (MFA, device-based policies)

---

## 📁 Lab Sections

- [`user-provisioning.md`](./user-provisioning.md)  
  ➤ Create users manually, in bulk via CSV, or with PowerShell  
  ➤ Sync identities from Active Directory via Entra Connect  
  ➤ Automate license assignment via security groups

- [`hybrid-identity.md`](./hybrid-identity.md)  
  ➤ Install and configure Azure AD Connect  
  ➤ Configure OU and attribute filtering  
  ➤ Verify sync and troubleshoot  
  ➤ Sync users with password hash sync 

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

> 🔧 Admin Portals  
> - Microsoft Entra Admin Center  
> - Microsoft 365 Admin Center
>
> 💻 Command-line & Scripting 
> - PowerShell (AzureAD & MSOnline modules)
>  
> 🖥️ Infrastructure
> - Azure AD Connect  
> - On-Prem Windows Server (via Hyper-V or VirtualBox)

---

## 🔗 Related Labs

🏛️ Note: This lab assumes the on-prem AD forest and OU structure covered in the Active Directory module. [active directory](https://github.com/ColiverSEC/Enterprise-IAM-Lab/tree/main/activedirectory) 

---
