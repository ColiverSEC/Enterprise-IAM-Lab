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
- Managing users and groups with Okta Workflows (optional advanced step)  

---

## 📝 What You’ll Need

- 🔹 Okta Developer or Enterprise Org  
- 🔹 Administrator privileges (Super Admin or equivalent)  
- 🔹 Browser (incognito recommended for testing)  
- 🔹 Optional: Okta Workflows access for lifecycle automation  

---

## 👥 Create Users Manually

### Step 1: Open Okta Admin Console
- Go to your Okta Org URL (e.g., [https://dev-123456.okta.com](https://dev-123456.okta.com))  
- Navigate to **Directory → People → Add Person**

### Step 2: Add a New User
- Fill in the required fields:  
  - First Name / Last Name  
  - Username / Email  
  - Password (auto-generate or set manually)  
  - (Optional) Assign Groups or Roles  
- Click **Save**

> 🏷️ **Note:**  
> Replace email domains with your organization’s verified domain when following these steps.

### Step 3: Activate Now vs Activate Later
When creating a new user, Okta provides an option to **Activate Now** or **Activate Later**:

- **Activate Now:**  
  - Sends an activation email to the user immediately.  
  - The user can sign in right away and complete the setup (password reset if required).  
- **Activate Later:**  
  - Creates the account but does **not send an activation email**.  
  - Useful if you want to **pre-stage accounts** before giving users access.  
  - Admins can manually activate the user later from the user profile.

> 💡 **Tip:**  
> Use **Activate Later** for bulk imports or staged onboarding, and **Activate Now** for immediate access for individual users.

📸 **Screenshot Example:**  
`![User creation form](./screenshots/01-add-user.png)`  
`![User creation confirmation](./screenshots/02-user-created.png)`

---

## 🧩 Add and Edit Custom Attributes

### Step 1: Open Profile Editor
- Navigate to **Directory → Profile Editor**  
- Select **User (Okta)** profile  
- Click **Add Attribute**  

### Step 2: Configure Attribute
- Name: `EmployeeID`  
- Data type: `String`  
- Click **Save Attribute**  

### Step 3: Edit User Profile
- Navigate to **Directory → People**  
- Select a user → **Profile** → **Edit**  
- Update the newly added attribute and any other profile fields  
- Click **Save**

📸 **Screenshot Example:**  
`![Add custom attribute](./screenshots/03-add-attribute.png)`  
`![Edit user profile](./screenshots/04-edit-user.png)`

---

## 🧑‍🤝‍🧑 Create Groups

### Step 1: Create a New Group
- Navigate to **Directory → Groups → Add Group**  
- Name: `Finance Team`  
- Description: `Finance department members`  
- Click **Add Group**

### Step 2: Add Members
- Open the created group → **Manage People → Add Members**  
- Select users to add (e.g., Alex Johnson, Mary Lopez)  
- Click **Save**

📸 **Screenshot Example:**  
`![Group creation](./screenshots/05-group-created.png)`  
`![Add members to group](./screenshots/06-add-members.png)`

---

## ⚡ Create Group Rules

### Step 1: Create Rule
- Navigate to **Directory → Groups → Rules → Add Rule**  
- Name: `Finance Dept Auto Assignment`  
- Conditions: `If user.department equals Finance`  
- Assign to group: `Finance Team`  
- Click **Create Rule**

### Step 2: Verify Rule
- Navigate to **Directory → Groups → [Group Name] → Members**  
- Confirm that eligible users were automatically added

📸 **Screenshot Example:**  
`![Group rule created](./screenshots/07-rule-created.png)`  
`![Updated membership](./screenshots/08-rule-members.png)`

---

## 🔐 Assign Roles to Groups

### Step 1: Assign Standard Admin Role
- Navigate to **Directory → Groups → [Group Name] → Roles**  
- Assign a standard role (e.g., **Help Desk Admin**)  
- Click **Save**

### Step 2: Create Custom Role and Resource Set
- Navigate to **Security → Administrators → Add Administrator**  
- Create a **Custom Role** (define permissions)  
- Assign it to a **Resource Set**  
- Link the role to your group  

📸 **Screenshot Example:**  
`![Custom role creation](./screenshots/09-custom-role.png)`  
`![Assign role to group](./screenshots/10-role-assignment.png)`

---

## 💻 Optional: Manage Users & Groups with Okta Workflows

- Navigate to **Workflows → Console**  
- Create a workflow to automate user onboarding/offboarding, update attributes, or assign groups  
- Test by triggering workflow actions on a test user  

📸 **Screenshot Example:**  
`![Workflow creation](./screenshots/11-workflow.png)`  
`![Workflow testing](./screenshots/12-workflow-testing.png)`

---

## ✅ Expected Behavior

- Users appear correctly in the Okta directory  
- Groups reflect assigned and rule-based memberships  
- Roles (standard and custom) are correctly applied  
- Optional workflows execute as expected  

---

## 🔄 Optional Enhancements

- Enable **self-service group management**  
- Automate user onboarding with **SCIM connectors**  
- Set up **Okta APIs** for programmatic user and group management  
- Configure **group-based MFA or app assignment policies**

---

## 🔗 Next Steps

You’ve successfully provisioned users and groups in Okta.  
Next, you’ll configure **application integrations using SAML & OIDC** to enable SSO and automated provisioning.

➡️ Continue to: [Application Integrations (SAML/OIDC)](./app-integrations.md)

