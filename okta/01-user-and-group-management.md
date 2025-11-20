# 👤 User & Group Management  

⬅️ [Back to Okta IAM Lab Overview](./README.md)

This walkthrough covers how to create and manage users and groups in **Okta Identity Cloud**. You’ll create accounts manually, add custom attributes, assign roles, configure group rules for automated membership, and manage users and groups via the Okta Admin Console.

---

## 📚 What This Lab Covers

- Creating users manually in the Okta Admin Console  
- Adding and editing custom user attributes  
- Creating groups and assigning users  
- Creating group rules to automate membership  
- Assigning standard administrator roles to groups  
- Creating custom roles and resource sets and assigning them to groups  
- **Performing user account maintenance (unlock, suspend, reset password, etc.)**  
- Managing users and groups with Okta Workflows (optional advanced step)  

---

## 📝 What You’ll Need

- 🔹 Okta Developer or Enterprise Org  
- 🔹 Administrator privileges (Super Admin or equivalent)  
- 🔹 Browser (incognito recommended)  
- 🔹 Optional: Okta Workflows access  

---

## 👥 Create Users Manually

### Step 1: Open Okta Admin Console
- Go to your Okta Org URL (e.g., https://dev-123456.okta.com)  
- Navigate to **Directory → People → Add Person**

### Step 2: Add a New User
- Fill in required fields:  
  - First Name / Last Name  
  - Username / Email  
  - Password (auto-generate or manual)  
  - (Optional) Assign Groups or Roles  
- Click **Save**

> 🏷️ **Note:** Replace email domains with your org’s verified domain.

### Step 3: Activate Now vs Activate Later
- **Activate Now:** Sends activation email immediately  
- **Activate Later:** Pre-stages account without sending email  

📸 Example Screenshots  
`![User creation form](./screenshots/01-add-user.png)`  
`![User creation confirmation](./screenshots/02-user-created.png)`

---

## 🧩 Add and Edit Custom Attributes

### Step 1: Open Profile Editor
- Directory → **Profile Editor**  
- Select **User (Okta)** → **Add Attribute**

### Step 2: Configure Attribute
- Example:  
  - Name: `EmployeeID`  
  - Type: `String`

### Step 3: Edit a User Profile
- Directory → People → Select User → **Profile → Edit**  
- Update new attribute → Save

📸 Example Screenshots  
`![Add custom attribute](./screenshots/03-add-attribute.png)`  
`![Edit user profile](./screenshots/04-edit-user.png)`

---

## 🧑‍🤝‍🧑 Create Groups

### Step 1: Create a New Group
- Directory → Groups → **Add Group**  
- Example:  
  - Name: `Finance Team`  
  - Description: `Finance department members`

### Step 2: Add Members
- Select the group → **Manage People → Add Members**  
- Select users → Save

📸 Example Screenshots  
`![Group creation](./screenshots/05-group-created.png)`  
`![Add members to group](./screenshots/06-add-members.png)`

---

## ⚡ Create Group Rules

### Step 1: Create a Rule
- Directory → Groups → **Rules → Add Rule**  
- Name: `Finance Dept Auto Assignment`  
- Condition: `If user.department equals "Finance"`  
- Assign to group: `Finance Team`

### Step 2: Verify Rule
- Directory → Groups → [Group] → **Members**  
- Confirm auto-membership

📸 Example Screenshots  
`![Group rule created](./screenshots/07-rule-created.png)`  
`![Updated membership](./screenshots/08-rule-members.png)`

---

## 🔐 Assign Roles to Groups

### Step 1: Assign Standard Admin Role
- Directory → Groups → Select Group → **Roles**  
- Assign role such as **Help Desk Admin**

### Step 2: Create Custom Role & Resource Set
- Security → Administrators → **Add Administrator**  
- Create custom role → Create resource set → Assign to group

📸 Example Screenshots  
`![Custom role creation](./screenshots/09-custom-role.png)`  
`![Assign role to group](./screenshots/10-role-assignment.png)`

---

# 🔧 User Account Maintenance Tasks  

These tasks are essential for daily user lifecycle administration.

---

## 🔓 Unlock User Accounts

### Unlock an Individual User
1. Directory → People  
2. Select a user  
3. Click **Unlock**

### Unlock Multiple Users
1. Directory → People  
2. **More Actions → Unlock Users**  
3. Filter by **Locked Out**  
4. Select users → **Unlock Selected Users**

---

## 🚫 Suspend & Unsuspend Users

### Suspend a User
1. Directory → People  
2. Select user  
3. **More Actions → Suspend**

### Unsuspend a User
1. Open the suspended user  
2. Click **Unsuspend**

---

## 🔐 Reset Passwords

### Reset an Individual Password
1. Directory → People  
2. Select user  
3. Click **Reset Password**  
4. Choose “Send Email” or “Set Manually”

### Reset Multiple Passwords
1. Directory → People  
2. **More Actions → Reset Passwords**  
3. Select users → Confirm

---

## ⏳ Manage Password Expiry

### Force Password Expiration
1. Directory → People → Select user  
2. **More Actions → Expire Password**

### Check Password Age
- Open the user → **Security** / **Authentication** tab  

---

## 🧭 View User Account Status

Common statuses:

| Status | Meaning |
|--------|---------|
| **Active** | User can log in normally |
| **Password Reset** | User must change password |
| **Staged** | Account created but not activated |
| **Pending Activation** | Activation email sent |
| **Locked Out** | Too many failed sign-ins |
| **Suspended** | Admin temporarily disabled access |
| **Deactivated** | Fully disabled |

To view status:  
**Directory → People → Status column** or open user.

---

## 💻 Optional: Manage Users & Groups with Okta Workflows

- Workflows → Console  
- Create automation for onboarding/offboarding, attribute updates, or group assignment  
- Test workflows using a test user  

📸 Example Screenshots  
`![Workflow creation](./screenshots/11-workflow.png)`  
`![Workflow testing](./screenshots/12-workflow-testing.png)`

---

## ✅ Expected Behavior

- Users appear correctly in the directory  
- Groups reflect assigned and automated membership  
- Roles (standard & custom) apply correctly  
- User account maintenance tasks work as expected  
- Optional workflows trigger and execute successfully  

---

## 🔄 Optional Enhancements

- Enable self-service group management  
- Automate user provisioning via SCIM  
- Use Okta APIs for automation and integrations  
- Apply MFA or app policies based on group membership  

---

## 🔗 Next Steps

You’ve successfully completed core user and group management in Okta.  
Next, configure **SAML & OIDC** application integrations.

➡️ Continue to: [Application Integrations (SAML/OIDC)](./app-integrations.md)
