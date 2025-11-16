# 🏁 Initial Tenant Configuration & Roles  

⬅️ [Back to Entra ID Lab Overview](./README.md)

This walkthrough covers how to set up your Microsoft Entra ID tenant for the first time. You’ll configure tenant branding, add custom domains, assign roles, and review tenant-wide settings — laying the foundation for secure identity management.

---

## 📚 What This Lab Covers

- Configuring tenant branding (organization name, logos, and colors)
- Adding and verifying a custom domain (e.g., `contoso.com`)
- Assigning and managing permissions using Role-Based Access Control (RBAC)
- Assigning built-in roles (Global Admin, User Admin, etc.)
- Creating and assigning custom roles
- Delegating admin access using Privileged Identity Management (PIM)
- Reviewing tenant-wide settings (security defaults, collaboration, and monitoring)

---

## 📝 What You’ll Need

🔹 **Entra ID tenant** (trial or sandbox)  
🔹 **Global Administrator** privileges  
🔹 Access to **DNS management** for domain verification  
🔹 *(Optional)* **Microsoft Entra ID P1/P2** license for role delegation or PIM

---

## ⚙️ Configure Tenant Branding

### Step 1: Open Microsoft Entra Admin Center
- Go to [https://entra.microsoft.com](https://entra.microsoft.com)  
- Sign in with a **Global Administrator** or **Company Branding Administrator** account 
- In the **left-hand menu**, click **Entra ID**  
- Scroll to the **bottom** and select **Custom branding** (just above **Identity Protection**)

### Step 2: Choose Branding Type
- In the **Getting Started** tab, you’ll see:  
  - **Default sign-in experience** → Click **Edit** to customize your default branding  
  - **Customize by browser language** → Click **Add browser language** to create language-specific branding

### Step 3: Customize Your Branding
- After clicking **Customize**, you’ll see **six tabs**:  
  - **Basics** – Set your **Favicon**, **Background image**, and **Page background color**
  - **Layout** – Configure layout using **Template**, **Header**, **Footer** and **Custom CSS**
  - **Header** – Edit **header text** and **logo placement**
  - **Footer** – Add **footer text**, **links**, or **privacy/legal information**
  - **Sign-in form** – Customize **Banner logo**, placeholders, and other form elements
  - **Review** – Preview all changes and confirm before saving 
- Click **Save** to apply your branding  
- Preview your sign-in page to verify the updates

📸 **Basics Tab**  
![Custom Branding Basics Tab](/entra/screenshots/01-initial-tenant-configuration-roles/01-basics-tab.png)

📸 **Layout Tab With Custom CSS Applied**  
![Custom Branding Layout Tab](/entra/screenshots/01-initial-tenant-configuration-roles/02-layout-tab.png)

📸 **Header Tab** 
![Custom Branding Header Tab](/entra/screenshots/01-initial-tenant-configuration-roles/03-header-tab.png)

📸 **Sign-in Form** 
![Custom Branding Sign-in Tab](/entra/screenshots/01-initial-tenant-configuration-roles/04-sign-in-form.png)

📸 **Review Tab** 
![Custom Branding Review Tab](/entra/screenshots/01-initial-tenant-configuration-roles/05-review-tab.png)

📸 **Custom CSS Login Experience** 
![Custom CSS Preview](/entra/screenshots/01-initial-tenant-configuration-roles/06-custom-css-preview.png)
![Custom CSS Sign-in Preview](/entra/screenshots/01-initial-tenant-configuration-roles/07-custom-css-sign-in.png)

---

## 🌐 Add and Verify a Custom Domain

### Step 1: Add or Confirm a Custom Domain

- Navigate to **Entra ID** → **Domain names**
- If you **already have a verified custom domain** (e.g., `contoso.com`), you can skip the add/verify steps and move on to the next section  
- If not, follow these steps:
  - Click **+ Add custom domain**
  - Enter your domain name (e.g., `contoso.com`) → **Add domain**
  
📸 **Verfied Custom Domain Names** 
![Custom Domains Verified Domains](/entra/screenshots/01-initial-tenant-configuration-roles/08-verified-domain.png)
![Verified Domain Records](/entra/screenshots/01-initial-tenant-configuration-roles/09-verified-domain.png)

### Step 2: Verify the Domain (if new)
- Copy the **TXT record** provided by Microsoft  
- Add the record to your domain registrar’s DNS settings  
- Return to the portal → click **Verify**  

💡 **Tip:**  
> If your domain is already verified, you can simply confirm it’s set as the **primary domain** for new users under:  
**Microsoft Entra ID → Domain names → [Your Domain] → Set as primary**

📸 **Example of TXT Records to Configure in Domain Registrar**  
![Custom Domain DNS Records](/entra/screenshots/01-initial-tenant-configuration-roles/10-new-custom-domain-records-to-add-in-registrars-dns-settings.png)

---

## 👤 Assign Built-In Admin Roles

> - 💡 **Quick Note: What is RBAC?**
> - Microsoft Entra uses Role-Based Access Control (RBAC) to delegate admin permissions using roles instead of direct permissions
> - In this section, you'll work with these roles to assign and manage admin access

### Step 1: Review Built-In Roles  
- Navigate to **Microsoft Entra ID** → **Roles and Administrators**  
- Review key roles such as:
  - **Global Administrator**
  - **User Administrator**
  - **Groups Administrator**
  - **Authentication Administrator**

📸 **Microsofts Built-in Roles** 
![Review Built-in Roles](/entra/screenshots/01-initial-tenant-configuration-roles/11-review-built-in-roles.png)

### Step 2 : Assign a Role to group or user  
- Select a role → **Add assignments** → **Select Members** → **Select** → **Next** → **Assign**
- Verify role assignment under **Active Assignments**

💡 **Tip:**
> Before assigning a role you can choose to either assign as eligible or active
> - Eligible role assignment means a user can activate the role for a limited time when needed
> - Active role assignment means the user has the permissions of that role at all times

📸 **Examples of Users Assigned and Confirmed in Group**  
![Role Assignment Selection](/entra/screenshots/01-initial-tenant-configuration-roles/12-role-assignment-selection.png)
![Role Assignment Verified](/entra/screenshots/01-initial-tenant-configuration-roles/13-verify-role-assignment.png)

---

## 🧱 Create Administrative Units (Scoped Delegation)

### Step 1: Create an Administrative Unit  
- Navigate to **Entra ID → Roles & admins → Admin units → + Add**  
- Enter a **name** (e.g., `Finance Department AU`) and an optional description  
- Click **Create**

📸 **Example of the Create Admin Units Properties Page** 
![Create Admin Unit](/entra/screenshots/01-initial-tenant-configuration-roles/14-create-admin-unit.png)

### Step 2: Add Members  
- Open your new Administrative Unit:
  - **Users → + Add members** To add users
  - **Groups → + New group** to create new group for au
  - **Groups → + Add** to add an existing group to au
- Select the **users or groups** belonging to that department or team  
- Click **Add**

📸 **Example of Group Being Added to Admin Unit** 
![Add Memebers to Admin Unit](/entra/screenshots/01-initial-tenant-configuration-roles/15-add-members-or-groups.png)

### Step 3: Assign Scoped Roles  
- Inside your AU, go to **Roles and administrators
- Choose a role (e.g., `User Administrator` or `Groups Administrator`)  
- Assign it to a **department lead** or **delegated admin**  
- Click **Assign**

📸 **Example of Scope Role Being Assigned to User** 
![Assign Role Scope](/entra/screenshots/01-initial-tenant-configuration-roles/16-assign-role-scope.png)

### Step 4: Verify Scoped Permissions  
- Sign in as the delegated admin you assigned earlier  
- Confirm that they can **only manage users within their Administrative Unit**

💡 **Tip:**  
> Administrative Units help separate management duties between departments (Finance, HR, IT) and reduce risk by scoping administrative privileges 

---

## 🧩 Create and Assign Custom Roles

### Create a Custom Role *(Optional – Requires P1/P2 License)*  
- Navigate to **Microsoft Entra ID** → **Roles and Administrators** → **+ New custom role**
- Define:
  - **Name:** `Helpdesk - Password Reset`
  - **Description** `This custom role grants delegated permissions to helpdesk or support personnel to manage basic user account password operations without granting full administrative privileges.`
  - **Permissions:** `microsoft.directory/users/passwordPolicies/update`
- **Next** → **Create**

💡 **Tip:**  
> When creating a new custom role, you can **Start from scratch** or **clone an existing custom role**  
> - Cloning an existing custom role is recommended if you want to reuse or slightly modify a role you've already configured  
> - Starting from scratch is best when you need a completely new permission set tailored to a different function

📸 **Example of Custom Role Being Created and Being Confirmed in the *All Roles* Section**  
![Custom Role Review](/entra/screenshots/01-initial-tenant-configuration-roles/17-custom-role-review.png)
![Custom Role Confirmed](/entra/screenshots/01-initial-tenant-configuration-roles/18-custom-role-confirmed.png)

---
 
## 🔒 Delegate Admin Access with PIM *(Optional)*

### Enable Privileged Identity Management 
- In the **left-hand menu**, select **Identity Governance** → **Privileged Identity Management (PIM)**
- In the PIM navigation pane on the left, click **Microsoft Entra roles** 
- From here you can:
  - View all **eligible**, **active**, and **expired** role assignments  
  - Configure **role settings** (activation duration, MFA requirement, approval workflow, justification, etc.)
  - Assign users as **eligible** for specific roles (e.g., Global Administrator, User Administrator)
- Use **Assignments** → **+ Add assignments** to make a user eligible for a role 
- Optionally, configure **notifications** and **access reviews** under **Settings**

> 📒 **Note:**
> - This section provides a quick overview of PIM.
> - For a full, in-depth walkthrough—including access reviews, approval workflows, and governance settings—see the [Identity Governance module](https://github.com/ColiverSEC/Enterprise-IAM-Lab/blob/main/entra/identity-governance.md)

---

## ⚙️ Review Tenant-Wide Settings

### Step 1: Review Security Defaults  
- Navigate to **Microsoft Entra ID** → **Overview** → **Properties** → **Manage Security Defaults**
- Choose to:
  - Keep **Security Defaults** enabled, or  
  - Disable and replace them later with **Conditional Access** (covered in a later module)

📸 **Security Defaults Being Enabled** 
![Enable Security Defaults](/entra/screenshots/01-initial-tenant-configuration-roles/19-enable-security-defaults.png)

### Step 2: Review External Collaboration Settings  
- Navigate to **External Identities** → **External Collaboration Settings**
- Review:
  - **Guest invitation permissions**
  - **Collaboration restrictions**
  - **Guest access expiration**

📸 **External Collab Settings**  
![External Collab Settings](/entra/screenshots/01-initial-tenant-configuration-roles/20-external-collab-settings.png)

---

## ✅ Expected Behavior

- Tenant branding is visible on the login page  
- Custom domain verified and available for new user creation  
- Built-in and custom roles properly delegated  
- *(Optional)* PIM configured for just-in-time admin elevation  
- Security defaults and collaboration settings reviewed and documented

---

## 🔄 Optional Enhancements

- Add custom **Terms of Use** for external users  
- Enable **Access Reviews** for admin roles  
- Create a **break-glass emergency account** (Global Admin)  
- Customize sign-in experiences for different regions or brands

---

## 🔗 Next Steps

Your tenant is now configured with secure foundations for Entra ID.  
Next, you’ll create and manage **users and groups**, assign licenses, and set up dynamic memberships.

➡️ [Continue to: User & Group Provisioning](./user-and-group-provisioning.md)

