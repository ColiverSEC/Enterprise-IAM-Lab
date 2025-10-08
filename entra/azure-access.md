# ☁️ Azure Resource Access Management  

⬅️ [Back to Entra ID Lab Overview](./README.md)

This walkthrough covers how to manage access to Azure resources using **RBAC**, **managed identities**, and **Key Vault access policies**. You’ll assign roles to users and groups, configure managed identities for services, and control secrets in Key Vault.

---

## 📚 What This Lab Covers

- Understanding Azure RBAC roles and scopes  
- Assigning users and groups to roles for Azure resources  
- Configuring **system-assigned** and **user-assigned managed identities**  
- Granting Key Vault access using RBAC and access policies  
- Testing access to resources and secrets  

---

## 📝 What You’ll Need

🔹 Azure subscription (with sufficient privileges)  
🔹 Global Administrator or Owner/Contributor roles  
🔹 Test users or groups in Entra ID  
🔹 Resource group and Key Vault created for lab purposes  

---

## 🏷️ Assign RBAC Roles

### Step 1: Navigate to Access Control (IAM)

- Go to **Azure Portal → Resource Group or specific resource → Access control (IAM)**  
- Click **+ Add → Add role assignment**

### Step 2: Select Role

- Choose an appropriate **role**:
  - **Owner** – full access  
  - **Contributor** – create/manage resources  
  - **Reader** – read-only  
  - **Key Vault Contributor** – manage Key Vault objects  

- Select **Assign access to**:
  - **User, group, or service principal**  

- Pick the target users/groups and click **Review + Assign**

📸 **Screenshot Example:**  
`/azure/screenshots/azure-access/01-role-assignment.png`

---

## 🛡️ Configure Managed Identities

### Step 3: Enable a System-Assigned Managed Identity

- Navigate to an **Azure VM, App Service, or Function App**  
- Go to **Identity → System-assigned → Status: On → Save**  

📸 **Screenshot Example:**  
`/azure/screenshots/azure-access/02-system-identity.png`

### Step 4: Create a User-Assigned Managed Identity

- Go to **Azure Portal → Managed Identities → + Create**  
- Assign it to a **resource group** or **specific resources**  
- Enable identity and note its **principal ID** for RBAC assignments  

📸 **Screenshot Example:**  
`/azure/screenshots/azure-access/03-user-assigned-identity.png`

---

## 🔑 Configure Key Vault Access

### Step 5: Assign Access Policies (Optional)

- Navigate to **Key Vault → Access policies → + Add Access Policy**  
- Select **permissions** for keys, secrets, and certificates  
- Assign to a **user, group, or managed identity**  
- Save changes  

📸 **Screenshot Example:**  
`/azure/screenshots/azure-access/04-keyvault-access-policy.png`

### Step 6: Assign RBAC Roles to Key Vault (Alternative)

- Go to **Key Vault → Access control (IAM) → + Add role assignment**  
- Assign roles like **Key Vault Administrator** or **Key Vault Secrets User**  
- Choose **user, group, or managed identity**  

📸 **Screenshot Example:**  
`/azure/screenshots/azure-access/05-keyvault-iam.png`

---

## 🔁 Test Access

### Step 7: Validate Permissions

- Log in as assigned user or use managed identity in a resource  
- Test actions:
  - Read/write secrets in Key Vault  
  - Deploy or modify resources based on assigned role  

📸 **Screenshot Example:**  
`/azure/screenshots/azure-access/06-test-access.png`

---

## ✅ Expected Behavior

- Users and groups can access only the resources allowed by their RBAC roles  
- Managed identities can authenticate and access resources without credentials  
- Key Vault access policies or RBAC roles control secrets, keys, and certificates correctly  
- Unauthorized actions are blocked  

---

## 🔄 Optional Enhancements

- Use **conditional access** to restrict access to specific Azure resources  
- Configure **Key Vault firewall and virtual network rules**  
- Automate RBAC assignments using **Azure CLI, PowerShell, or ARM templates**  
- Monitor activity using **Azure Monitor or Activity Logs**  

---

## 🔗 Next Steps

You’ve successfully managed Azure resource access using RBAC, managed identities, and Key Vault.  
Next, you’ll configure **Enterprise App Integrations and Application Registration** to manage authentication and provisioning for SaaS apps.

➡️ [Continue to: Enterprise App Integrations & Registration](./enterprise-apps.md)

