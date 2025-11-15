# 🌐 External Identities (B2B/B2C)  

⬅️ [Back to Entra ID Lab Overview](./README.md)

This walkthrough covers inviting external users (B2B), configuring B2C user flows for social/SAML authentication, managing collaboration, and handling guest lifecycle in Microsoft Entra ID.

---

## 📚 What This Lab Covers

- Inviting external B2B users manually and via PowerShell  
- Managing guest users and permissions  
- Configuring social identity providers for B2C  
- Configuring SAML-based identity providers  
- Creating and managing user flows (sign-up, sign-in, password reset)  
- Monitoring and auditing external user activity  

---

## 📝 What You’ll Need

🔹 Microsoft Entra ID tenant (configured from previous modules)  
🔹 Global Administrator or User Administrator privileges  
🔹 Optional: Microsoft 365 or Azure AD B2C trial licenses  
🔹 PowerShell with **Microsoft Graph module** installed  

---

## 👥 Invite External Users (B2B)

### Step 1: Invite a Guest User Manually

-  Go to **Entra Admin Center** → **Entra ID** → **Users** → **+ New user** → **Invite external user**
-  Fill in details:
   - **Name:** `Alice Smith`
   - **Email address:** `alice.smith@example.com`
   - (Optional) **Message to send**  
- Choose **Groups/roles** if needed  
- Click **Invite**

> 💡 **Tip:**
> Make sure to use a valid email address for this step

📸 **Screenshot Example:**  
`/entra/screenshots/external-identities/01-invite-guest.png`

---

### Step 2: Accept Invitation

- Alice receives an email invitation  
- She clicks the link and signs in with her existing Microsoft or organizational account  
- Guest account appears in your Entra ID under **Users → Guest users**

📸 **Screenshot Example:**  
`/entra/screenshots/external-identities/01-invite-guest.png`

---

### Step 3: Invite Guest Users via PowerShell

```powershell
Connect-MgGraph -Scopes "User.Invite.All"

New-MgInvitation -InvitedUserEmailAddress "user@email.com" `
                 -InviteRedirectUrl "https://myapps.microsoft.com" `
                 -SendInvitationMessage:$true
```
📸 Screenshot Example:
/entra/screenshots/external-identities/02-powershell-invite.png

---

## 🔑 Configure Collaboration Settings

### Guest User Settings

- Navigate to **External Identities → External collaboration settings**
- Configure:
  - **Guest user access restrictions** (e.g., limit access)
  - **Collaboration restrictions** (domains allowed/blocked)
  - **Permissions for guests** (directory read/write, group membership)

📸 **Screenshot Example:**  
`/entra/screenshots/external-identities/03-guest-settings.png`

---

## 🌍 Configure Identity Providers for B2C

### Step 1: Add a Social Identity Provider

