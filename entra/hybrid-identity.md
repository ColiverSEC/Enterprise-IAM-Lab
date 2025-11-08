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

> 🧠 Tip: PHS + Seamless SSO is recommended for most environments

### Step 2: Review AD Forest & Domain Requirements

- **Verify domain functional level**: Ensure the AD forest and domain are Windows Server 2008 or higher
- **Ensure DNS resolution between AD and Entra ID**:
  - Configure the Entra Connect server with a **static IP** on the internal network
  - Set the **preferred DNS server** to point to your **domain controller** (not `127.0.0.1`)
  - Test connectivity and name resolution:
    ```powershell
    ping <DC_IP>
    nslookup <domain_name> <DC_IP>
    ```
  - **Note:** For more detailed instructions on Active Directory DNS configuration for domain-joined Windows clients, see [DNS Configuration for Active Directory Clients](https://github.com/ColiverSEC/Enterprise-IAM-Lab/blob/main/activedirectory/dns-configuration-for-active-directory-clients.md)
- **Verify domain join**:
  - Ensure the Entra Connect server is **joined to the on-premises AD domain**
- **Verify accounts for sync**:
  - **Entra Connect service account**  
  - **AD Connector account** (for reading and writing objects)

---

## ⚙️ Install Entra Connect

### Launch Installer

- **Sign in** to your **domain-joined Windows Server**  
  - This server must be joined to your **on-premises Active Directory domain** (e.g., `ad.IDSentinelSolutions.com`)
  - It should have line-of-sight to your domain controller and internet access
- **Download the Microsoft Entra Connect installer**
  - **Recommended:** Download directly from the **Microsoft Entra Admin Center** to ensure you get the latest version:
    - Navigate to **Entra ID → Entra Connect → Get Started → Download Connect Sync Agent → Accept terms & download**  
  - **Alternative:** Use the official Microsoft download page if portal access isn’t available:  
    - [Microsoft Entra Connect Download](https://www.microsoft.com/en-us/download/details.aspx?id=47594)
- **Run the Entra Connect installer** on your domain-joined server  
  - Right-click the downloaded file **Azure AD Connect** → **Run as Administrator**
  - If prompted by SmartScreen, select **Run anyway**
- Once the setup wizard opens, you’ll immediately see the **installation type** selection screen:
  - **Express Settings** — Best for single-forest environments with PHS
    - Uses default sync options
    - Synchronizes all users, groups, and passwords 
  - **Customize** — For advanced scenarios:
    - Multiple forests  
    - PTA or federation  
    - Select OU filtering  
    - Enable password writeback 
- Choose the option that fits your lab scenario and proceed to the next screen
- When the wizard prepares the configuration steps, continue to **🔐 Configure Authentication Options**

> 💡 **Tip:** Microsoft recommends installing Entra Connect on a **dedicated, domain-joined member server** rather than directly on your domain controller. This improves security and simplifies maintenance

📸 **Screenshot Example:**  
`/entra/screenshots/hybrid-identity/01-install-launch.png`

---

## 🔐 Configure Authentication Options

### Step 1: Enable Password Hash Sync (PHS) or Pass-Through Authentication (PTA)

- On your **domain-joined Entra Connect server**, launch **Microsoft Entra Connect**  
  - If it opens to **Additional Tasks**, select **Customize synchronization options** → **Next**
- Authenticate when prompted:  
  - **Azure AD Global Admin credentials**  
  - **On-premises AD credentials** (domain admin or delegated account)
- Navigate to the **User Sign-In / Authentication Options** page:  
   - Here you’ll see three main choices:  
     - **Password Hash Synchronization (PHS):**  
       - Default method  
       - Syncs hashed passwords from AD to Entra ID  
       - Allows users to sign in using the same password in both environments  
     - **Pass-Through Authentication (PTA):**  
       - Authenticates users directly against on-prem AD  
       - Does **not** store password hashes in the cloud  
       - Useful for organizations with strict password policies  
     - **Seamless Single Sign-On (Seamless SSO):**  
       - Automatically signs in domain-joined devices without prompting for credentials
- Select **Password Hash Sync** for labs and test environments, then click **Next**
> 💡 **Tip:** PTA and SSO require additional agents and configuration. For simple lab scenarios, PHS + Seamless SSO is easiest

📸 **Screenshot Example:**  
`/entra/screenshots/hybrid-identity/03-authentication-options.png`

### Step 2: Enable Password Writeback (Optional)

- Password writeback allows users to **reset their passwords in the cloud**, and those changes are written back to your on-prem AD
- In the wizard, continue to the **Optional Features** page:  
  - You’ll see checkboxes for optional functionality (Password writeback, Device writeback, Exchange hybrid, etc.)
- Check the box for:
  - Password writeback
- Click **Next → Configure** to apply changes
- Verification:  
  - In **Microsoft Entra Admin Center → Identity → Password reset → On-premises integration**, you should see:
    - Password writeback: Enabled
- Test by changing a password in the Entra portal for a synced user — the new password should work on-prem AD

> 💡 **Tip:** To enable another authentication method (like PTA) after syncing:  
> - Relaunch Entra Connect  
> - Select **Customize synchronization options**  
> - Authenticate again  
> - Choose the desired authentication method  
> - Re-run the sync

📸 **Screenshot Example:**  
`/entra/screenshots/hybrid-identity/04-password-writeback.png`

### Step 3: Finish Installation & Initial Sync 

- Check **Start the synchronization process when configuration completes** → click **Configure**  
- Initial synchronization starts (can take a few minutes depending on AD size)  
- Once configuration completes, click **Exit**  
- Verify the sync by going to **Entra ID → Users → All users** and filter by **On-premises sync enabled** to confirm your users are there

> 💡 **Optional:** For more detailed verification, you can:
> - Check **Synchronization Service Manager** on the server  
> - Use **PowerShell**:
> ```powershell
> Import-Module ADSync
> Get-ADSyncScheduler
> ```
> - Check **last sync** and **next scheduled sync**  
> - View **Azure AD Connect Health** for alerts or errors (note: dashboards may appear mostly empty in a small lab)

📸 **Screenshot Example:**  
`/entra/screenshots/hybrid-identity/05-initial-sync.png`

### Step 4: Optional Filtering & Staging Mode

- After your initial sync is complete, you can optionally configure advanced settings:
  - **OU Filtering**  
    - Allows you to sync only specific OUs instead of the entire domain  
    - Useful for labs or when you want to limit which users/groups are synced  
    - To configure:  
      - Launch **Microsoft Entra Connect** → **Customize synchronization options** → navigate to **Domain and OU filtering**  
  - **Staging Mode**  
    - Use on a secondary server to test changes without affecting production  
    - The server in staging mode **does not export changes to Entra ID**  
    - Great for multi-forest or large enterprise environments  
    - To enable: select **Enable staging mode** in the wizard during configuration  

> 💡 **Tip:** In a small lab with a single forest, you can skip these options and sync the entire `_USERS` OU

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

