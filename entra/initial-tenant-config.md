# 🏁 Initial Tenant Configuration & Roles  

⬅️ [Back to Entra ID Lab Overview](./README.md)

This walkthrough covers how to set up your Microsoft Entra ID tenant for the first time. You’ll configure tenant branding, add custom domains, assign roles, and review tenant-wide settings — laying the foundation for secure identity management.

---

## 📚 What This Lab Covers

- Configuring tenant branding (organization name, logos, and colors)
- Adding and verifying a custom domain (e.g., `contoso.com`)
- Assigning built-in roles (Global Admin, User Admin, etc.)
- Creating and assigning custom roles
- Delegating admin access using Privileged Identity Management (PIM)
- Reviewing tenant-wide settings (security defaults, collaboration, and monitoring)

---

## 📝 What You’ll Need

🔹 **Microsoft Entra ID tenant** (trial or sandbox)  
🔹 **Global Administrator** privileges  
🔹 Access to **DNS management** for domain verification  
🔹 *(Optional)* **Microsoft Entra ID P1/P2** license for role delegation or PIM

---

## ⚙️ Configure Tenant Branding

### Step 1: Open Microsoft Entra Admin Center
- Go to [https://entra.microsoft.com](https://entra.microsoft.com)  
- Sign in with a **Global Administrator** or **Company Branding Administrator** account.  
- In the **left-hand menu**, click **Microsoft Entra ID**.  
- Scroll to the **bottom** and select **Custom branding** (just above **Identity Protection**).

### Step 2: Choose Branding Type
- In the **Getting Started** tab, you’ll see:  
  - **Default sign-in experience** → Click **Customize** to edit your default branding.  
  - **Customize by browser language** → Click **Add browser language** to create language-specific branding.

### Step 3: Customize Your Branding
- After clicking **Customize**, you’ll see **six tabs**:  
  - **Basics** – Set your **organization name**, **support contact info**, and **banner logo**.
  - **Layout** – Configure **background image**, **page layout**, and **accent colors**.
  - **Header** – Edit **header text** and optional **logo placement**.
  - **Footer** – Add **footer text**, **links**, or **privacy/legal information**.
  - **Sign-in form** – Customize **sign-in page text**, placeholders, and other form elements.
  - **Review** – Preview all changes and confirm before saving.  
- Click **Save** to apply your branding.  
- Preview your sign-in page to verify the updates.

📸 **Screenshot Example:**  
`/entra/screenshots/initial-tenant-config/01branding.png`

---

## 🌐 Add and Verify a Custom Domain

### Step 4: Add or Confirm a Custom Domain

- Navigate to **Microsoft Entra ID** → **Domain names**.  
- If you **already have a verified custom domain** (e.g., `contoso.com`), you can skip the add/verify steps and move on to the next section.  
- If not, follow these steps:
  - Click **+ Add custom domain**.
  - Enter your domain name (e.g., `contoso.com`) → **Add domain**.

### Step 5: Verify the Domain (if new)
- Copy the **TXT record** provided by Microsoft.  
- Add the record to your domain registrar’s DNS settings.  
- Return to the portal → click **Verify**.  

💡 **Tip:**  
> If your domain is already verified, you can simply confirm it’s set as the **primary domain** for new users under:  
**Microsoft Entra ID → Domain names → [Your Domain] → Set as primary.**

📸 **Screenshot Example:**  
`/entra/screenshots/initial-tenant-config/02domain-verify.png`

---

## 👤 Assign Built-In Admin Roles

### Step 5: Review Built-In Roles  
- Navigate to **Microsoft Entra ID** → **Roles and Administrators**  
- Review key roles such as:
  - **Global Administrator**
  - **User Administrator**
  - **Groups Administrator**
  - **Authentication Administrator**

### Step 6: Assign a Role  
- Select a role → **Add assignments** → choose a user → **Add**  
- Verify role assignment under **Active Assignments**

📸 **Screenshot Example:**  
`/entra/screenshots/initial-tenant-config/03assign-roles.png`

---

## 🧩 Create and Assign Custom Roles

### Step 7: Create a Custom Role *(Optional – Requires P1/P2 License)*  
- Navigate to **Microsoft Entra ID** → **Roles and Administrators** → **+ New custom role**
- Define:
  - **Name:** `Helpdesk - Password Reset`
  - **Permissions:** `microsoft.directory/users/password/reset`
- Save and assign the role to your helpdesk users.

📸 **Screenshot Example:**  
`/entra/screenshots/initial-tenant-config/04custom-role.png`

---

## 🔒 Delegate Admin Access with PIM *(Optional)*

### Step 8: Enable Privileged Identity Management  
- Go to **Identity Governance** → **Privileged Identity Management (PIM)**  
- Activate **Microsoft Entra roles**  
- Configure **eligible assignments** and **approval workflows** for high-privilege roles

📸 **Screenshot Example:**  
`/entra/screenshots/initial-tenant-config/05pim-eligible.png`

---

## ⚙️ Review Tenant-Wide Settings

### Step 9: Review Security Defaults  
- Navigate to **Microsoft Entra ID** → **Properties** → **Manage Security Defaults**
- Choose to:
  - Keep **Security Defaults** enabled, or  
  - Disable and replace them later with **Conditional Access** (covered in a later module)

### Step 10: Review External Collaboration Settings  
- Navigate to **External Identities** → **External Collaboration Settings**
- Review:
  - **Guest invitation permissions**
  - **Collaboration restrictions**
  - **Guest access expiration**

📸 **Screenshot Example:**  
`/entra/screenshots/initial-tenant-config/06security-defaults.png`

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