- Go to **External Identities** → **All identity providers** 
- Select **provider type** (e.g., Google, Facebook)
- For **Google**:
   - Go to the [Google Cloud Console]( https://console.cloud.google.com/)
- Create or Select a Project:
   - Click the project dropdown at the top of the page
   - Either create a new project or select an existing one that you want to use for your B2C integration
- Enable the OAuth Consent Screen:
   - In the left-hand menu, navigate to **APIs & Services → OAuth consent screen**
   - From the OAuth Overview page click **Get started**
   - Configure required details such as App name, User support email, and Developer contact information
   - Choose **External** for the user type (this allows users outside your organization to log in — typical for B2C scenarios)
   - Click **Create** and continue through the scopes and test users sections as needed
- Create OAuth Credentials:
   - Go to **APIs & Services → Credentials**
   - Click **+ Create Credentials → OAuth client ID**
   - Select **Web application** as the application type
- Configure Authorized Redirect URIs:
   - Enter a name for your OAuth client
- Under Authorized redirect URIs, add the redirect URIs that corresponds to your Entra B2C tenant and policy:
   - `https://login.microsoftonline.com`
   - `https://login.microsoftonline.com/te/<tenant ID>/oauth2/authresp` (where <tenant ID> is your tenant ID)
   - `https://login.microsoftonline.com/te/<tenant name>.onmicrosoft.com/oauth2/authresp` (where <tenant name> is your tenant name)
- Create and Retrieve Client Credentials:
   - Click **Create** to generate the OAuth client
   - Copy the **Client ID** and **Client Secret** displayed, you will need these values when configuring the Google identity provider in Entra B2C
- Add Google as an Identity Provider in Entra B2C:
   - In the Entra B2C portal, navigate to **External Identities → All identity providers → Google**
   - Enter the Client ID and Client Secret from the Google Cloud Console
- Save your configuration

📸 **Screenshot Example:**  
`/entra/screenshots/external-identities/04-social-idp.png`

---

### Step 2: Configure the SAML App in Okta (IdP Side)

In this step, you’ll connect an external **SAML Identity Provider (IdP)** — in this case, **Okta** — to your Microsoft Entra tenant for cross-tenant authentication

> 💡 Note: You can use a free [Okta Developer Account](https://developer.okta.com/signup/) for this exercise
> Okta will act as the **IdP**, and Microsoft Entra will act as the **Service Provider (SP)**

- Sign in to your **Okta Dashboard** → switch to **Admin Console**
- Go to **Applications → Applications → Create App Integration**
- Choose:
   - **Sign-in method:** SAML 2.0  
   - Click **Next**
- In the Create SAML Integration General settings tab configure:
   - App name
   - App logo (optional)
- Configure SAML settings with placeholder values (you’ll replace these later):
   - **Single sign-on URL (ACS):** `https://placeholder.example.com`
   - **Audience URI (SP Entity ID):** `https://placeholder.example.com`
   - Click **Next → Finish**
- In the new app’s **Sign On** tab, click **View SAML setup instructions**
- Copy the **Identity Provider metadata URL** — you’ll need this for Entra configuration

---

#### Step 3: Configure the SAML IdP in Microsoft Entra (External Identities Side)

- In the **Microsoft Entra admin center**, go to:
   - **External Identities → All identity providers → + New SAML/WS-Fed IdP → Custom → + Add new → SAML/WS-Fed**
- Enter:
   - **Display name:** `Okta-SAML-IdP`
   - **Identity provider protocol:** `SAML`
   - **Domain name of federating IdP:** `trial-1111111.okta.com`
   - **Select a method for populating metadata:** `Input metadata manually`
- Paste the **Issuer URI, Passive authentication endpoint** and **Certificate** from okta → **Save**

📸 **Screenshot Example:**  
`/entra/screenshots/external-identities/05-saml-idp.png`

---

## ⚡ Create and Configure User Flows (B2C)

### Step 1: Create a Sign-Up / Sign-In Flow

- Navigate to **External Identities → User flows → + New user flow**  
- Configure Name: `B2C_SignupSignin`
- Select **identity providers** (social, local, SAML)  
- Configure **page layouts and attributes** to collect  
- Click **Create**

📸 **Screenshot Example:**  
`/entra/screenshots/external-identities/06-signin-flow.png`

---

### Step 2: Create a Password Reset Flow

- Navigate to **External Identities → User flows → + New user flow**  
- Configure Name: `B2C_ForgotPassword`
- Select **identity providers**  
- Configure **attributes**  
- Click **Create**

📸 **Screenshot Example:**  
`/entra/screenshots/external-identities/07-password-reset.png`

---

## 📊 Monitor and Manage Guest Lifecycle

### Step 9: Review Guest Activity

- Navigate to **Users → Audit Logs**  
- Monitor:
  - **Sign-ins**  
  - **Invitations sent/accepted**  
  - **License assignments**  
  - **Group memberships**

📸 **Screenshot Example:**  
`/entra/screenshots/external-identities/08-guest-activity.png`

---

## ✅ Expected Behavior

- Guests receive invitations and can sign in successfully  
- Social and SAML identity providers authenticate external users  
- User flows (sign-up, sign-in, password reset) work as expected  
- Guest activity and lifecycle can be monitored and managed  

---

## 🔄 Optional Enhancements

- Enable **conditional access for guest users**  
- Set up **automatic guest expiration and cleanup policies**  
- Integrate **B2B collaboration with Microsoft Teams or SharePoint**  
- Use **custom branding for B2C user flows**  

---

## 🔗 Next Steps

You’ve successfully configured external identities for B2B and B2C scenarios.  
Next, you can explore **hybrid identity with Entra Connect** to synchronize your on-premises Active Directory with your cloud tenant.

➡️ [Continue to: Hybrid Identity with Entra Connect](./hybrid-identity.md)
