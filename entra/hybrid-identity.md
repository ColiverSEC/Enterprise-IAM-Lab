# 🔗 Hybrid Identity with Entra Connect  

⬅️ [Back to Entra ID Lab Overview](./README.md)

This walkthrough covers planning, installing, and managing **Microsoft Entra Connect** to synchronize your on-premises Active Directory with your Entra ID tenant. You’ll configure **Password Hash Sync (PHS)**, **Pass-through Authentication (PTA)**, **Seamless SSO**, **password writeback**, and monitoring.

---

## 📚 What This Lab Covers

- Planning hybrid identity architecture  
- Installing Entra Connect on a domain-joined server  
- Configuring synchronization options (PHS/PTA)  
- Enabling Seamless Single Sign-On (SSO)  
- Enabling password writeback  
- Monitoring synchronization and health  
- Optional: filtering and staging deployment  

---

## 📝 What You’ll Need

🔹 Windows Server 2019/2022 domain-joined VM (with AD DS installed)  
🔹 Global Administrator account in Entra ID  
🔹 Enterprise Admin or delegated AD permissions  
🔹 Entra Connect installer downloaded from Microsoft  
🔹 Optional: Azure AD Connect Health agent  

---

## 🏗️ Plan Your Deployment

### Step 1: Determine Authentication Method

- **Password Hash Sync (PHS):** Syncs password hashes to Entra ID  
- **Pass-through Authentication (PTA):** Users authenticate against on-prem AD  
- **Federation (AD FS):** Optional, for advanced SSO scenarios  

> 🧠 Tip: PHS + Seamless SSO is recommended for most environments.

---

### Step 2: Review AD Forest & Domain Requirements

- Verify domain functional level (Windows Server 2008 or higher)  
- Ensure DNS resolution between AD and Entra ID  
- Verify accounts for sync:  
  - Entra Connect service account  
  - AD Connector account (for reading and writing objects)  

---

## ⚙️ Install Entra Connect

### Step 3: Launch Installer

1. Run the **Entra Connect installer** on a domain-joined server  
2. Accept license terms  

📸 **Screenshot Example:**  
`/entra/screenshots/hybrid-identity/01-install-launch.png`

---

### Step 4: Choose Installation Type

- **Express Settings:** Best for single-forest environments with PHS  
- **Custom Settings:** For advanced scenarios:
  - Multiple forests  
  - PTA or federation  
  - Select OU filtering  
  - Enable password writeback  

📸 **Screenshot Example:**  
`/entra/screenshots/hybrid-identity/02-install-options.png`

---

## 🔐 Configure Authentication Options

### Step 5: Enable Password Hash Sync (PHS) or PTA

- **Password Hash Sync:** Default, syncs password hashes to Entra ID  
- **Pass-through Authentication:** Authenticates directly against on-prem AD  
- **Seamless SSO:** Automatically signs in domain-joined devices to Entra ID  

📸 **Screenshot Example:**  
`/entra/screenshots/hybrid-identity/03-authentication-options.png`

---

### Step 6: Enable Password Writeback (Optional)

- Allows cloud users to reset their passwords and sync them back to on-prem AD  
- Navigate to **Optional Features** → enable **Password writeback**  

📸 **Screenshot Example:**  
`/entra/screenshots/hybrid-identity/04-password-writeback.png`

---

### Step 7: Finish Installation & Initial Sync

- Click **Install**  
- Initial synchronization starts (can take a few minutes depending on AD size)  
- Verify synchronization status in **Synchronization Service Manager** or **Azure AD Connect Health**

📸 **Screenshot Example:**  
`/entra/screenshots/hybrid-identity/05-initial-sync.png`

---

## 📊 Monitor and Manage Entra Connect

### Step 8: Verify Synchronization

- In Entra Admin Center → **Azure AD Connect Health** → check:
  - Sync status  
  - Errors or warnings  
  - Password writeback logs  
- Optionally, run PowerShell:
```powershell
Get-ADSyncScheduler
```
- Check last sync and next sync time

### Step 9: Optional Filtering & Staging Mode

- Use **OU filtering** to sync only specific OUs  
- Use **Staging mode** on a second server to test changes before production  
- Great for multi-forest or large enterprise environments  

📸 **Screenshot Example:**  
`/entra/screenshots/hybrid-identity/06-staging-filtering.png`

---

## ✅ Expected Behavior

- AD objects sync successfully to Entra ID  
- Password hash sync or PTA authenticates users  
- Seamless SSO works on domain-joined devices  
- Password writeback allows cloud resets to update on-prem AD  
- Monitoring shows no critical errors  

---

## 🔄 Optional Enhancements

- Enable **device writeback** for hybrid conditional access  
- Configure **group writeback** for on-prem AD groups  
- Integrate with **Microsoft 365 services** (Teams, SharePoint)  
- Enable **Azure AD Connect Health** alerts and notifications  

---

## 🔗 Next Steps

You’ve now configured hybrid identity between your on-prem AD and Entra ID.  
Next, you can manage **authentication methods** and **self-service password reset** to enhance security and user experience.

➡️ [Continue to: Authentication Methods & SSPR](./authentication-methods.md)

