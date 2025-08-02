# 🧱 Active Directory (On-Prem) Lab

[⬅️ Back to Enterprise IAM Lab Overview](../README.md)

This lab provides **hands-on experience** with managing and securing traditional **on-premises Active Directory environments**. It focuses on critical areas such as:

- ✅ Organizational design  
- ✅ Security hardening  
- ✅ User & group lifecycle management  
- ✅ Delegated administration  
- ✅ Automation with PowerShell  
- ✅ Backup and recovery procedures  

These walkthroughs simulate **real-world enterprise IAM** and **Windows infrastructure** tasks that are highly relevant for security and systems engineers.

---

## 📂 Lab Walkthroughs

| Walkthrough | Description |
|------------|-------------|
| 🔧 [AD Forest and Domain Architecture](./ad-forest-and-domain-architecture.md) | Overview of AD forests, domains, trusts, and key design considerations. |
| 🗂️ [OU and GPO Management](./ou-gpo-management.md) | Create and organize OUs and apply GPOs for centralized policy control. |
| 👥 [User and Group Management](./user-and-group-management.md) | Lifecycle tasks, group scope/type, and membership management. |
| 🛡️ [Delegation and Access Control](./delegation-and-access-control.md) | Delegate admin roles and securely manage permissions across OUs. |
| 🔒 [Active Directory Security Hardening](./active-directory-security-hardening.md) | Secure DCs, harden audit policy, and manage privileged accounts. |
| 💻 [PowerShell for AD Management](./powershell-for-ad-management.md) | Automate routine tasks with common AD cmdlets and scripts. |
| ♻️ [AD Backup and Recovery](./ad-backup-and-recovery.md) | Protect and restore AD using backup, tombstone, and recycle bin. |

---

## 🛠️ Tools Used

- **VirtualBox** (for running lab VMs)
- **Active Directory Users and Computers (ADUC)**
- **Group Policy Management Console (GPMC)**
- **PowerShell** with Active Directory module
- **Windows Server** (2016 / 2019 / 2022)


---

## 🌐 Related Labs

| Lab | Focus |
|-----|-------|
| 🔄 [AD-Entra-Hybrid-Lab](https://github.com/ColiverSEC/AD-Entra-Hybrid-Lab) | Sync and federate on-prem AD with Microsoft Entra ID. |
| ☁️ [Microsoft Entra ID Lab](https://github.com/ColiverSEC/Enterprise-IAM-Lab) | Cloud-based identity and access management (MFA, SAML, OIDC, automation). |

---

## 💡 Next Steps

Dive into each module to simulate common tasks and scenarios you’d face as a Windows or IAM engineer. These walkthroughs give you the confidence to **design, secure, and manage Active Directory like a pro**.
