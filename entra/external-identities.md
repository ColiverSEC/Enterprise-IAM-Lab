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
- Enter required **Client ID / Secret** from the social provider  
- Click **Save and enable**

📸 **Screenshot Example:**  
`/entra/screenshots/external-identities/04-social-idp.png`

---

### Step 6: Add a SAML Identity Provider

- Go to **External Identities → All identity providers → Custom → SAML/WS-Fed**  
- Enter:
   - **Metadata URL** or manual configuration  
   - **Name identifier and claim mappings**  
- Click **Save and test the connection**

📸 **Screenshot Example:**  
`/entra/screenshots/external-identities/05-saml-idp.png`

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
