# Active Directory (On-Prem) Lab

This lab focuses on hands-on management and security of traditional on-premises Active Directory environments. It covers organizational design, user and group management, delegation, security best practices, automation with PowerShell, and recovery procedures.

These walkthroughs are designed to give practical experience with core AD administration tasks critical for enterprise IAM and Windows infrastructure roles.

---

## Lab Walkthroughs

| File | Description |
|-------|-------------|
| [AD Forest and Domain Architecture](./ad-forest-and-domain-architecture.md) | Overview of AD forests, domains, trusts, and their design considerations. |
| [OU and GPO Management](./ou-gpo-management.md) | Creating and organizing Organizational Units and Group Policy Objects (GPOs) for centralized policy management. |
| [User and Group Management](./user-and-group-management.md) | User account lifecycle management, group types/scopes, and best practices for group membership. |
| [Delegation and Access Control](./delegation-and-access-control.md) | How to delegate administrative permissions securely and manage access control within OUs. |
| [Active Directory Security Hardening](./active-directory-security-hardening.md) | Best practices for securing domain controllers, audit policies, and service account management. |
| [Powershell for AD Managment](./powershell-for-ad-management.md) | PowerShell scripts and cmdlets for automating user, group, and policy management in AD. |
| [AD Backup and Recovery](./ad-backup-and-recovery.md) | Procedures for backing up AD, recovering deleted objects using tombstone and recycle bin, and disaster recovery basics. |


---

## Tools Used

- Active Directory Users and Computers (ADUC) MMC Snap-in  
- Group Policy Management Console (GPMC)  
- PowerShell with Active Directory module  
- Windows Server environment (2016/2019/2022)  

---

## Related Labs

- [AD-Entra-Hybrid-Lab](https://github.com/ColiverSEC/AD-Entra-Hybrid-Lab) — Focused on hybrid identity syncing on-prem AD with Microsoft Entra ID.  
- [Microsoft Entra ID Lab](../entra/) — Cloud-based identity and access management.  

---

Feel free to explore each walkthrough for step-by-step guidance on managing and securing an on-prem Active Directory environment.

