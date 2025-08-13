# 🛡️ LAPS Installation and Configuration Guide

⬅️ [Back to Active Directory (On-Prem) Lab Overview](./README.md)

This walkthrough shows how to install Microsoft Local Administrator Password Solution (LAPS), deploy the necessary Group Policy ADMX templates, and configure a GPO to securely manage local administrator passwords across domain-joined machines.

---

## 📚 What This Lab Covers

- Installing LAPS management tools and client software  
- Deploying LAPS ADMX and ADML policy templates to the Central Store  
- Creating and configuring a Group Policy Object (GPO) for LAPS  
- Verifying LAPS password management functionality  

---

## 📝 What You’ll Need

🔹 Domain Controller (Windows Server 2016 or later recommended)  
🔹 Domain-joined Windows 10/11 client machine(s)  
🔹 Administrative privileges on your AD environment  
🔹 Downloaded LAPS MSI installer (Microsoft Download Center)  
🔹 Downloaded Windows Security Compliance Toolkit (for LAPS ADMX files)  

---

## 🛠️ Install LAPS Software

### Step 1: Install LAPS MSI

- Download the latest LAPS installer from Microsoft:  
  https://www.microsoft.com/en-us/download/details.aspx?id=46899  
- Run the MSI on your Domain Controller and management workstation(s)  
- Select to install:  
  - Management Tools (AdmPwd.UI)  
  - Group Policy Client Side Extension (CSE)  

---

## 📂 Deploy ADMX Templates

### Step 2: Extract LAPS ADMX Files

- Download and extract the Windows Security Compliance Toolkit from:  
  https://learn.microsoft.com/en-us/windows/security/threat-protection/security-compliance-toolkit-10  
- Locate `AdmPwd.admx` and the corresponding language folder (e.g., `en-US`) inside the extracted folders  

### Step 3: Copy ADMX Files to Central Store

- Copy `AdmPwd.admx` to your Central Store folder:
```
\\<YourDomain>\SYSVOL\<YourDomain>\Policies\PolicyDefinitions\
```
- Copy the language `.adml` file (e.g., `AdmPwd.adml`) to:
```
\\<YourDomain>\SYSVOL\<YourDomain>\Policies\PolicyDefinitions\en-US\
```

---

## ⚙️ Configure Group Policy for LAPS

### Step 4: Create and Edit GPO for Domain Controllers

- Open **Group Policy Management Console (GPMC)**
- Create a new GPO named:

```Computer – Password Management – Domain Controllers``` 

- Configure settings:
  - **Enable local admin password management** → Enabled
  - **Password Settings** → Define password complexity, length, and expiration

---

## ✅ Verify LAPS Functionality

### Step 5: Confirm Password Rotation
- Wait for Group Policy to refresh on domain-joined machines (or run `gpupdate /force`)
- Use LAPS management UI or PowerShell to view managed local admin passwords
- Example PowerShell command:
```
- Get-AdmPwdPassword -ComputerName <ComputerName>
```
- Confirm passwords are randomly generated, stored securely in AD, and rotate per policy

---

## 🔗 Next Steps

After successful installation and configuration, continue to harden Active Directory by managing privileged accounts and audit policies.

➡️ [Continue to: Active Directory Security Hardening](./active-directory-security-hardening.md)






























