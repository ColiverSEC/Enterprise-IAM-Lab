# 🗃️ OU and GPO Management  

⬅️ [Back to Active Directory (On-Prem) Lab Overview](./README.md)

This walkthrough shows how to create Organizational Units (OUs) and apply Group Policy Objects (GPOs) to manage Windows clients in an Active Directory environment. OUs help organize domain objects, and GPOs enforce security settings, compliance policies, and configurations across users and computers.

---

## 📚 What This Lab Covers

- Creating a structured OU hierarchy (e.g., IT, HR, Finance)
- Creating and linking GPOs to specific OUs
- Configuring common GPO settings (password policy, USB restrictions, wallpaper)
- Forcing Group Policy updates on domain-joined clients
- Verifying GPO application on a Windows 10 VM

## 📝 What You’ll Need

🔹 Windows Server 2019 VM with AD DS and GPMC installed  
🔹 Windows 10 domain-joined VM (same internal network)  
🔹 Working DNS and domain join configuration

🗂️ Create Organizational Units (OUs)
Step 1: Open Active Directory Users and Computers (ADUC)
- On the Domain Controller, open **Server Manager** → **Tools** → **Active Directory Users and Computers**
- Expand your domain (e.g., corp.lab)

Step 2: Create OUs
- Right-click your domain → New → Organizational Unit
- Create the following OUs:
  - `Workstations`
  - `IT`
  - `HR`
  - `Finance`
  - `Security Groups` *(optional)*
📸 Screenshot: OU hierarchy in ADUC

🛠️ Create and Link GPOs
Step 3: Open Group Policy Management
- Server Manager → Tools → Group Policy Management

Step 4: Create GPOs
- Right-click the appropriate OU → "Create a GPO in this domain, and Link it here"

Examples:
- **Password Policy GPO** (linked to domain root or `Users` OU)
  - Minimum password length: 12 characters
  - Maximum password age: 45 days
  - Enforce password history: 24
- **USB Restriction GPO** (linked to `Finance`)
  - Navigate: `Computer Configuration` → `Policies` → `Administrative Templates` → `System` → `Removable Storage Access`
  - Deny all access to removable storage

📸 Screenshot: GPO editor showing policy settings

Step 5: Apply a Desktop Wallpaper GPO (Optional)
- Link to the `HR` OU
- Navigate: `User Configuration` → `Administrative Templates` → `Desktop` → `Desktop`
- Enable: **Desktop Wallpaper**
- Enter path to wallpaper (UNC path or local for testing)

📸 Screenshot: Desktop wallpaper policy

🔁 Force Group Policy Update on Clients
Step 6: Force GPO on Windows 10 Client
- Log into your Windows 10 VM with a domain account
- Open Command Prompt and run:

```powershell
gpupdate /force

