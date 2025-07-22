# 🔗 Okta Application Integration Walkthrough

## 📝 What This Covers
- Adding apps to Okta
- Configuring SAML or OIDC settings
- Assigning users and testing SSO
- Just-in-Time (JIT) provisioning basics

## 🛠️ How to Set It Up

1. **Add a New App in Okta**  
   - Go to **Applications** → *Create App Integration*
   - Choose **SAML 2.0** or **OIDC - Web Application**
   - Provide basic info (App name, logo, etc.)

2. **Configure SAML / OIDC Settings**
   - Fill in SSO URL, Entity ID, Attributes
   - (Use a test app like *GitHub* or *dummyapp.io* if desired)

3. **Assign the App to a Test User**

4. **Test SSO Flow**

📸 Screenshots:
- App created and assigned  
- SAML assertion response  
- Logged in successfully to app

## ✅ Expected Behavior
- SSO should succeed for assigned users  
- Okta logs the event in **System Log**
