# 🔐 Okta IAM Lab

[⬅️ Back to Enterprise IAM Lab Overview](../README.md)

This lab provides **hands-on experience** with **Okta Identity Cloud**, a leading identity provider (IdP) for cloud and enterprise apps. It focuses on:

- ✅ Application integrations using SAML & OIDC
- ✅ Single Sign-On (SSO) and Just-in-Time (JIT) provisioning
- ✅ Multi-Factor Authentication (MFA) enforcement with custom policies
- ✅ User lifecycle automation with Okta Workflows

These walkthroughs mirror **enterprise IAM engineer tasks** for securing access and automating identity processes.

---

## 📂 Lab Walkthroughs

| Walkthrough                                                          | Description                                                                                                |
| -------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| 👥 [User & Group Management](./user-and-group-management.md)         | Create users, manage custom attributes, assign admin roles, and automate group membership with rules.      |
| 📦 [Application Integrations (SAML/OIDC)](./app-integrations.md)     | Integrate apps using SAML & OIDC via Okta Integration Network (OIN). Configure provisioning and SSO.       |
| 🔐 [Authentication & MFA Policies](./authentication-mfa-policies.md) | Set up authenticators, create authentication and enrollment policies, and enforce contextual MFA.          |
| 🔄 [Lifecycle Management & Workflows](./lifecycle-management.md)     | Automate onboarding/offboarding, sync attributes, and trigger deprovisioning events using Okta Workflows.  |
| 🧩 [Attribute Mapping & Profile Management](./attribute-mapping.md)  | Map user attributes between Okta and integrated apps. Extend the user schema with custom attributes.       |
| 🧰 [Troubleshooting & Syslog Analysis](./troubleshooting-syslog.md)  | Troubleshoot login and provisioning issues, analyze syslog events, and identify common integration errors. |

---

## 🛠 Tools Used

- **Okta Admin Console**
- **Okta Workflows**
- **SAML/OIDC-compatible apps** (e.g., GitHub, demo apps)
- **Browser** (incognito mode for testing)

---

## 🌐 Related Labs

| Lab | Focus |
|-----|-------|
| ☁️ [Microsoft Entra ID](https://github.com/ColiverSEC/Enterprise-IAM-Lab/tree/main/entra) | Cloud IAM, Conditional Access, MFA, PowerShell automation. |
| 🧱 [Active Directory(On-Prem)](https://github.com/ColiverSEC/Enterprise-IAM-Lab/tree/main/activedirectory) | OU design, delegation, PowerShell automation. |
| 🔄 [Federation Protocols](https://github.com/ColiverSEC/Enterprise-IAM-Lab/tree/main/federation-protocols) | SAML, SCIM, OAuth, and OIDC authentication flows. |

---

## 💡 Next Steps

Use these labs to simulate **real-world Okta engineering scenarios**, from securing enterprise apps with SSO/MFA to automating lifecycle management with workflows.
