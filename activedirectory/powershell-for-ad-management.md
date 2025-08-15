# 💻 PowerShell for AD Management

⬅️ [Back to Active Directory (On-Prem) Lab Overview](./README.md)

This walkthrough focuses on automating routine Active Directory (AD) management tasks using PowerShell. You’ll learn how to use common AD cmdlets and scripts to manage users, groups, and organizational units efficiently, saving time and reducing manual errors.

---

## 📚 What This Lab Covers

- Introduction to the Active Directory module for PowerShell
- Querying AD objects (users, groups, OUs)
- Creating, modifying, and removing AD objects
- Managing group membership
- Bulk operations with CSV or TXT files
- PowerShell best practices for AD management
- Verifying changes using both PowerShell and GUI tools

---

## 📝 What You’ll Need

🔹 Windows Server 2019 (or later) with AD DS installed

🔹 Windows 10/11 client (domain-joined) with RSAT tools installed

🔹 Active Directory domain set up (e.g., corp.lab)

🔹 PowerShell (5.1+ or PowerShell 7) with ActiveDirectory module
> 💡 *Tip: Run Import-Module ActiveDirectory to ensure the module is loaded before starting*

---

## 📖 Understanding PowerShell for AD Management (Concepts)

- **AD Module Cmdlets**: PowerShell provides cmdlets like Get-ADUser, New-ADUser, Set-ADUser, and Remove-ADUser for AD object management
- **Automation**: Tasks like bulk user creation, group membership updates, and OU queries can be fully automated
- **Scripting vs GUI**: Scripts reduce human error, ensure consistency, and allow repeatable processes
- **Permissions:** You must have sufficient AD permissions to perform these operations; running as a delegated admin or domain admin is common in labs

---

## ⚠️ Common Pitfalls to Avoid

- **Wrong scope**: Modifying the wrong OU or group can create problems,always verify the path
- **Forgetting replication**: Changes in AD might take time to replicate; verify across DCs if needed
- **Syntax errors**: PowerShell is case-insensitive but strict about cmdlet parameters. Use Get-Help <cmdlet> to confirm usage\
- **Bulk operations without testing**: Always test scripts with a small subset before applying domain-wide changes

---

## 👤 Querying AD Objects

**Step 1: Get Users**
```
# Get all users in the domain
Get-ADUser -Filter * 

# Get a specific user
Get-ADUser -Identity jdoe -Properties DisplayName, EmailAddress
```

📸 **Screenshot**: PowerShell – Get-ADUser

### Step 2: Get Groups and Membership

```# Get all groups
Get-ADGroup -Filter *

# Get members of a specific group
Get-ADGroupMember -Identity "HRAdmins"
```
- **Identity**: Specifies the target group

📸 **Screenshot**: PowerShell – Get-ADGroupMember

---

## 🔧 Creating and Modifying AD Objects

### Step 3: Create a New User

```
New-ADUser -Name "John Doe" -GivenName "John" -Surname "Doe" `
-DisplayName "John Doe" -SamAccountName "jdoe" `
-UserPrincipalName "jdoe@corp.lab" -AccountPassword (ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force) `
-Enabled $true -Path "OU=Sales,DC=corp,DC=lab"
```
**Explanation of Parameters:**
- **Name**: Full name of the account
- **GivenName** / Surname: First and last names
- **DisplayName**: Name displayed in AD and email address book
- **SamAccountName**: Legacy logon name
- **UserPrincipalName**: Modern logon format (email-style)
- **AccountPassword**: Initial password (secure string)
- **Enabled**: Account status (True = active)
- **Path**: Target OU in AD

### Step 4: Modify User Attributes
```
Set-ADUser -Identity jdoe -Title "Sales Representative" -Department "Sales"
```
- **Identity**: Specifies the user to modify
- **Title / -Department**: Updates job-related attributes

### Step 5: Remove a User

```
Remove-ADUser -Identity jdoe
```
- **Identity**: Specifies the user to delete

📸 **Screenshot**: PowerShell – User Creation/Modification

---

## 👥 Managing Groups

### Step 6: Add or Remove Users from a Group

```
# Add user to group
Add-ADGroupMember -Identity "SalesAdmins" -Members jdoe

