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

## 🔐 Configure Privileged Identity Management (PIM) — Microsoft Entra Roles

> Goal: delegate privileged roles as **eligible** assignments (just-in-time elevation) with approval, MFA, and time limits.

### 1. Open PIM
- Go to **Microsoft Entra Admin Center → Identity Governance → Privileged Identity Management (PIM)**.
- Choose **Microsoft Entra roles**.

### 2. Review PIM sections (overview)
- Use the left pane: **Overview, Roles, Assignments, Alerts, Access reviews, Discovery & insights**.
- In the main area you may see quick actions: **Assign, Activate, Approve, Audit** — these are the common actions PIM supports.

### 3. Add a role assignment (use **Assign**)
1. Click **Roles** → find the built-in role you want to delegate (e.g., **User Administrator**, **Groups Administrator**, **Global Administrator**).  
2. Click the role → click **Add assignment** (or **Assign**) in the role blade.  
3. Choose **Select assignment type**:
   - **Eligible** — recommended: user must **activate** the role when needed (JIT).  
   - **Active** — user gets the role immediately (full time). Use sparingly.
4. Choose the **member(s)** (user or group) to assign.
5. Set **Assignment settings**:
   - **Start / End date** (time-bound recommended)
   - **Require multi-factor authentication (MFA)** on activation
   - **Require approval to activate** (toggle on if you want approvers to review requests)
   - **Require justification** (user must enter a reason when activating)
   - **Ticketing or requestable reason** (optional: link an ITSM ticket number)
6. Configure **Approvers** if approval is required (user, group, or role).
7. Click **Assign** to create the eligible/active assignment.

### 4. Test activation (user flow)
- As the assigned user, go to **https://myapps.microsoft.com** or **Entra Admin Center → My roles**.
- Select the role and click **Activate**.
- Provide **justification**, complete **MFA**, and (if configured) wait for **approval**.
- After activation, the user has the role for the configured duration.

### 5. Configure periodic governance
- **Access reviews**: create an access review for the role to periodically validate assignments.
  - Entra → Identity Governance → Access reviews → + New review → target the role or the AU/group
- **Alerts & Notifications**: enable PIM alerts (risky activations, expired assignments, etc.)
- **Audit / Review logs**: use **Audit** or **Activity logs** to track assignments/activations/approvals.

### 6. Discovery & Insights (optional)
- Run **Discovery** to find privileged accounts and roles in your tenant — useful before large PIM rollouts.

---

## 🆘 Configure Emergency Access Accounts

### Step 7: Create Break-Glass (Emergency) Administrator Accounts

> 💡 **Purpose:**  
> Emergency access accounts (also called “break-glass” accounts) provide a secure way to regain administrative access to your tenant if normal accounts are locked out due to MFA, Conditional Access, or outages.

1. **Create a Dedicated Global Administrator Account**  
   - Go to **Microsoft Entra ID → Users → + New user**  
   - **Name:** `BreakGlassAdmin01`  
   - **Username:** `breakglassadmin01@yourdomain.onmicrosoft.com`  
   - Assign the **Global Administrator** role  

2. **Set a Strong, Long-Lived Password**  
   - Use a complex, unique password that doesn’t expire automatically  
   - Store the password securely (e.g., in a sealed envelope or offline password vault)

3. **Exclude from Conditional Access Policies**  
   - Navigate to **Entra → Protection → Conditional Access → Policies**  
   - Edit each policy enforcing MFA or access restrictions  
   - Under **Assignments → Exclude → Users and groups**, add the break-glass account  

4. **(Optional) Configure Monitoring**  
   - Enable **sign-in log alerts** for the account using **Microsoft Sentinel**, **Defender for Cloud Apps**, or **Log Analytics**  
   - Alert the security team whenever a break-glass account signs in  

5. **Store Credentials Securely Offline**  
   - Keep the credentials in a secure physical location (e.g., safe or locked cabinet)  
   - Document access procedures and authorization rules  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-governance/07-emergency-account.png`

---

## 📊 Monitor and Report

### Step 8: Review Governance Activity

> 💡 **Purpose:**  
> Monitoring ensures that access is being requested, approved, and revoked correctly. It also helps detect unusual activity or misconfigurations in your Identity Governance setup.

1. **Monitor Access Packages**  
   - Go to **Entra Admin Center → Identity Governance → Access packages → Requests**  
   - Review pending, approved, and rejected requests  

2. **Review Access Reviews**  
   - Navigate to **Entra Admin Center → Identity Governance → Access reviews**  
   - Check completed and ongoing reviews for compliance and anomalies  
   - Note which users were removed or retained  

3. **Audit PIM Activities**  
   - Go to **Entra Admin Center → Identity Governance → Privileged Identity Management → Audit logs**  
   - Monitor role activations, approvals, and expirations  

4. **Activity Logs Overview**  
   - Navigate to **Reports → Identity Governance → Activity logs**  
   - Filter by date, user, or application to analyze trends and verify proper access management  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-governance/08-monitoring.png`

> 💡 **Tip:** Schedule regular reviews of these logs to ensure governance policies are followed and to detect any unusual activity early.

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

