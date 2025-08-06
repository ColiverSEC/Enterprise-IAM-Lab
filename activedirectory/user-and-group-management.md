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

🔹 Windows Server 2019 (or later) with AD DS and ADUC installed
🔹 Windows 10/11 client (domain-joined)
🔹 Active Directory domain set up (e.g., `corp.lab`)
🔹 PowerShell (on the domain controller or client with RSAT)

---

## 👤 Create and Manage User Accounts

### Step 1: Create a New User
- 1. Open **Active Directory Users and Computers (ADUC)**  
2. Navigate to the desired Organizational Unit (OU)  
3. Right-click the OU → **New → User**  
4. Fill in:
   - First Name: John  
   - Last Name: Doe  
   - User logon name: `jdoe`  
5. Set an initial password  
6. Uncheck “User must change password at next logon” for testing (optional)  
7. Click **Finish**
