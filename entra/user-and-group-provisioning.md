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
- Navigate to **Identity** → **Users** → **All Users** → **+ New user**

### Step 2: Add a New User  
- Choose **Create user** (not *Invite external user*)  
- Enter:
  - **User name:** `jane.doe@contoso.com`
  - **Display name:** `Jane Doe`
  - **Password:** Auto-generate or set manually  
- (Optional) Assign **Roles** or **Groups**  
- Click **Create**

📸 **Screenshot Example:**  
`/entra/screenshots/user-and-group-provisioning/01-create-user.png`

---

## 📂 Bulk Import Users via CSV

### Step 3: Prepare a CSV File  

Create a CSV file named `bulk-users.csv` with headers and sample users:

```csv
User principal name,Display name,First name,Last name,Job title,Department
alex.johnson@contoso.com,Alex Johnson,Alex,Johnson,IT Support,IT
mary.lopez@contoso.com,Mary Lopez,Mary,Lopez,Finance Analyst,Finance
```

### Step 4: Import the CSV

- In the Entra admin center, navigate to:
**Users** →**Bulk Operations** → **Bulk Create**
- Upload your bulk-users.csv file
- Click Submit to begin the import
> 🧠 Tip: After the import completes, check the Bulk Operation Results tab to verify the upload or download an error report if needed.

📸 Screenshot Example:
/entra/screenshots/user-and-group-provisioning/02-bulk-upload.png

---

## 🧑‍🤝‍🧑 Create Groups

### Step 5: Create a New Group
- Navigate to **Groups** → **All Groups** → **+ New group**
- Choose:
  - Group type: Security or Microsoft 365
  - Group name: Finance Team
  - Membership type: Assigned
- Click **Create**

📸 Screenshot Example:
/entra/screenshots/user-and-group-provisioning/03-create-group.png

### Step 6: Add Members
- Open the created group →** Members** → **+ Add members**
- Search and add Jane Doe, Mary Lopez
- Click **Select** → **Save**

📸 Screenshot Example:
/entra/screenshots/user-and-group-provisioning/04-add-members.png

## 🧾 Assign Licenses

### Step 7: Assign Licenses to Individual Users
- Navigate to Users → select a user → Licenses → + Assignments
- Choose available licenses (e.g., Microsoft 365 E5) → click Save

📸 Screenshot Example:
/entra/screenshots/user-and-group-provisioning/05-assign-license.png

### Step 8: Assign Licenses to a Group

🧠 Note: Group-based licensing requires Entra ID P1 or P2.

- Navigate to Groups → select a group → Licenses → + Assignments
- Choose the license and services to include → Save
- All members automatically receive assigned licenses.

📸 Screenshot Example:
/entra/screenshots/user-and-group-provisioning/06-group-license.png

---

## ⚡ Create Dynamic Groups

### Step 9: Create a Dynamic Group
- Navigate to Groups → + New group
- Select:
  - Group type: Security or Microsoft 365
  - Membership type: Dynamic User
  - Name: IT Department (Dynamic)
- Under Dynamic rule, click Add dynamic query
  - Example rule:
  - (user.department -eq "IT")
- Click **Save** → **Create**

📸 Screenshot Example:
/entra/screenshots/user-and-group-provisioning/07-dynamic-group.png

### Step 10: Verify Membership

- Once the rule processes, users with Department = IT automatically appear in the group
- Check Members (Preview) or Dynamic Membership Rules to validate results

📸 Screenshot Example:
/entra/screenshots/user-and-group-provisioning/08-verify-dynamic.png

---

## 💻 Manage Users & Groups with PowerShell

### Step 11: Install and Connect Microsoft Graph Module
- Install the Microsoft Graph PowerShell module: ```Install-Module Microsoft.Graph -Scope CurrentUser```
  - This downloads the module that lets you manage Entra ID (Azure AD) users, groups, and licenses from PowerShell
  - ```Scope CurrentUser``` installs it for your user account only, so you don’t need admin rights
- Connect to Microsoft Graph: ```Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All"```
  - This authenticates your session with your tenant so you can run commands like ```New-MgUser``` and ```New-MgGroup```
  - You’ll be prompted to log in with a Global Admin or User Admin account
- Once you run both commands, your PowerShell session is ready to manage users, groups, licenses, and dynamic rules

### Step 12: Create a New User via PowerShell
- Open Powershell and run:
```
New-MgUser -AccountEnabled $true -DisplayName "John Adams" `
-UserPrincipalName "john.adams@contoso.com" -MailNickname "john.adams" `
-PasswordProfile @{forceChangePasswordNextSignIn=$true; password="P@ssw0rd123"}
```

### Step 13: Create a Group via PowerShell
- Open Powershell and run:
```
New-MgGroup -DisplayName "Sales Team" -MailEnabled:$false -MailNickname "salesteam" `
-SecurityEnabled:$true
```

📸 Screenshot Example:
/entra/screenshots/user-and-group-provisioning/09-powershell.png

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
