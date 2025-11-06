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
- Select the test users or groups you want to assign to the app  
- **Assign a Role**  
   - If the application supports roles, you can select a **role** for the user or group.  
   - Roles define what level of access or permissions the user has within the app (e.g., Admin, Reader, Contributor).  
   - If the app has no predefined roles, you can skip this step.  
- Click **Assign** to complete the assignment

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

This section shows how to configure SAML SSO for GitHub Enterprise Cloud using Microsoft Entra ID

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
- **Assign Users or Groups:**  
  - Open **Users and groups** in the Enterprise Application  
  - Click **+ Add user/group** → select the users or groups to grant access  
  - Click **Assign**

 > 💡 **Tip:** Even if your GitHub Enterprise org is not fully active, you can still configure SAML in Entra to demonstrate SSO integration
  
📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/04-sso-configuration-saml.png`

---

#### 🅱️ OIDC (Typical for Modern or Custom Web Apps)

If you’re integrating a modern application your team developed:

- Register the app in **App registrations → + New registration**  
   - Set your **Redirect URI**, e.g.,  
   - `https://localhost:3000/auth/callback` *(for a local web app)*  
   - or `https://oidcdebugger.com/debug` *(for easy testing)*  
- Once registered, Entra automatically creates the corresponding **Enterprise Application** 
- Open the **Enterprise Application** → **Single sign-on**  
   - You’ll see a message like:  
     > “Because this application uses OpenID Connect and OAuth, most single sign-on configuration is already complete.”  
   - This means Entra automatically linked the app registration’s OIDC settings (redirect URIs, tokens, etc.) — no manual SSO setup is needed 
- Review the app’s **Properties** and **Permissions** to confirm configuration 
   - You can verify redirect URIs and token permissions under **App registrations → Authentication** 
- Assign users or groups to the app under **Users and groups** in the Enterprise Application.  

> 💡 **Tip:** Use **OIDC** for internally developed or modern applications where you control the authentication flow 
> Use **SAML** for third-party, legacy, or gallery-based enterprise apps 

📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/04-sso-configuration-oidc.png`

📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/04-sso-configuration-oidc.png`

---

### 🧪 Test Your SSO Configuration

**For SAML Apps** 
- In the app’s **Single sign-on** page, click **Test this application** 
   - For real apps, this will redirect you to the login flow to verify SSO
- Sign in with your Entra user 
   - Verify that authentication succeeds and that the expected claims (like `userPrincipalName`) are included 
> 💡 **Note:** If this is a demo, placeholder, or dummy app, the **“Test this application”** option may not complete successfully since the app has no live endpoint 
> - You can still configure and save the setup to demonstrate how Entra handles SSO integration
- **Alternative for OIDC / Demo Apps:**
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
      - User claims, including `userPrincipalName`, `name`, etc  

> ✅ This allows you to verify OIDC authentication in a lab environment without a live application endpoint

---

## ⚡ Configure SCIM Provisioning

### Step 7: Enable SCIM Provisioning with Harness (Free Trial)

> 💡 **Note:** Harness provides a free trial that supports SCIM, allowing you to fully demonstrate automatic user provisioning with Microsoft Entra ID

