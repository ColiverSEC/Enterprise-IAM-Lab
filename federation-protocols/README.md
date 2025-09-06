# 🌐 Federation Protocols Lab

[⬅️ Back to Enterprise IAM Lab Overview](../README.md)

This lab provides **hands-on experience with identity federation standards**. These protocols form the foundation of how identities are authenticated, authorized, and provisioned across systems. You will explore **SAML, OAuth 2.0, OpenID Connect (OIDC), and SCIM** through real-world federation scenarios.  

Key focus areas include:  

- ✅ Identity Provider (IdP) and Service Provider (SP) trust relationships  
- ✅ Authentication flows with **SAML** and **OIDC**  
- ✅ Authorization delegation using **OAuth 2.0**  
- ✅ Automated provisioning and deprovisioning with **SCIM**  
- ✅ Capturing and analyzing tokens, assertions, and claims  

These walkthroughs simulate **real-world federation tasks** that IAM engineers encounter when connecting directories, identity providers, and SaaS applications.

---

## 📂 Lab Walkthroughs

| Walkthrough | Description |
|-------------|-------------|
| 📝 [SAML Essentials](./saml-essentials.md) | Explore IdP vs. SP roles, exchange metadata, and capture a SAML assertion during login. |
| 🔑 [OAuth 2.0 & OIDC](./oauth-oidc.md) | Run OAuth flows, extend them with OIDC, request ID tokens, and decode JWT claims. |
| 📦 [SCIM Provisioning](./scim-overview.md) | Automate account provisioning/deprovisioning using SCIM APIs and attribute mappings. |

---

## 🛠️ Tools Used

- **SAML-tracer** browser extension (to capture SAML assertions)  
- **Postman** (for OAuth, OIDC, and SCIM API calls)  
- **JWT.io** (to decode and analyze JWTs)  
- **Demo identity platforms** (Okta dev tenant, Microsoft Entra ID, [samltest.id](https://samltest.id))  

---

## 🌐 Related Labs

| Lab | Focus |
|-----|-------|
| 🔐 [Okta IAM Lab](../okta/README.md) | Implements SAML, OIDC, and SCIM with a cloud IdP. |
| ☁️ [Microsoft Entra ID Lab](../entra/README.md) | Cloud identity provisioning, hybrid sync, and Conditional Access. |
| 🧱 [Active Directory Lab](../activedirectory/README.md) | On-premises identity foundation with domains, OUs, and protocols. |

---

## 💡 Next Steps

Dive into each walkthrough to build a deep understanding of **federation standards**. Once you know the flows and protocols, you’ll be ready to apply them in **Okta** and **Microsoft Entra** labs for real-world IAM scenarios.

