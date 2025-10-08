# 🎛️ Identity Governance  

⬅️ [Back to Entra ID Lab Overview](./README.md)

This walkthrough covers **Microsoft Entra Identity Governance**, which helps organizations manage user access, ensure compliance, and secure privileged accounts. You’ll implement **access packages**, configure **terms of use**, run **access reviews**, manage **PIM**, and set up **emergency access accounts**.

---

## 📚 What This Lab Covers

- Creating **access packages** for groups and applications  
- Assigning **Terms of Use** to access packages  
- Configuring and executing **access reviews**  
- Managing **Privileged Identity Management (PIM)** roles  
- Setting up **emergency access (break-glass) accounts**  
- Monitoring and reporting governance activities  

---

## 📝 What You’ll Need

🔹 Microsoft Entra ID tenant with **P2 licenses** (required for PIM and access reviews)  
🔹 Global Administrator or Privileged Role Administrator privileges  
🔹 Test users and groups for access packages  
🔹 Azure AD Premium features enabled  

---

## 📦 Create Access Packages

### Step 1: Navigate to Access Packages

- Go to **Entra Admin Center → Identity Governance → Access packages → + New access package**  

### Step 2: Configure Access Package

- Enter a **name** (e.g., `Finance Project Access`)  
- Define **resources** to include (groups, apps, SharePoint sites)  
- Configure **request settings**:
  - Who can request access  
  - Approval workflow (single approver or multiple)  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-governance/01-create-access-package.png`

### Step 3: Assign Users

- Assign test users to request access  
- Approve requests to validate the workflow  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-governance/02-assign-users.png`

---

## 📝 Configure Terms of Use

### Step 4: Create Terms of Use Policy

- Navigate to **Terms of Use → + New policy**  
- Upload **PDF or URL** of your organization’s policy  
- Assign to users or access packages  
- Require users to **accept before access is granted**  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-governance/03-terms-of-use.png`

---

## 🔁 Configure Access Reviews

### Step 5: Create an Access Review

- Go to **Access Reviews → + New access review**  
- Select **target group or application**  
- Define **reviewers** (self, manager, or group owner)  
- Set **review frequency** (one-time or recurring)  
- Run review and take action on results (approve/revoke access)  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-governance/04-access-review.png`

---

## 🛡️ Manage Privileged Identity Management (PIM)

### Step 6: Enable PIM for Roles

- Go to **Entra Admin Center → Privileged Identity Management → Azure AD roles**  
- Select a role (e.g., Global Administrator, User Administrator)  
- Enable **eligible assignment** and define activation requirements:
  - MFA required  
  - Just-In-Time (JIT) activation  
  - Time-bound activation  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-governance/05-pim-role.png`

### Step 7: Activate Roles for Testing

- Activate an eligible role as a test user  
- Confirm access is granted and logs are generated  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-governance/06-pim-activation.png`

---

## 🆘 Configure Emergency Access Accounts

### Step 8: Create Break-Glass Accounts

- Create a **dedicated Global Administrator account**  
- Assign **permanent MFA bypass or known secure credentials**  
- Store credentials securely offline  
- Exclude this account from Conditional Access policies  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-governance/07-emergency-account.png`

---

## 📊 Monitor and Report

### Step 9: Review Governance Activity

- Monitor access package requests, access review outcomes, and PIM activations  
- Navigate to **Reports → Identity Governance → Activity logs**  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-governance/08-monitoring.png`

---

## ✅ Expected Behavior

- Users can request and receive access via access packages  
- Terms of Use are enforced before granting access  
- Access reviews periodically validate user access and revoke where necessary  
- PIM ensures just-in-time access for privileged roles  
- Emergency accounts are available for break-glass scenarios  
- All activities are logged and auditable  

---

## 🔄 Optional Enhancements

- Configure **automatic expiration** for access packages  
- Require **multi-level approvals** for sensitive resources  
- Integrate **Identity Governance reports** with SIEM solutions  
- Automate role activation and access review notifications via **PowerShell or Graph API**  

---

## 🔗 Next Steps

You’ve successfully implemented Identity Governance to manage access, enforce compliance, and secure privileged accounts.  
Next, you’ll review **monitoring and reporting** for Entra ID activities to maintain visibility and auditability.

➡️ [Continue to: Monitoring & Reporting](./monitoring-reporting.md)

