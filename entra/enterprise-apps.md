# 📲 Enterprise App Integrations & Registration  

⬅️ [Back to Entra ID Lab Overview](./README.md)

This walkthrough covers how to integrate and manage applications in Microsoft Entra ID. You’ll configure **gallery applications**, **custom apps**, **App Proxy**, **SCIM provisioning**, token settings, and monitoring.

---

## 📚 What This Lab Covers

- Adding **gallery apps** from the Entra ID app gallery  
- Registering **custom enterprise applications**  
- Configuring **Azure AD Application Proxy** for on-premises apps  
- Customizing **token claims and SAML attributes**  
- Configuring **SCIM provisioning** for automatic user lifecycle management  
- Monitoring app sign-ins and provisioning events  

---

## 📝 What You’ll Need

🔹 Microsoft Entra ID tenant with Global Administrator privileges  
🔹 Test users and groups for app assignment  
🔹 Optional: On-premises app for Azure AD App Proxy  
🔹 SaaS app supporting SCIM (for provisioning lab)  

---

## ➕ Add a Gallery Application

### Step 1: Navigate to Enterprise Applications

- Go to **Entra Admin Center → Enterprise applications → + New application**  
- Choose **Add an application from the gallery**  

### Step 2: Select App

- Search for a test app (e.g., **Salesforce**, **ServiceNow**)  
- Click **Create** to add it to your tenant  

📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/01-add-gallery-app.png`

### Step 3: Assign Users and Groups

- Open the app → **Users and groups → + Add user/group**  
- Select test users or groups → **Assign**  

📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/02-assign-users.png`

---

## 🛠️ Register a Custom Enterprise Application

### Step 4: Create a New App

- Go to **Enterprise applications → + New application → Create your own application**  
- Enter app name (e.g., `Contoso Custom App`)  
- Choose **Integrate any other application you don’t find in the gallery**  

📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/03-custom-app-registration.png`

### Step 5: Configure Single Sign-On

- Open your custom app → **Single sign-on → SAML / OIDC**  
- Configure **Identifier (Entity ID)**, **Reply URL**, and **User attributes & claims**  
- Save changes and test sign-in  

📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/04-sso-configuration.png`

---

## 🌐 Configure Azure AD Application Proxy

### Step 6: Set Up App Proxy

- Go to **Enterprise applications → Your app → Application proxy**  
- Enable **App Proxy**  
- Configure:
  - Internal URL (on-prem app URL)  
  - External URL (Azure AD accessible URL)  
  - Pre-authentication: Azure AD or Passthrough  

- Download and install **Application Proxy connector** on your on-premises server  

📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/05-app-proxy.png`

---

## ⚡ Configure SCIM Provisioning

### Step 7: Enable Automatic Provisioning

- Open the app → **Provisioning → Get started**  
- Set **Provisioning mode: Automatic**  
- Enter **Tenant URL** and **Secret Token** from the SaaS app  
- Test connection → Save → Start provisioning  

📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/06-scim-provisioning.png`

---

## 📝 Customize Tokens and Claims

### Step 8: Token Configuration

- Open the app → **Single sign-on → User Attributes & Claims**  
- Add or modify claims such as:
  - Name ID  
  - Email  
  - Group membership  

- Configure **SAML signing certificate** if required  

📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/07-token-claims.png`

---

## 📊 Monitor Application Activity

### Step 9: Review Sign-ins and Provisioning

- Go to **Enterprise applications → App → Sign-ins**  
- Review authentication events and detect errors  
- Check **Provisioning logs** for SCIM user sync status  

📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/08-monitoring.png`

---

## ✅ Expected Behavior

- Users can sign in to gallery or custom apps via Entra ID  
- SCIM provisioning synchronizes users/groups to SaaS apps automatically  
- App Proxy publishes internal apps securely to Azure AD  
- Token claims and SAML attributes are correctly configured  
- Sign-in and provisioning events are monitored successfully  

---

## 🔄 Optional Enhancements

- Configure **conditional access** per app  
- Enable **Just-In-Time access** for privileged applications  
- Automate **SCIM provisioning** with custom scripts  
- Configure **application-specific branding** for user experience  

---

## 🔗 Next Steps

You’ve successfully integrated enterprise applications and configured authentication, provisioning, and monitoring.  
Next, you’ll implement **Identity Governance** to manage access packages, PIM, and terms of use.

➡️ [Continue to: Identity Governance](./identity-governance.md)

