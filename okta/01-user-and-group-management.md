# 👤 User & Group Management  

⬅️ [Back to Okta IAM Lab Overview](./README.md)

This walkthrough covers how to create and manage users and groups in **Okta Identity Cloud**. You’ll create accounts manually, import users, add custom attributes, manage lifecycle actions, assign roles, configure group rules, and perform account maintenance tasks in the Okta Admin Console.

---

## 📚 What This Lab Covers

- Creating users manually in the Okta Admin Console  
- Importing users  
  - From CSV  
  - From applications (SCIM / app integrations)  
- Adding and editing custom user attributes  
- Creating groups and assigning users  
- Creating group rules for automated membership  
- Assigning standard or custom admin roles  
- Performing user account maintenance (unlock, suspend, reset password, etc.)  
- Signing users out of devices  
- Managing users and groups with Okta Workflows (optional advanced step)  

---

## 📝 What You’ll Need

🔹 Okta Developer or Enterprise Org  
🔹 Administrator privileges (Super Admin or equivalent)  
🔹 Browser (incognito recommended)  
🔹 Optional: Okta Workflows access  

---

# 👥 Create Users Manually

### Step 1: Open Okta Admin Console
- Go to your Okta Org URL (e.g., `https://dev-123456.okta.com`)  
- Navigate to **Directory → People → Add Person**

### Step 2: Add a New User
- Enter required fields:  
  - First Name / Last Name  
  - Username / Email  
  - Password (auto-generated or manual)  
  - (Optional) Group or Role assignment  
- Click **Save**

> 🏷️ **Note:** Replace example emails with your org-verified domain.

### Step 3: Activate Now vs Activate Later
- **Activate Now:** Sends activation email immediately  
- **Activate Later:** Pre-stages user (no email sent)  

📸 Example Screenshots:  
`![User creation form](./screenshots/01-add-user.png)`  
`![User creation confirmation](./screenshots/02-user-created.png)`

---

# 📥 Import Users

## Import Users from a CSV File

### Step 1: Download Okta CSV Template
- **Directory** → **People** → **More Actions → Import Users from CSV**  
- Click **this template** to download sample CSV

### Step 2: Populate the File
- Common fields include:  
  - `login`  
  - `firstName`  
  - `lastName`  
  - `email`
  - `displayName`  
  - (Optional) Custom attributes

### Step 3: Upload CSV
- Upload completed CSV → **Next**
- Choose to:
  - Automatically active new users
  - Do not create a password and only allow login via Identity Provider
- Click **Import Users**

### Step 4: Review & Confirm
- Confirm field matching  
- Apply changes  

📸 Example Screenshots:  
`![User creation form](./screenshots/01-add-user.png)`  
`![User creation confirmation](./screenshots/02-user-created.png)`

---

# 🧩 Add and Edit Custom Attributes

### Step 1: Open Profile Editor
- Navigate to **Directory → Profile Editor**  
- Select the profile you want to modify (usually **User (Okta)**)  
- Click **Add Attribute**

### Step 2: Define the Attribute
- When creating a new attribute:  
  - Name: `EmployeeID` (or any custom name you prefer)  
  - Data Type: `String, Number, Boolean`, etc.  
  - Description (Optional): Brief description of what this attribute stores  
  - User Permission / Visibility: Determine if this field is editable by users or admins only  
- Click **Save Attribute** when done  

💡 **Tip:** Avoid using spaces or special characters in attribute names. Keep them lowercase and readable.

### Step 3: Assign the Attribute to a User Profile
- Navigate to **Directory → People**  
- Select the user you want to update  
- Click **Profile → Edit**  
- Locate the new attribute in the profile  
- Enter a value (e.g., `12345` for `EmployeeID`)  
- Click **Save**  

🏷️ **Note:** The attribute will now appear in profile exports, SCIM provisioning, and group rules if applicable.

📸 Example Screenshots:  
`![Add custom attribute](./screenshots/03-add-attribute.png)`  
`![Edit user profile](./screenshots/04-edit-user.png)`

### Step 4: Optional – Use Attribute in Rules or Workflows
- Once created, custom attributes can be used in:  
  - **Group rules** – auto-assign users to groups based on `EmployeeID`, `department`, or other custom attributes  
  - **Okta Workflows** – automate provisioning, notifications, or other actions triggered by attribute changes  

### Step 5: Test the Custom Attribute (Optional Demo)
1. Create or select a test user in Okta.  
2. Edit the profile and enter a value for the new attribute (e.g., `EmployeeID = 12345`).  
3. Save the changes.  
4. Verify the attribute is visible in:  
   - The user profile  
   - Directory exports  
   - Any group rules or workflows that might use it  

