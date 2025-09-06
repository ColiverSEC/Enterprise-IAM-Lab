# 🛡️ Secure Access Controls Lab

[⬅️ Back to Enterprise IAM Lab Overview](../README.md)

This lab provides **hands-on experience** with designing and enforcing secure access controls across enterprise identity platforms. It focuses on principles such as Multi-Factor Authentication (MFA), Role-Based Access Control (RBAC), Conditional Access, and Privileged Identity/Access Management (PIM/PAM).  

The goal is to simulate **real-world enterprise security controls** that apply consistently across **Microsoft Entra ID, Okta, and Active Directory** environments.

---

## 📂 Lab Walkthroughs

| Walkthrough | Description |
|-------------|-------------|
| 🔑 [Role-Based Access Control (RBAC)](./rbac.md) | Define roles, map job functions to entitlements, and enforce least privilege across platforms. |
| 🔒 [Multi-Factor Authentication (MFA) Enforcement](./mfa.md) | Compare MFA enforcement strategies across Entra, Okta, and on-prem AD; simulate step-up authentication. |
| 🌐 [Conditional Access Policies](./conditional-access.md) | Design cross-platform policies (Entra vs. Okta) for geo-blocking, device compliance, and session restrictions. |
| 🛡️ [Privileged Identity & Access Management (PIM/PAM)](./pim-pam.md) | Secure elevated accounts with just-in-time access, step-up MFA, and time-bound admin roles. |
| ✅ [Access Reviews & Attestations](./access-reviews.md) | Simulate periodic certifications where managers and compliance officers validate user access rights. |

---

## 🛠️ Tools Used

- **Microsoft Entra ID** (PIM, Conditional Access, role assignments)  
- **Okta Identity Cloud** (app-based access policies, admin roles, MFA)  
- **Active Directory** (on-prem privileged groups, delegation, smart card MFA)  
- **Azure AD Connect** (hybrid identity context)  
- **PowerShell** (reporting on role membership, privileged accounts, access reviews)  
- **Okta Workflows** (automating access attestation and notifications)  

---

## 🌐 Related Labs

| Lab | Focus |
|-----|-------|
| ☁️ [Microsoft Entra ID](../entra/README.md) | Cloud identity provisioning, license assignment, Conditional Access enforcement |
| 🔐 [Okta](../okta/README.md) | Application integrations, MFA policies, lifecycle automation |
| 🧱 [Active Directory (On-Prem)](../activedirectory/README.md) | OU structure, delegated access, PowerShell automation |
| 🔄 [Federation Protocols](../federation-protocols/README.md) | Authentication flows with SAML, OAuth, and OIDC |

---

## 💡 Next Steps

Dive into each walkthrough to simulate how organizations enforce **secure access at scale**. By completing this module, you’ll gain experience designing **layered, principle-driven access controls** that:  

- Enforce **least privilege** through RBAC  
- Require **step-up MFA** for sensitive actions  
- Apply **conditional access policies** across cloud and on-prem  
- Protect elevated accounts with **PIM/PAM**  
- Maintain compliance with **regular access reviews**  

These skills reflect **real-world IAM engineering responsibilities** in securing enterprise identities.

