
# 🌐 Real-World Tasks Lab

[⬅️ Back to Enterprise IAM Lab Overview](../README.md)

This module provides **hands-on, scenario-based exercises** that simulate real enterprise IAM challenges.  
It combines concepts and tools from the Active Directory, Microsoft Entra ID, Okta, Secure Access Controls, Federation Protocols, and Automation modules into **practical workflows**.

Key focus areas include:  

- ✅ End-to-end user onboarding, role changes, and offboarding  
- ✅ Privileged access management (PIM/PAM) and RBAC enforcement  
- ✅ Cross-platform SSO and MFA troubleshooting  
- ✅ Conditional Access and policy validation  
- ✅ Compliance reporting and access attestation  
- ✅ Automation-driven lifecycle tasks  

---

## 📂 Lab Walkthroughs

| Walkthrough | Description |
|-------------|-------------|
| 🧑‍💼 [New Employee Onboarding](./onboarding.md) | Provision accounts in AD, Entra, and Okta; apply MFA, conditional access, and group memberships; notify managers via automation workflows. |
| 🔄 [Employee Role Change / Department Transfer](./role-change.md) | Update RBAC roles and group memberships; trigger JIT access; remove unneeded entitlements and adjust MFA policies. |
| 🛑 [Offboarding / Leaver Scenario](./offboarding.md) | Disable AD account, revoke Entra licenses, and deprovision Okta access; trigger compliance notifications; remove privileged roles. |
| 🛡️ [Privileged Access Audit & Attestation](./privileged-access-audit.md) | Generate reports on privileged accounts; perform access reviews; remediate over-privileged or inactive accounts. |
| 🌐 [SSO & Federation Troubleshooting](./sso-troubleshoot.md) | Simulate failed SAML or OIDC logins; troubleshoot federation, group assignment, and conditional access issues; resolve and document. |
| 📊 [Automation-Driven Reporting](./automation-reporting.md) | Build scripts and workflows to report inactive accounts, MFA status, license usage, and access reviews; automate notifications. |
| ☁️ [Hybrid Environment Scenario](./hybrid-scenario.md) | Ensure consistent access, SSO, and MFA across on-prem AD and Entra ID; validate group memberships, licensing, and conditional access policies. |

---

## 🛠️ Tools Used

- **Active Directory** (ADUC, GPMC, PowerShell)  
- **Microsoft Entra ID** (Admin Center, PowerShell, Graph API)  
- **Okta Identity Cloud** (Admin Console, Workflows)  
- **Conditional Access / MFA Policies**  
- **PIM / PAM Tools** for privileged access management  
- **PowerShell & Task Scheduler / CRON** for automation and reporting  

---

## 🌐 Related Labs

| Lab | Focus |
|-----|-------|
| 🧱 [Active Directory Lab](../active-directory/README.md) | On-premises user and group management, RBAC, AD security. |
| ☁️ [Microsoft Entra ID Lab](../entra/README.md) | Cloud identity, licensing, MFA, and Conditional Access. |
| 🔐 [Okta Lab](../okta/README.md) | App integration, MFA enforcement, lifecycle automation. |
| 🛡️ [Secure Access Controls Lab](../secure-access/README.md) | PIM/PAM, RBAC, and access governance across systems. |
| 🤖 [Automation Lab](../automation/README.md) | Cross-platform scripts and workflows for lifecycle automation. |

---

## 💡 Next Steps

Use these walkthroughs to **simulate real enterprise IAM workflows**:  

- Execute full joiner/mover/leaver cycles  
- Test privileged access controls and RBAC policies  
- Troubleshoot SSO and MFA issues across cloud and on-prem systems  
- Automate reporting and notifications for compliance  
- Apply lessons from all modules in an integrated, real-world environment  

Mastering this module prepares you to **operate as a complete IAM engineer**, capable of managing identity, access, and automation at scale.
