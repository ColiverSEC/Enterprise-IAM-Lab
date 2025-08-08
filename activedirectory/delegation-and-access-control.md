# 🛡️ Delegation and Access Control

⬅️ [Back to Active Directory (On-Prem) Lab Overview](./README.md)

This walkthrough focuses on delegating administrative roles and securely managing permissions across Organizational Units (OUs) in Windows Server Active Directory. You’ll learn how to delegate control using the Delegation of Control Wizard and manually assign permissions to empower specific users or groups with the least privileges necessary to manage resources within OUs.

---

## 📚 What This Lab Covers
- Understanding delegation and the principle of least privilege
- Using the Delegation of Control Wizard
- Manually assigning custom permissions on OUs
- Delegating password reset and user management tasks
- Best practices for secure delegation
- Verifying delegated permissions
- Understanding how delegation works behind the scenes (permissions, inheritance, ACEs in ACLs)

---

## 📝 What You’ll Need

🔹 Windows Server 2019 (or later) with AD DS and ADUC installed

🔹 Windows 10/11 client (domain-joined)

🔹 Active Directory domain set up (e.g., corp.lab)

🔹 PowerShell (on the domain controller or client with RSAT)

---

## 📖 Understanding How Delegation Works (Concepts)
Before delegating, it’s important to understand what happens under the hood:
- **Delegation in AD** works by adding Access Control Entries (ACEs) to an object’s Access Control List (ACL)
- The **Delegation of Control Wizard** modifies these ACLs for the selected OU, granting the specified rights to a user or group
- Permissions can be **inherited** by child objects if **Apply to descendant objects** is selected when configuring permissions
- **Least Privilege Principle**: Always grant only the rights needed for the specific OU or task to avoid unintended access
> 💡 *Tip: You can review an OU’s ACL in the “Advanced Security Settings” window to see exactly what’s applied*

---

## ⚠️ Common Pitfalls to Avoid
When delegating, keep these in mind:
- **Too broad scope**: Make sure you are delegating at the OU level you intend, not higher
- **Over-inheritance**: Leaving **Apply to all descendant objects** enabled may give rights to objects you didn’t intend
- **No testing**: Always log in as the delegated account to confirm only the intended tasks can be performed
- **Wrong group**: Double-check you’re delegating to the correct security group to avoid accidental access.

---

## 👤 Delegate Control Using the Wizard

### Step 1: Open ADUC and Start Delegation Wizard
- Open **Active Directory Users and Computers (ADUC)**
- Navigate to the OU you want to delegate control on (e.g., `OU=Sales,DC=corp,DC=lab`)
- Right-click the OU → **Delegate Control**...

📸 Screenshot: ADUC – Right-click OU → Delegate Control

### Step 2: Add User or Group to Delegate
- Click Next on the welcome screen
- Click **Add**
- Enter the user or group to delegate permissions to (e.g., `SalesAdmins`)
- Click **OK**, then **Next**

📸 Screenshot: Delegation Wizard – Add User/Group

### Step 3: Choose Tasks to Delegate

- Select from common tasks such as:
  - Reset user passwords and force password change at next logon
  - Create, delete, and manage user accounts
  - Read all user information
- Or choose Create a custom task to delegate for fine-grained control
- Click **Next** → **Finish**

📸 Screenshot: Delegation Wizard – Task Selection

---

## 🔧 Manually Assign Custom Permissions (Optional)

### Step 4: Open OU Properties Security Tab
- Right-click the OU → **Properties**
- Go to the **Security** tab → **Advanced**
- Click **Add** → Select the user or group to delegate (e.g., `SalesAdmins`)

📸 Screenshot: OU Properties – Security Tab

### Step 5: Configure Permissions
- Select specific permissions like:
  - Create/delete user objects
  - Reset passwords
  - Read/write user attributes
- Enable or disable **Apply to** targets (this object only, descendant objects, etc.)
- Click **OK** → **Apply** → **OK**

 📸 Screenshot: Advanced Security Settings – Permission Entry

 --- 

 ## 🔍 Verify Delegated Permissions

 ### Step 6: Use Effective Permissions Tool
 - Right-click the OU → **Properties** → **Security** tab
 - Click **Advanced** → **Effective Access** tab
 - Add delegated user or group → **View effective access**
 - Confirm expected permissions are granted

📸 Screenshot: Effective Permissions Tab

---

## 🧩 Optional: Delegate Password Reset via PowerShell

- Launch PowerShell as admin and run:
```
$acl = Get-Acl "AD:\OU=Sales,DC=corp,DC=lab"
$identity = "corp\SalesAdmins"
$rule = New-Object System.DirectoryServices.ActiveDirectoryAccessRule($identity,
    "ResetPassword,ChangePassword", "Allow")
$acl.AddAccessRule($rule)
Set-Acl -AclObject $acl -Path "AD:\OU=Sales,DC=corp,DC=lab"
```

---

## 🛠️ Delegate Group Policy Object (GPO) Management *(Optional but Recommended)*

Delegating OU control does not automatically give permission to edit GPOs linked to that OU — you must delegate this separately in GPMC.

- Open the **Group Policy Management Console** (gpmc.msc)
- In the left pane, expand your domain and select the **OU** where you want to delegate GPO management.
- In the right pane, click the **Delegation** tab
- Click **Add**
- In the **Enter the object names to select** box, type the **user** or **group** you want to delegate to, then click **OK**
- In the **Permissions** drop-down, choose the desired level (e.g., **Edit settings**, **Delete**,**Modify security**)
- Click **OK** to apply the changes

📸 Screenshot: GPO Delegation Tab

---

## 🔄 Real-World Scenario Example

**Scenario**: Delegate the HR team to manage users only in the HR OU, including password resets and creating new user accounts.
- Delegate control on `OU=HR,DC=corp,DC=lab` to the `HRAdmins` group
- Verify HRAdmins can only manage users inside HR OU, no domain-wide rights

📸 Screenshot: HRAdmins delegated on HR OU

---

## ✅ Expected Behavior

- Delegated users/groups can perform only the assigned tasks on the target OU
- Permissions do not extend beyond the delegated OU unless explicitly assigned
- Least privilege is enforced to reduce security risks
- Delegation changes are immediately effective after replication

---

## 🔄 Optional Enhancements
- Audit delegated permissions and changes via event logs or third-party tools
- Delegate control of Group Policy Objects (GPOs) linked to OUs
- Automate delegation setup with PowerShell scripts for consistency



 
