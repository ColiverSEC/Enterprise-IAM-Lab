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

## 🗂️ Create Organizational Units (OUs)

### Step 1: Open Active Directory Users and Computers (ADUC)

- To open **Active Directory Users and Computers** there are a few steps you can take:
  - On the Domain Controller, open **Server Manager** → **Tools** → **Active Directory Users and Computers**
  - **Start** → **Windows Administrative Tools** → **Active Directory Users and Computers**
  - Press **Win + R** and run `dsa.msc`
- Once you're in **Active Directory Users and Computers** expand your domain (e.g., corp.lab)

📸 **Screenshot**:
![AD DS](/activedirectory/screenshots/ou-gpo-management/01active-directory.png)

### Step 2: Create OUs

- Right-click your domain → **New** → **Organizational Unit**
- Create the following OUs:
  - `Workstations`
  - `IT`
  - `HR`
  - `Finance`
  - `Security Groups` *(optional)*

📸 **Screenshots**:
![Create OUs](/activedirectory/screenshots/ou-gpo-management/02ou-creation.png)
![Create OUs](/activedirectory/screenshots/ou-gpo-management/03ous-created.png)

---

## 🛠️ Create and Link GPOs

### Step 3: Open Group Policy Management

- To open **Group Policy Management** there are a few steps you can take: 
  - **Server Manager** → **Tools** → **Group Policy Management**
  - **Start** → **Windows Administrative Tools** → **Group Policy Management**
  - Press **Win + R** and run `gpedit.msc`

📸 **Screenshot**:
![Create OUs](/activedirectory/screenshots/ou-gpo-management/04gpo-management-overview.png)

### Step 4: Create GPOs
- Right-click the appropriate OU → **Create a GPO in this domain, and Link it here** → Right click the created OU → **Edit**
> ### 🏷️ Recommended Naming Convention
> - Use clear, consistent names that reflect:
>   - **The purpose** of the GPO
>   - **The scope** (who or what it's applied to)
>   - **The type** (Computer vs. User)
> - 📌 Format example: `[GPO Type] – [Purpose] – [Target OU or Department]`
> - Examples:
>   - `Computer – Password Policy – Domain`
>   - `User – USB Restrictions – Finance`
>   - `User – Desktop Wallpaper – HR`
> - This naming convention helps with long-term manageability, auditing, and troubleshooting.


- Example policies:
  - **Password Policy GPO** (linked to domain root or `Users` OU)
    - Minimum password length: 12 characters
    - Maximum password age: 45 days
    - Enforce password history: 24
  - **USB Restriction GPO** (linked to `Finance`)
    - Navigate: **User Configuration** → **Policies** → **Administrative Templates** → **System** → **Removable Storage Access**
    - **Deny all access to removable storage** → **Enable** → **Apply**

**📸 Screenshot:**
![GPO Settings](/activedirectory/screenshots/ou-gpo-management/05example-policy.png)

### Step 5: Apply a Desktop Wallpaper GPO (Optional)

- Link to the `HR` OU
- Right-click the `HR` OU → **Create a GPO in this domain, and Link it here**
- Name the GPO something like `User – Desktop Wallpaper – HR`
- Right click the new GPO → **Edit** → **User Configuration** → **Policies** → **Administrative Templates** → **Desktop** → **Desktop**
- Enable: **Desktop Wallpaper**
- Enter path to wallpaper (UNC path or local for testing)
  - Example path: `C:\Windows\Web\Wallpaper\Theme1`

**📸 Screenshot:**
![GPO Settings](/activedirectory/screenshots/ou-gpo-management/06hr-wallpaper.png)

---

## 🔁 Force Group Policy Update on Clients

### Step 6: Force GPO on Windows 10 Client

- Log into your Windows 10 VM with a domain account
- Open Command Prompt and run:

```powershell
gpupdate /force
```
> 🧠 Important:
>
> - If your GPO contains **User Configuration** settings (e.g., desktop wallpaper, logon scripts):
>   - Log into the client VM **as a domain user** who is located in the target OU
>   - Then run `gpupdate /force` under that user session
> - If your GPO contains **Computer Configuration** settings (e.g., USB restrictions, password policy):
>   - Just boot or log into the computer itself (joined to the domain and in the correct OU), then run `gpupdate /force`
>
> 📌 Group Policy settings only apply when the **object type (user or computer)** resides in the OU the GPO is linked to.


**📸 Screenshot:**
![Gpupdate](/activedirectory/screenshots/ou-gpo-management/06hr-wallpaper.png)

### Step 7: Verify GPO Application

- Method 1: Check Resultant Set of Policy (RSOP)
  - Run `rsop.msc` on client
  - Expand **Computer Configuration** and **User Configuration**
  - Confirm GPO settings applied

- Method 2: Use gpresult:
  - Open **Command Prompt** and run `gpresult /r`
  - Shows which GPOs are applied to the machine/user
 
- Method 3: Functional Test:
  - Try to use USB (if blocked by policy)
  - Confirm password change prompt meets policy
  - Check for applied desktop wallpaper

📸 Screenshots: GPO application, gpresult output

---

### ✅ Expected Behavior
- GPOs apply based on OU structure
- USB is blocked only for Finance users
- Password policy is enforced domain-wide
- RSOP reflects correct GPO links

---

### 🔄 Optional Enhancements

- Create a logon script and apply via GPO
- Use security filtering to apply GPO to specific users or groups
- Delegate OU permissions to junior IT admins using ADUC

---

### 🔗 Next Steps

You've now built a logical OU structure and enforced security policies using GPOs — a cornerstone of centralized identity governance in enterprise environments.
Next, you'll manage **users and groups** to simulate employee lifecycle tasks, control access with group-based security models, and prepare for delegated administration.

➡️ [Continue to: User and Group Management](./user-and-group-management.md
)