# Remove user from group
Remove-ADGroupMember -Identity "SalesAdmins" -Members jdoe -Confirm:$false
```
- **Identity**: Target group
- **Members**: User(s) to add/remove
- **Confirm:$false**: Suppresses confirmation prompts

---

## 📊 Bulk Operations with CSV or TXT Files

### Step 7: Create Multiple Users
```
# CSV format: FirstName,LastName,SamAccountName,OU
Import-Csv "C:\Temp\NewUsers.csv" | ForEach-Object {
    New-ADUser -Name "$($_.FirstName) $($_.LastName)" `
    -GivenName $_.FirstName -Surname $_.LastName `
    -SamAccountName $_.SamAccountName -UserPrincipalName "$($_.SamAccountName)@corp.lab" `
    -AccountPassword (ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force) `
    -Enabled $true -Path $_.OU
}
```
### Step 8: Create Multiple Users via TXT (Optional / Bulk Script)
```
# ----- Edit these Variables for your own Use Case ----- #
$PASSWORD_FOR_USERS   = "Password1"
$USER_FIRST_LAST_LIST = Get-Content .\names.txt
# ------------------------------------------------------ #

$password = ConvertTo-SecureString $PASSWORD_FOR_USERS -AsPlainText -Force
New-ADOrganizationalUnit -Name _USERS -ProtectedFromAccidentalDeletion $false

foreach ($n in $USER_FIRST_LAST_LIST) {
    $first = $n.Split(" ")[0].ToLower()
    $last = $n.Split(" ")[1].ToLower()
    $username = "$($first.Substring(0,1))$($last)".ToLower()
    $UPN = "$username@corp.lab"

    Write-Host "Creating user: $($username)" -BackgroundColor Black -ForegroundColor Cyan
    
    New-AdUser -AccountPassword $password `
               -GivenName $first `
               -Surname $last `
               -DisplayName "$first $last" `
               -Name $username `
               -UserPrincipalName $UPN `
               -EmployeeID $username `
               -PasswordNeverExpires $true `
               -Path "OU=_USERS,DC=corp,DC=lab" `
               -Enabled $true
}
```
**Explanation:**
- `names.txt` contains one user per line in the format: **FirstName LastName**
- Generates a **SamAccountName** from the first initial + last name
- Automatically constructs **UserPrincipalName** using domain suffix
- Creates a dedicated *_USERS* OU if it doesn’t exist
- Sets passwords, enables accounts, and ensures password never expires
> 💡 *Tip: This TXT-based approach is ideal for creating hundreds or thousands of users quickly. You can adjust `$PASSWORD_FOR_USERS` or OU path to fit your environment.*
> 
> 📒 *Note:* The full list of 1,000 user names is in [`names.txt`](./scripts/names.txt) for reference.

---

## 🔄 Verify Changes

### Step 9: Confirm User Creation
```
Get-ADUser -Filter * -SearchBase "OU=Sales,DC=corp,DC=lab" | Select-Object Name, SamAccountName
```
- **SearchBase:** Limits search to specific OU
- **Select-Object:** Displays only chosen properties

📸 **Screenshot**: PowerShell – Verification

---

## 🧩 Optional: Automate Reporting
- Export AD users to a CSV for auditing or reporting:
```
Get-ADUser -Filter * -Properties DisplayName, EmailAddress, Department | 
Select-Object DisplayName, EmailAddress, Department | 
Export-Csv "C:\Temp\ADUsersReport.csv" -NoTypeInformation
```
- Exports user data to CSV for auditing or reporting

---

## 🔄 Real-World Scenario Example

**Scenario**: A new sales cohort joins the company

- Bulk-create 20 new users in `OU=Sales,DC=corp,DC=lab` from a CSV
- Assign them to `SalesAdmins` group
- Verify creation and group membership

📸 **Screenshot**: Bulk User Creation

---

## ✅ Expected Behavior

- Users and groups can be created, modified, or removed via PowerShell
- Bulk operations work with CSV input for efficiency
- Changes reflect immediately in AD (replication may delay for multi-DC environments)
- Auditing scripts provide verification and reporting

--- 

## 🔄 Optional Enhancements
- Schedule PowerShell scripts via Task Scheduler for routine automation
- Combine with logging to maintain an audit trail
- Integrate with Active Directory Administrative Center (ADAC) for hybrid GUI/script workflows
- Use TXT-based scripts for large-scale bulk user creation
