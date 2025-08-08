# 👥 User and Group Management

⬅️ [Back to Active Directory (On-Prem) Lab Overview](./README.md)

This walkthrough focuses on managing users and groups in Windows Server Active Directory. You’ll learn how to perform core lifecycle tasks such as creating, modifying, disabling, and deleting users, as well as managing group scope, type, and membership using ADUC and PowerShell.

---

## 📚 What This Lab Covers

- Creating and modifying user accounts  
- Disabling and deleting users  
- Creating and managing security groups  
- Understanding group scope (Global, Domain Local, Universal) and type (Security vs. Distribution)  
- Managing group membership (including nesting)  
- Delegating group management permissions  

---

## 📝 What You’ll Need

🔹Windows Server 2019 (or later) with AD DS and ADUC installed

🔹Windows 10/11 client (domain-joined)

🔹Active Directory domain set up (e.g., `corp.lab`)

🔹PowerShell (on the domain controller or client with RSAT)

---

## 👤 Create and Manage User Accounts

### Step 1: Create a New User in ADUC

- Open **Active Directory Users and Computers (ADUC)**
- Navigate to the desired Organizational Unit (OU)
- Right-click the OU → **New → User**   
- Fill in:
   - First Name: John  
   - Last Name: Doe  
   - User logon name: `jdoe`  
- Set an initial password  
- Uncheck **User must change password at next logon** for testing (optional)  
- Click **Finish**

📸 *Screenshot: ADUC – New User Wizard*

### Step 2: Modify User Properties

- Right-click the user → **Properties**
- Update the following:
   - **Organization** tab: Department, Job Title, Company
   - **Account** tab: Logon hours, Account expiration
- Click **Apply** → **OK**

📸 *Screenshot: ADUC – User Properties*

### Step 3: Disable or Delete a User

- To **disable**:
   - Right-click the user → **Disable Account**
- To **delete**:
   - Right-click the user → **Delete** → **Confirm**

📸 *Screenshot: ADUC – Disable User*

### Step 4: PowerShell – Create a User (Optional)

- Launch **powershell** and be sure to **Run as administrator**
- Run:

```markdown
New-ADUser -Name "Jane Doe" -GivenName "Jane" -Surname "Doe" `
  -SamAccountName "jdoe" -UserPrincipalName "jdoe@corp.lab" `
  -AccountPassword (ConvertTo-SecureString "P@ssw0rd123" -AsPlainText -Force) `
  -Enabled $true -Path "OU=Users,DC=corp,DC=lab"
```
- If you would like the user to change password at next logon, you can add at the end of script: 
```
-ChangePasswordAtLogon $true
```
- example:
```
New-ADUser -Name "Jane Doe" -GivenName "Jane" -Surname "Doe" `
  -SamAccountName "jdoe" -UserPrincipalName "jdoe@corp.lab" `
  -AccountPassword (ConvertTo-SecureString "P@ssw0rd123" -AsPlainText -Force) `
  -Enabled $true -Path "OU=Users,DC=corp,DC=lab" `
  -ChangePasswordAtLogon $true
```
> 📒 If you're unsure about the path to the OU, run: `Get-ADOrganizationalUnit -Filter 'Name -like "IT"' | Select-Object Name, DistinguishedName`

📸 Screenshot: PowerShell – New-ADUser

---

# 👥 Create and Manage Groups

### Step 5: Create a Security Group in ADUC

- Open ADUC
- Right-click an OU → **New** → **Group**
- Set:
   - Group name: `IT-Support`
   - Group scope: **Global**
   - Group type: **Security**
- Click **OK**

📸 Screenshot: ADUC – Create New Group

### Step 6: Group Scope and Type Reference

| Scope         | Use Case                             | Available To              |
|---------------|--------------------------------------|---------------------------|
| Global        | Assign permissions in any domain     | Users in same domain      |
| Domain Local  | Assign permissions in same domain only | Users from any domain     |
| Universal     | Cross-domain access & nesting        | Any user/group            |

- **Security Groups**: Used for access control and permissions
- **Distribution Groups**: Only for email (Exchange environments)

📸 Screenshot: ADUC – Group Properties

### Step 7: Add or Remove Group Members

- To add members:
   - Right-click group → **Properties**
   - Go to **Members** tab → Click **Add**
   - Enter user names (e.g., jdoe) → **Apply** → Click **OK**
- To remove members:
   - Select user → Click **Remove** → **Apply** → Click **OK**

📸 Screenshot: ADUC – Add Group Members

### Step 8: Nested Groups (Group Within Group)

- Create a second group (e.g., All-IT)
- Add `IT-Support` group as a member of All-IT
- Right-click **All-IT** → **Properties** → **Members** → **Add** → Add **IT-Support**

- 📸 Screenshot: ADUC – Nested Group Example

### Step 9: PowerShell – Create and Add to Group

- Open Powershell and **Run as administrator**
- Run: 
```
New-ADGroup -Name "HR-Team" -GroupScope Global -GroupCategory Security -Path "OU=Groups,DC=corp,DC=lab"

Add-ADGroupMember -Identity "HR-Team" -Members "jdoe"
```

📸 Screenshot: PowerShell – Group Management

---

# 🧩 Optional: Bulk Provisioning with PowerShell

If you want to create hundreds or even thousands of users automatically from a text file, check out the Bulk User Provisioning (Advanced) section ➡️ [Powershell for AD Management](powershell-for-ad-management.md)

---

## 🔄 Real-World Scenario Examples

### Scenario A: IT New Hire – John Doe

- Create user jdoe in the IT OU
- Add jdoe to IT-Support group
- Add IT-Support to All-IT (nested)
- Use security groups to assign folder or application permissions via Group Policy

📸 Screenshot: User Added to Group

### Scenario B: Offboarding – Contractor Removal

- Disable user account for jsmith
- Remove from all groups (optional)
- Move to a "Disabled Users" OU
- Optionally delete after 30 days

📸 Screenshot: Disabled User OU

---

## 🔐 Delegate Group Management (Optional)
> 📝 Delegation is covered more in next section [Delegation and Access Control](delegation-and-access-control.md)

- Right-click the OU or group → **Delegate Control**
- Select user or group (e.g., HRAdmin)
- Choose:
   - **Manage group membership**
   - **Reset passwords** (if needed)

📸 Screenshot: ADUC – Delegation Wizard

---

## ✅ Expected Behavior

- Users and groups are visible in ADUC
- Membership changes reflect immediately
- Group nesting applies permissions transitively
- Disabled accounts cannot log in
- Delegated users can manage group members

---

## 🔄 Optional Enhancements

- Automate onboarding with PowerShell scripts
- Apply Group Policy to security groups
- Audit group membership changes with Event Viewer or third-party tools
- Combine with your hybrid lab for synced users (covered in [hybrid-identity.md](../entra/hybrid-identity.md)
