💡 **Tip:** Use a workflow to trigger actions when the attribute changes to see automation in action.  

📸 Example Demo Screenshots:  
`![Attribute updated](./screenshots/attribute-demo.png)`  
`![Attribute in group rule](./screenshots/attribute-group-rule.png)`


---

# 🧑‍🤝‍🧑 Create Groups

### Step 1: Create a Group
- Directory → Groups → **Add Group**  
- Example:  
  - Name: `Finance Team`  
  - Description: `Finance department members`

### Step 2: Add Members
- Group → **Manage People → Add Members → Save**  

📸 Example Screenshots:  
`![Group creation](./screenshots/05-group-created.png)`  
`![Add members to group](./screenshots/06-add-members.png)`

---

# ⚡ Create Group Rules

### Step 1: Create Rule
- Directory → Groups → **Rules → Add Rule**  
- Name: `Finance Dept Auto Assignment`  
- Condition: `user.department == "Finance"`  
- Assign to: `Finance Team`  

### Step 2: Verify Membership
- Directory → Groups → **[Group] → Members**

📸 Example Screenshots:  
`![Group rule created](./screenshots/07-rule-created.png)`  
`![Updated membership](./screenshots/08-rule-members.png)`

---

# 🔐 Assign Roles to Groups

### Step 1: Assign Standard Role
- Directory → Groups → Select group → **Roles**  
- Examples:  
  - Help Desk Admin  
  - Read-Only Admin  

### Step 2: Create Custom Role & Resource Set
- Security → Administrators → **Add Administrator**  
- Create custom role  
- Define permissions  
- Create resource set  
- Assign to group  

📸 Example Screenshots:  
`![Custom role creation](./screenshots/09-custom-role.png)`  
`![Assign role to group](./screenshots/10-role-assignment.png)`

---

# 🔧 User Account Maintenance Tasks

These tasks are essential for daily user lifecycle administration.

---

## 🔓 Unlock User Accounts

### Unlock an Individual User
- Directory → People → Select user → **Unlock**

### Unlock Multiple Users
- Directory → People → **More Actions → Unlock Users**  
- Filter by **Locked Out**  
- Select users → **Unlock Selected Users**

---

## 🚫 Suspend & Unsuspend Users

### Suspend a User
- Directory → People → Select user → **More Actions → Suspend**

### Unsuspend a User
- Directory → People → Select user → **Unsuspend**

---

## 🔐 Reset Passwords

### Reset a Single User Password
- Directory → People → Select user → **Reset Password**

### Reset Multiple Passwords
- Directory → People → **More Actions → Reset Passwords**  
- Select users → Confirm

---

## ⏳ Manage Password Expiry

### Force Password Expiration
- Directory → People → Select user → **More Actions → Expire Password**

### Check Password Age
- Open user → **Security** tab

---

## 🧭 View User Account Status

| Status | Meaning |
|--------|---------|
| **Active** | User can sign in |
| **Staged** | Created but not active |
| **Pending Activation** | Activation email sent |
| **Recovery / Password Reset** | User must change password |
| **Locked Out** | Too many failed sign-ins |
| **Suspended** | Temporarily disabled |
| **Deactivated** | Fully disabled |

- To view: Directory → People → **Status** column  

---

# 📱 Sign Users Out of Devices

### Step 1: Open User
- Directory → People → Select user  

### Step 2: View Active Sessions
- User profile → **Sessions** tab  

### Step 3: Sign Out
- Click:  
  - **End Session** (single session)  
  - **End All Sessions** (force logout everywhere)  

Useful for:  
- Lost/stolen devices  
- Security incidents  
- Break-glass events  

---

# 💻 Optional: Manage Users & Groups with Okta Workflows

- Workflows → Console  
- Automate onboarding/offboarding, attribute updates, group assignments  
- Scheduled tasks or event-driven flows  

📸 Example Screenshots:  
`![Workflow creation](./screenshots/11-workflow.png)`  
`![Workflow testing](./screenshots/12-workflow-testing.png)`

---

# ✅ Expected Behavior

- Users appear correctly in the directory  
- Group rules apply as expected  
- Role assignments work (standard & custom)  
- User imports complete successfully  
- Account maintenance actions function correctly  
- Optional workflows run successfully  

---

# 🔄 Optional Enhancements

- Enable self-service group management  
- Automate provisioning using SCIM  
- Use Okta API or Terraform for automation  
- Apply MFA and policy enforcement by group  

---

# 🔗 Next Steps

You’ve completed user and group management in Okta.  
Next, configure **SAML & OIDC** application integrations.

➡️ Continue to: [Application Integrations (SAML/OIDC)](./app-integrations.md)
