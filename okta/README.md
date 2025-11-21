# 🔐 Okta IAM Lab

[⬅️ Back to Enterprise IAM Lab Overview](../README.md)

This lab provides **hands-on experience** with **Okta Identity Cloud**, a leading identity provider (IdP) for cloud and enterprise apps. Through these modules, you’ll practice real-world IAM engineer tasks across user lifecycle management, application integrations, security enforcement, and troubleshooting.

It focuses on:

✅ **Automating user lifecycle tasks**: create and manage users, configure custom attributes, assign admin roles, and manage group memberships.  
✅ **Integrating applications using SAML & OIDC**: set up Single Sign-On (SSO) and Just-in-Time (JIT) provisioning via the Okta Integration Network (OIN).  
✅ **Mapping user attributes & managing offboarding**: synchronize attributes with integrated apps and handle user deprovisioning.  
✅ **Enforcing Multi-Factor Authentication (MFA)**: implement authenticators, session rules, authentication policies, and password/self-service recovery.  
✅ **Troubleshooting and monitoring user access**: investigate login issues, app access problems, session expirations, and incorrect group assignments.  
✅ **Monitoring System Logs & accessing support**: analyze Okta System Log events and utilize Okta support resources effectively.


---

## 📂 Lab Walkthroughs

| Walkthrough                                                          | Description                                                                                                |
| -------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| 👥 [User & Group Management](./01-user-and-group-management.md) | Create and import users, manage profiles and custom attributes, configure groups and rules, assign admin roles, and perform account maintenance tasks. |
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
