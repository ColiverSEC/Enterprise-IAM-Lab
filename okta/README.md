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
| 👥 [User & Group Management](./01-user-and-group-management.md)         | Create users, manage custom attributes, assign admin roles, and automate group membership with rules.      |
| 📦 [Application Setup with OIN (SAML/OIDC)](./02-application-integrations.md)     | Integrate apps using SAML & OIDC via Okta Integration Network (OIN). Configure provisioning and SSO.       |
| 🧩 [App Attribute Mapping & Offboarding](./03-app-attribute-mapping-offboarding.md) | Map user attributes between Okta and an integrated app, and manage user offboarding.          |
| 🔐 [Authentication & MFA Policies](./04-authentication-mfa-policies.md) | Set up authenticators, enrollment policies, session rules, authentication policies, and password/self-service recovery. |
| 🧰 [Troubleshooting & User Access](./05-troubleshooting.md)  | Troubleshoot login issues, app access problems, session expirations, and group assignment errors for users in Okta.       |
| 📡 [Syslog & Okta Support](./06-syslog-support.md) | Search and filter events in the Okta System Log, and identify resources to get help and support from Okta. |

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
