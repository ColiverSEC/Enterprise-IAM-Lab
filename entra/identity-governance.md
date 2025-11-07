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

- Go to **Entra Admin Center → Identity Governance → Entitlement management → Access packages → + New access package**  

### Step 2: Configure Access Package

- Enter a **Name** (e.g., `Finance Project Access`)
- Enter a **Descrition** (e.g.`Provides controlled access to finance-related resources and applications for project members, using Microsoft Entra Identity Governance to manage request, approval, and expiration workflows`)
- Select **Create new catalog** and fill:
  - **Name:** `Finance Project Catalog`
  - **Description:** `Catalog containing finance-related apps and resources for project access management.`
- Set to **Enabled** → **Create**
- Click **Next**
- Define **resources** to include (groups, apps, SharePoint sites) → **Next**
- Configure **request settings**:
  - Who can request access  
  - Approval workflow (single approver or multiple)
- Click **Next**
- Fill in the Requestor information **Question** and **Answer format**
- Click **Review + Create** → **Create**

📸 **Screenshot Example:**  
`/entra/screenshots/identity-governance/01-create-access-package.png`

---

## 📝 Configure Terms of Use

### Step 3: Create Terms of Use Policy

- Navigate to **ID Governance → Entitlement management → Terms of Use → + New terms**  
- **Name your policy (internal use):** `Finance Project Access Policy`  
- **Display name (user-facing):** `Finance Project Access Terms`
- Open Word or a text editor and create a **sample Terms of Use** (short, 1-page lab version) and save as PDF
- Upload **PDF or URL** of your organization’s policy  
- Assign the terms to your **Finance Project Access** package (or other relevant access packages)  
- Require users to **accept before access is granted**  
- For reference on Conditional Access policies, see [CConditional Access Policies](https://github.com/ColiverSEC/Enterprise-IAM-Lab/blob/main/entra/conditional-access.md)

📸 **Screenshot Example:**  
`/entra/screenshots/identity-governance/03-terms-of-use.png`

---

## 🔁 Configure Access Reviews

### Step 4: Create an Access Review

- Go to **Identity Governance → Access Reviews → + New access review**  
- Select **target group or application** → **Next**
- Select reviewers:
  - Could be the user’s manager, the user themselves (self-review), or specific admins
- Set **review frequency** (one-time or recurring) → **Next**
- Configure Additional settings:
  - Decide what happens if reviewers don’t respond (e.g., keep, remove, or take no action on access)
  - Choose what to do when users are denied — typically remove access automatically
  - Enable or disable options like **Justification required*** and **Email notifications** for reviewers
- Once configured, click **Review + Create** 
- Name your review:
  - e.g., `Finance Project Access Review`
- Click **Create** to finalize your access review
- Run review and take action on results (approve/revoke access)  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-governance/04-access-review.png`

---

## 🛡️ Manage Privileged Identity Management (PIM)

### Step 5: Enable PIM for Roles

- Go to **Entra Admin Center → Privileged Identity Management → Azure AD roles**  
- Select a role (e.g., Global Administrator, User Administrator)  
- Enable **eligible assignment** and define activation requirements:
  - MFA required  
  - Just-In-Time (JIT) activation  
  - Time-bound activation  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-governance/05-pim-role.png`

### Step 6: Activate Roles for Testing

- Activate an eligible role as a test user  
- Confirm access is granted and logs are generated  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-governance/06-pim-activation.png`

---

## 🆘 Configure Emergency Access Accounts

### Step 7: Create Break-Glass Accounts

- Create a **dedicated Global Administrator account**  
- Assign **permanent MFA bypass or known secure credentials**  
- Store credentials securely offline  
- Exclude this account from Conditional Access policies  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-governance/07-emergency-account.png`

---

## 📊 Monitor and Report

### Step 8: Review Governance Activity

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

