# 👤 User & Group Provisioning  

⬅️ [Back to Entra ID Lab Overview](./README.md)

This walkthrough covers how to create and manage users and groups in Microsoft Entra ID. You’ll create accounts manually and in bulk, assign licenses, use PowerShell for automation, and configure dynamic groups for automatic membership management.

---

## 📚 What This Lab Covers

- Creating users manually in the Entra admin portal  
- Importing users in bulk from a CSV file  
- Creating groups (Security & Microsoft 365)  
- Assigning users to groups  
- Assigning licenses to users and groups  
- Creating and validating dynamic group rules  
- Managing users and groups with PowerShell  

---

## 📝 What You’ll Need

🔹 Microsoft Entra ID tenant (configured from previous module)  
🔹 Global Administrator or User Administrator privileges  
🔹 (Optional) Microsoft 365 licenses (E3/E5 trial or equivalent)  
🔹 PowerShell with the **Microsoft Graph module** installed  

---

## 👥 Create Users Manually

### Step 1: Open Entra Admin Center  
- Go to [https://entra.microsoft.com](https://entra.microsoft.com)  
- Navigate to **Entra ID** → **Users** → **All Users** → **+ New user**

### Step 2: Add a New User  
- Choose **Create user** (not *Invite external user*)  
- Enter:
  - **User principal name:** `kblock@contoso.com`
  - **Mail nickname:** Check `Derive from user principal name`
  - **Display name:** `Ken Block`
  - **Password:** Auto-generate or set manually  
- (Optional) Assign **Roles** or **Groups**  
- Click **Create**

> 🏷️ **Note:**  
> Replace `contoso.com` with your organization’s verified domain (e.g., `idsentinelsolutions.com`) when following these steps


📸 **Screenshot Example:**  
![User creation settings](/entra/screenshots/02-user-and-group-provisioning/01-create-user-settings.png)
![User creation confirmation](/entra/screenshots/02-user-and-group-provisioning/02-user-confirmation.png
)

---

## 📂 Bulk Import Users via CSV

### Step 1: Prepare a CSV File

- In the Microsoft Entra admin center, navigate to:  
  - **Entra ID** → **Users** → **Bulk operations** → **Bulk create**
- Under **Download a CSV template**, click **Download** to get the sample file provided by Microsoft

> 🧠 **Tip:** Always use the official CSV template from Entra
> It includes the correct headers and formatting required for a successful upload
> Editing this downloaded file ensures compatibility with Entra’s import process

- Open the downloaded CSV file in Excel or a text editor, then fill in your user details  
  Example CSV (based on your tenant):

  ```csv
  Name [displayName] Required,User name [userPrincipalName] Required,Initial password [passwordProfile] Required,Block sign in (Yes/No) [accountEnabled] Required,First name [givenName],Last name [surname],Job title [jobTitle],Department [department],Usage location [usageLocation],Street address [streetAddress],State or province [state],Country or region [country],Office [physicalDeliveryOfficeName],City [city],ZIP or postal code [postalCode],Office phone [telephoneNumber],Mobile phone [mobile]
  Alex Johnson,ajohnson@idsentinelsolutions.com,Password1,No,Alex,Johnson,IT Support,IT,US,,,,,,,
  Mary Lopez,mlopez@idsentinelsolutions.com,Password1,No,Mary,Lopez,Finance Analyst,Finance,US,,,,,,,
- After all the required columns are filled out you can fill the rest of the 17 columns with `,` 

### Step 2: Upload and Import the CSV

- Return to the **Bulk create** page in the Entra admin center
- Click **Upload your CSV file** and select your edited file (`bulk-users.csv`) 
- Once uploaded, click **Submit** to start the bulk import process
- You’ll see a notification confirming that your bulk operation has started

### Step 3: Verify User Creation

- After the process completes, go to:  
  - **Users** → **Bulk operation results**
- Review the status of your upload:  
  - ✅ **Completed** — All users were successfully created 
  - ⚠️ **Failed** — Click **Download results** to review errors and correct your CSV file if needed
- Navigate back to **All Users** and use the search bar to confirm the new accounts (e.g., *Alex Johnson*, *Mary Lopez*) appear in the list

> 💡 **Tip:**  
> It may take a minute or two for new users to appear under **All Users**
> Once visible, you can open each user profile to verify properties, reset passwords, or assign licenses

📸 **Screenshot Example:**  
![Sample csv](/entra/screenshots/02-user-and-group-provisioning/03-sample-csv-edited.png)
![CSV uploaded](/entra/screenshots/02-user-and-group-provisioning/04-csv-uploaded.png)
![Bulk create confirmation results](/entra/screenshots/02-user-and-group-provisioning/05-bulk-create-confirmation.png)
![Bulk creation confirmation user list](/entra/screenshots/02-user-and-group-provisioning/06-bulk-create-confirmation2.png)

---

## 🧑‍🤝‍🧑 Create Groups

### Step 1: Create a New Group
- Navigate to **Groups** → **All Groups** → **+ New group**
- Choose:
  - Group type: Security or Microsoft 365
  - Group name: Finance Team
  - Membership type: Assigned
- Click **Create**

> 💡 **Tip:**
> - Security groups are used to give group members access to applications, resources and assign licenses
> - Microsoft 365 groups are used for collaboration, giving members access to a shared mailbox, calendar, files, SharePoint site, and so on

📸 Screenshot Example:
![Group created results](/entra/screenshots/02-user-and-group-provisioning/07-group-created.png)

### Step 2: Add Members
- Open the created group → **Members** → **+ Add members**
- Search and add Alex Johnson, Mary Lopez
- Click **Select**

📸 Screenshot Example:
![Memeber added to group](/entra/screenshots/02-user-and-group-provisioning/08-members-added.png)

---

## 🧾 Assign Licenses

> ⚠️ **Note:** Microsoft now manages user and group licenses in the **Microsoft 365 Admin Center** rather than directly in Entra ID.

### Step 1: Assign Licenses to Individual Users

- Go to the **Microsoft 365 Admin Center**: [https://admin.microsoft.com](https://admin.microsoft.com)  
- Navigate to **Users** → **Active users**
- Select the user you want to license (e.g., *Alex Johnson*) 
- In the **Licenses and Apps** section, select the license(s) you want to assign (e.g., Microsoft Entra ID P2) 
- Click **Save changes**

📸 **Screenshot Example:**  
![License assigned to user](/entra/screenshots/02-user-and-group-provisioning/09-license-assigned-to-user.png)

### Step 2: Assign Licenses to a Group (Group-based Licensing)

> 🧠 **Tip:** Group-based licensing requires **Entra ID P1 or P2**

- In the Microsoft 365 Admin Center, navigate to **Teams & groups** → **Active teams & groups**
- Select the group you want to license (e.g., *Finance Team*)
- Click **Licenses and apps**
- Assign the desired license(s)
- Click **Save changes**  

- All current and future members of the group automatically receive the assigned licenses

📸 **Screenshot Example:**  
![License assigned to group](/entra/screenshots/02-user-and-group-provisioning/10-license-assigned-to-group.png)

---

## ⚡ Create Dynamic Groups

### Step 1: Create a Dynamic Group
- Navigate to **Entra ID** → **Groups** → **+ New group**
- Select:
  - Group type: Security or Microsoft 365
  - Membership type: Dynamic User
  - Name: IT Department (Dynamic)
- Under Dynamic rule, click Add dynamic query
  - Example rule:
  - (user.department -eq "IT")
- Click **Save** → **Create**

📸 Screenshot Example:
![Dynamic group created](/entra/screenshots/02-user-and-group-provisioning/11-dynamic-group.png)
![Dyanmic rule](/entra/screenshots/02-user-and-group-provisioning/17-dynamic-query-rule.png)

### Step 2: Verify Membership

- Once the rule processes, users with Department = IT automatically appear in the group
- Check Members (Preview) or Dynamic Membership Rules to validate results

📸 Screenshot Example:
![Dyanmic rule confirmation](/entra/screenshots/02-user-and-group-provisioning/12-dynamic-group-rule-confirmation.png)

---

## 💻 Manage Users & Groups with PowerShell

### Step 1: Install and Connect Microsoft Graph Module
- You’ll use **Windows PowerShell** or **PowerShell 7 (Core)** to manage users, groups, and licenses through Microsoft Graph
- On your computer, click **Start** → search for **PowerShell**  
- Right-click **Windows PowerShell** (or **PowerShell 7**) → select **Run as Administrator** *(recommended for module installation)*
- Run the following command to install the Microsoft Graph PowerShell module:
  -  ```Install-Module Microsoft.Graph -Scope CurrentUser```
- This command downloads and installs the Microsoft Graph module from the PowerShell Gallery
- The -Scope CurrentUser flag installs it only for your account — you don’t need local admin rights
- If prompted to install from an untrusted repository, type Y and press Enter
- Once the module is installed, connect your session to Microsoft Graph by running:
  - ```Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All"```
- This command opens a sign-in window
- Log in using a Global Administrator or User Administrator account
- These scopes give you permission to create and manage users and groups in Entra ID
- After signing in, you can verify your connection with:
  - ```Get-MgContext```
- If successful, this will display your current tenant ID, account, and connected Graph endpoint 

> 💡 **Tip:**
> Once connected, your PowerShell session can now run commands like:
> - New-MgUser — create users
> - New-MgGroup — create groups

📸 **Screenshot Example:**  
![Powershell module install](/entra/screenshots/02-user-and-group-provisioning/13-powershell-module-install.png)
![Powershell module connecting to entra](/entra/screenshots/02-user-and-group-provisioning/14-powershell-connecting-to-entra.png)

### Step 2: Create a New User via PowerShell
- Open Powershell and run:
```
New-MgUser `
    -DisplayName "John Adams" `
    -UserPrincipalName "jadams@idsentinelsolutions.com" `
    -MailNickname "john.adams" `
    -AccountEnabled:$true `
    -PasswordProfile @{ForceChangePasswordNextSignIn=$true; Password="Password1"}
```
> 💡 **Tip:** If you want to create multiple users from CSV or TXT, you can loop through the CSV file like this:
```
$users = Import-Csv "C:\bulk-users.csv"

foreach ($user in $users) {
    New-MgUser `
        -DisplayName $user.displayName `
        -UserPrincipalName $user.userPrincipalName `
        -MailNickname $user.mailNickname `
        -AccountEnabled:$true `
        -PasswordProfile @{ForceChangePasswordNextSignIn=$true; Password=$user.passwordProfile}
}
```
![New user created via powershell](/entra/screenshots/02-user-and-group-provisioning/15-new-user-via-powershell.png)

### Step 3: Create a Group via PowerShell
- Open Powershell and run:
```
New-MgGroup -DisplayName "Sales Team" -MailEnabled:$false -MailNickname "salesteam" `
-SecurityEnabled:$true
```

📸 Screenshot Example:
![Group added via powershell](/entra/screenshots/02-user-and-group-provisioning/16-group-added-via-powershell.png)

---

## ✅ Expected Behavior

- Users appear correctly in the directory (manual and bulk created)
- Groups reflect assigned and dynamic memberships
- Licenses are automatically applied (if using group-based licensing)
- PowerShell commands successfully create users and groups

## 🔄 Optional Enhancements

- Enable self-service group management
- Configure Access Reviews for periodic membership validation
- Assign roles to groups (role-assignable groups)
- Automate provisioning using SCIM connectors for SaaS apps

## 🔗 Next Steps

You’ve successfully provisioned users and groups in Microsoft Entra ID.
Next, you’ll configure secure collaboration for external partners and organizations using B2B and B2C features.

➡️ Continue to: [External Identities (B2B/B2C)](./external-identities.md)
