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
$guest = @{
    invitedUserEmailAddress = "bob.jones@example.com"
    inviteRedirectUrl = "https://myapps.microsoft.com"
    sendInvitationMessage = $true
}
New-MgInvitation -BodyParameter $guest
```
📸 Screenshot Example:
/entra/screenshots/external-identities/02-powershell-invite.png

---

## 🔑 Configure Collaboration Settings

### Step 4: Guest User Settings

- Navigate to **External Identities → External collaboration settings**
- Configure:
  - **Guest user access restrictions** (e.g., limit access)
  - **Collaboration restrictions** (domains allowed/blocked)
  - **Permissions for guests** (directory read/write, group membership)

📸 **Screenshot Example:**  
`/entra/screenshots/external-identities/03-guest-settings.png`

---

## 🌍 Configure Identity Providers for B2C

### Step 5: Add a Social Identity Provider

- Go to **External Identities** → **All identity providers** 
- Select **provider type** (e.g., Google, Facebook)
- For **Google**:
   - Go to the [Google Cloud Console]( https://console.cloud.google.com/)
- Create or Select a Project:
   - Click the project dropdown at the top of the page
   - Either create a new project or select an existing one that you want to use for your B2C integration
- Enable the OAuth Consent Screen:
   - In the left-hand menu, navigate to APIs & Services → OAuth consent screen
   - Choose External for the user type (this allows users outside your organization to log in — typical for B2C scenarios).
   - Configure required details such as App name, User support email, and Developer contact information
   - Click Save and Continue through the scopes and test users sections as needed
- Create OAuth Credentials:
   - Go to APIs & Services → Credentials
   - Click Create Credentials → OAuth client ID
   - Select Web application as the application type
- Configure Authorized Redirect URIs:
   - Enter a name for your OAuth client.
- Under Authorized redirect URIs, add the redirect URI that corresponds to your Entra B2C tenant and policy:
   - Example:https://contosob2c.b2clogin.com/contosob2c.onmicrosoft.com/B2C_1A_signup_signin/oauth2/authresp
- Create and Retrieve Client Credentials:
   - Click Create to generate the OAuth client
   - Copy the Client ID and Client Secret displayed, you will need these values when configuring the Google identity provider in Entra B2C
- Add Google as an Identity Provider in Entra B2C:
   - In the Entra B2C portal, navigate to Identity providers → Google
   - Enter the Client ID and Client Secret from the Google Cloud Console
- Save your configuration.

📸 **Screenshot Example:**  
`/entra/screenshots/external-identities/04-social-idp.png`

---

### Step 6: Add a SAML Identity Provider (using Okta)

In this step, you’ll connect an external **SAML Identity Provider (IdP)** — in this case, **Okta** — to your Microsoft Entra tenant for cross-tenant authentication.

> 💡 Note: You can use a free [Okta Developer Account](https://developer.okta.com/signup/) for this exercise.  
> Okta will act as the **IdP**, and Microsoft Entra will act as the **Service Provider (SP)**.

#### 🏁 Part 1: Configure the SAML App in Okta (IdP Side)

1. Sign in to your **Okta Developer Console** → switch to **Classic UI** if needed.
2. Go to **Applications → Applications → Create App Integration**.
3. Choose:
   - **Sign-in method:** SAML 2.0  
   - Click **Next**.
4. Configure SAML settings with placeholder values (you’ll replace these later):
   - **Single sign-on URL (ACS):** `https://dummy`
   - **Audience URI (SP Entity ID):** `https://dummy`
   - Click **Next → Finish**.
5. In the new app’s **Sign On** tab, click **View SAML setup instructions**.
6. Copy the **Identity Provider metadata URL** — you’ll need this for Entra configuration.

---

#### 🏗️ Part 2: Configure the SAML IdP in Microsoft Entra (External Identities Side)

1. In the **Microsoft Entra admin center**, go to:
   - **External Identities → All identity providers → + New SAML/WS-Fed IdP**
2. Enter:
   - **Display name:** `Okta-SAML-IdP`
   - **Domain name of federating IdP:** `okta.com`
3. Under **Metadata**, select **URL** and paste the **IdP metadata link** copied from Okta.
4. Configure the following claim mappings:

   | Claim Name   | Value                    |
   |---------------|--------------------------|
   | NameID        | `user.email`             |
   | email         | `user.email`             |
   | given_name    | `user.firstName`         |
   | surname       | `user.lastName`          |

5. Click **Save**.
6. Test the connection — you should be redirected to the Okta sign-in page.
7. After successful authentication, you’ll be redirected back to your app in Entra.

---

📸 **Screenshot Example:**  
`/entra/screenshots/external-identities/05-saml-idp.png`

---

✅ **Expected Result:**
- Okta successfully authenticates the user via SAML.
- Microsoft Entra accepts the SAML assertion and signs the user in.
- You can now invite Okta users as external identities in Entra.

> 🔗 For more details on SAML app creation and configuration, see the [Enterprise App Integrations – SAML Configuration](https://github.com/ColiverSEC/Enterprise-IAM-Lab/blob/main/entra/enterprise-apps.md) module.


---

## ⚡ Create and Configure User Flows (B2C)

### Step 7: Create a Sign-Up / Sign-In Flow

- Navigate to **External Identities → User flows → + New user flow**  
- Choose **Sign up and sign in**  
- Select **identity providers** (social, local, SAML)  
- Configure **page layouts and attributes** to collect  
- Click **Create**

📸 **Screenshot Example:**  
`/entra/screenshots/external-identities/06-signin-flow.png`

---

### Step 8: Create a Password Reset Flow

- Navigate to **External Identities → User flows → + New user flow**  
- Choose **Password reset**  
- Select **identity providers**  
- Configure **attributes**  
- Click **Create**

📸 **Screenshot Example:**  
`/entra/screenshots/external-identities/07-password-reset.png`

---

## 📊 Monitor and Manage Guest Lifecycle

### Step 9: Review Guest Activity

- Navigate to **Users → Guest users → Activity logs**  
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