### Create a Harness Free Trial Account
- Go to [https://harness.io/get-started/](https://harness.io/get-started/) and sign up for a **free trial**
- After logging in, open **Account Settings** to find your **Account ID** — you’ll need this later for your SCIM endpoint 
   - Example SCIM endpoint format:  
     ```
     https://app.harness.io/gateway/ng/api/scim/account/<ACCOUNT_ID>
     ```
### Generate an API Token in Harness
- In Harness, go to **Account Settings → Service Accounts → + New Service Account**
- Name it something like `SCIM-Entra-Provisioning` → **Save**
- Open your new service account and click **+ API Key** → name it (e.g., `entra-scim-demo`) → **Save**
- Under your API key, click **+ Token**, give it a name (e.g., `SCIM-Token`) → **Generate Token**
- Copy the token — it will only be shown once  
   - This token will serve as your **Secret Token** in Entra

### Configure SCIM in Microsoft Entra ID
- Go to **Microsoft Entra Admin Center → Enterprise Applications → Harness → Provisioning → Get started**
- Set **Provisioning Mode** to **Automatic**
- Under **Admin Credentials**, fill in the following:  
   - **Tenant URL (SCIM Endpoint):**  
     ```
     https://app.harness.io/gateway/ng/api/scim/account/<ACCOUNT_ID>
     ```
   - **Secret Token:** *(Paste the API token you copied from Harness)*
- Click **Test Connection** → You should see **“Connection successful”** if the token and Account ID are valid
- Set **Provisioning Status** to **On** → **Save**

### Configure Attribute Mappings
- Under **Mappings**, verify or adjust these default Entra → Harness mappings:
   - `userPrincipalName` → `userName`
   - `displayName` → `name.formatted`
   - `mail` → `emails[type eq "work"].value`
- You can leave the rest as defaults for this lab

### Assign a Test User
- In the Entra admin center, go to your **Harness Enterprise Application → Users and Groups**
- Click **+ Add user/group**
- Select a single **test user** (e.g., `test.user@yourdomain.com`)
- Click **Assign** 

> ⚠️ Only users assigned to the app will be provisioned via SCIM

### Trigger an On-Demand Provisioning Cycle
- Go to the **Provisioning** tab in your Harness app in Entra
- Scroll to **Start provisioning** (or similar section)
- Click **Provision on demand**
- Search for your test user → click **Provision**  
   - Entra will immediately send SCIM requests to Harness

###  Verify User Creation in Harness
- Log in to **Harness** as an account admin
- Go to **Account Settings → Access Control → Users**
- Verify that your test user was created with the correct username and email

### Test the Update Flow
- In Entra, edit your test user’s profile (e.g., update **Job Title** or **Department**)
- Wait a few minutes or trigger **Provision on demand** again
- Check in Harness → confirm the update synced successfully

### Test Deactivation / Deprovisioning
- In the Entra admin center, open your **Harness Enterprise Application**
- Go to **Users and groups** → **Remove assignment** for your test user
- Wait a few minutes or manually run **Provision on demand**
- In Harness, confirm that the user is **deactivated or suspended**

### Review Provisioning Logs
- Monitor status and sync activity in **Provisioning Logs** within Entra  
- Successful runs will confirm user lifecycle actions (create, update, delete) were performed correctly

📸 **Screenshot Example:**  
`/entra/screenshots/enterprise-apps/06-scim-provisioning-harness.png`

> 💡 **Tip:** Harness is ideal for SCIM labs — it supports bearer token authentication, a full SCIM v2 endpoint, and a free trial environment for hands-on demos


## 📝 **Customize Tokens and Claims**

### Step 8: Token Configuration

In this step, you’ll define **which user attributes** Entra ID sends to your application during authentication  
These claims determine what user information (e.g., name, email, roles) your app receives after login — critical for user identification, authorization, and personalization

####  Open Token & Claim Settings
- Go to your SAML or OIDC **Enterprise Application → Single sign-on → Attributes & Claims**  
- This is where Entra defines what’s included inside the **SAML token** or **OIDC ID token** sent to the app

#### Review or Add Common Claims
Add or verify these claims depending on your integration needs:

| Claim Type | Example Attribute | Purpose |
|-------------|------------------|----------|
| **Name ID** | `user.userprincipalname` | The primary user identifier used for login; required by most apps |
| **Email** | `user.mail` or `user.userprincipalname` | Sends the user’s email address to the app |
| **Display Name** | `user.displayname` | Used for showing user-friendly names in the app |
| **Group Membership** | `user.groups` | Enables role-based access control (RBAC) if the app supports it |

> 💡 **Tip:** Only include claims the target app requires — sending unnecessary claims can cause token bloat or errors

#### Configure SAML Signing Certificate (If Required)
- If your app uses **SAML**, you may need to:
   - Download or configure the **SAML signing certificate** under **Single sign-on → SAML Certificates**  
   - This ensures that the token sent from Entra is **digitally signed** and **trusted** by the service provider (your app)

#### Save and Test
- After updating claims, click **Save**
- Go to **Single sign-on → Test this application** to verify that your updated claims appear correctly in the token
- For OIDC apps, you can also use tools like [https://jwt.ms](https://jwt.ms) to decode and inspect ID tokens

> 🎯 **Purpose:**  
> This step ensures the application receives the **right user information** from Entra ID for authentication, authorization, and profile mapping — an essential part of any SSO configuration

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

You’ve successfully integrated enterprise applications and configured authentication, provisioning, and monitoring
Next, you’ll implement **Identity Governance** to manage access packages, PIM, and terms of use

➡️ [Continue to: Identity Governance](./identity-governance.md)

