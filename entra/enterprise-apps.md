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

1. Open the app → **Users and groups → + Add user/group**  

2. Select the test users or groups you want to assign to the app  

3. ** Assign a Role**  
   - If the application supports roles, you can select a **role** for the user or group.  
   - Roles define what level of access or permissions the user has within the app (e.g., Admin, Reader, Contributor).  
   - If the app has no predefined roles, you can skip this step.  

4. Click **Assign** to complete the assignment


📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/02-assign-users.png`

---

## 🛠️ Register a Custom Enterprise Application

### Step 4: Create a New App

- Go to **Enterprise applications → + New application → Create your own application**  
- Enter app name (e.g., `Contoso Custom App`)  
- Choose **Integrate any other application you don’t find in the gallery** → **Create**

📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/03-custom-app-registration.png`

### Step 5: Configure Single Sign-On

- Depending on your app type, you’ll configure **SAML** or **OIDC (OpenID Connect)** for authentication

#### 🅰️ SAML (GitHub Enterprise Cloud)

This section shows how to configure SAML SSO for GitHub Enterprise Cloud using Microsoft Entra ID.

- **Sign up for GitHub Enterprise Cloud Free Trial:**  
  - Go to [https://github.com/enterprise](https://github.com/enterprise)  
  - Click **Start a free trial** and follow the prompts to create your Enterprise account  
  - Once your enterprise account is created, note the **organization name** you will use for SSO

- **Add GitHub Enterprise Cloud from the Entra Gallery:**  
  - Open **Microsoft Entra Admin Center → Enterprise applications → + New application → Add an application from the gallery**  
  - Search for **GitHub Enterprise Cloud** and click **Add**  
  - Once added, the app will appear under **Enterprise Applications**

📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/01-github-gallery.png`

- **Configure SAML Single Sign-On:**  
  - Open the **GitHub Enterprise Cloud** app → **Single sign-on → SAML**  
  - Configure the following fields using your GitHub org info:  
    - **Identifier (Entity ID):** `https://github.com/orgs/<your-org-name>`  
    - **Reply URL (ACS):** `https://github.com/orgs/<your-org-name>/saml/consume`  
    - **Sign-on URL (optional):** `https://github.com/login`  
  - Under **Attributes & Claims**, ensure **user.userprincipalname** is mapped to the **NameID**  
  - Click **Save**  
  - *(Optional)* Download the **Federation Metadata XML** for your app — this can be uploaded to GitHub if needed

📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/04-sso-configuration-saml.png`

- **Assign Users or Groups:**  
  - Open **Users and groups** in the Enterprise Application  
  - Click **+ Add user/group** → select the users or groups to grant access  
  - Click **Assign**  

> 💡 **Tip:** Even if your GitHub Enterprise org is not fully active, you can still configure SAML in Entra to demonstrate SSO integration.

---

#### 🅱️ OIDC (Typical for Modern or Custom Web Apps)

If you’re integrating a modern application your team developed:

1. Register the app in **App registrations → + New registration**  
   - Set your **Redirect URI**, e.g.,  
     - `https://localhost:3000/auth/callback` *(for a local web app)*  
     - or `https://oidcdebugger.com/debug` *(for easy testing)*  

2. Once registered, Entra automatically creates the corresponding **Enterprise Application**.  
3. Open the **Enterprise Application** → **Single sign-on**.  
   - You’ll see a message like:  
     > “Because this application uses OpenID Connect and OAuth, most single sign-on configuration is already complete.”  
   - This means Entra automatically linked the app registration’s OIDC settings (redirect URIs, tokens, etc.) — no manual SSO setup is needed.  
4. Review the app’s **Properties** and **Permissions** to confirm configuration.  
   - You can verify redirect URIs and token permissions under **App registrations → Authentication**.  

5. Assign users or groups to the app under **Users and groups** in the Enterprise Application.  

> 💡 **Tip:** Use **OIDC** for internally developed or modern applications where you control the authentication flow.  
> Use **SAML** for third-party, legacy, or gallery-based enterprise apps.  

📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/04-sso-configuration-oidc.png`

📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/04-sso-configuration-oidc.png`

---

### 🧪 Test Your SSO Configuration

**For SAML Apps** 
1. In the app’s **Single sign-on** page, click **Test this application**.  
   - For real apps, this will redirect you to the login flow to verify SSO.  
2. Sign in with your Entra user.  
   - Verify that authentication succeeds and that the expected claims (like `userPrincipalName`) are included.  
3. 💡 **Note:**  
   - If this is a demo, placeholder, or dummy app, the **“Test this application”** option may not complete successfully since the app has no live endpoint.  
   - You can still configure and save the setup to demonstrate how Entra handles SSO integration.  

4. **Alternative for OIDC / Demo Apps:**  
   - Open [https://oidcdebugger.com](https://oidcdebugger.com)  
   - Fill in the following fields from your Entra app registration:
     - **Authorize URL:** `https://login.microsoftonline.com/<tenant-id>/oauth2/v2.0/authorize`  
       *(replace `<tenant-id>` with your Entra tenant ID from Azure AD → Overview → Tenant ID)*
     - **Client ID:** Application (client) ID from your app registration  
     - **Scope:** `openid profile email`  
     - **Redirect URI:** `https://oidcdebugger.com/debug`  
     - **Client Secret:** Only needed for Authorization Code Flow with confidential clients (optional)
   - Scroll down and click **Send Request**  
   - Sign in with a user in your tenant  
   - After authentication, OIDC Debugger will display:
     - **ID Token** (JWT)  
     - Access token (if requested)  
     - User claims, including `userPrincipalName`, `name`, etc.  

> ✅ This allows you to verify OIDC authentication in a lab environment without a live application endpoint.

---

## ⚡ Configure SCIM Provisioning
### Step 7: Enable SCIM Provisioning (Lab-Friendly)

> ⚠️ Note: For a dummy or test app, you won't actually provision users. This step demonstrates the configuration workflow.

1. Go to **Entra Admin Center → Enterprise applications → Your App → Provisioning → Get started**  
2. Click **Create Configuration**  
3. **Select Authentication Method**  
   - Choose **OAuth 2.0 Client Credentials Grant**  
   - For lab/demo, you can enter placeholder values:
     - **Tenant URL / SCIM Endpoint:** `https://example.com/scim/v2/`
     - **Client ID:** `placeholder-client-id`
     - **Client Secret:** `placeholder-secret`
     - **Token Endpoint:** `https://example.com/oauth2/token`
4. Click **Test Connection**  
   - In a lab, this will likely fail, but it demonstrates where you would verify connectivity in production.
5. Configure **Scoping Filters** (optional)  
   - Limit which users or groups would be synced (e.g., only test users)  
6. **Map Attributes**  
   - Map Entra attributes like `userPrincipalName`, `displayName`, `mail` to the SCIM app schema  
7. **Set Properties**  
   - Configure options such as “Account Enabled,” “Delete Users,” or “Sync Interval”  
8. Click **Start Provisioning**  
   - Users will not actually be provisioned for a dummy app, but this demonstrates the workflow.

📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/06-scim-provisioning.png`

> 💡 Tip: This workflow is mainly for demonstration. In production, you would replace placeholders with real SCIM endpoints, OAuth credentials, and test connectivity before starting provisioning.

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

