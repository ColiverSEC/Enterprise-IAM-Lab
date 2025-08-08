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

---

## 📝 What You’ll Need

🔹 Windows Server 2019 (or later) with AD DS and ADUC installed
🔹 Windows 10/11 client (domain-joined)
🔹 Active Directory domain set up (e.g., corp.lab)
🔹 PowerShell (on the domain controller or client with RSAT)

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



 
