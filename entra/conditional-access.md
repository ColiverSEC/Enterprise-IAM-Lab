# 🛡️  Conditional Access Policies

⬅️ [Back to Entra ID Lab Overview](./README.md)

This walkthrough demonstrates how to create and test a Conditional Access policy in Microsoft Entra ID. The goal is to enforce Multi-Factor Authentication (MFA) under specific conditions, such as risky sign-ins or access to specific applications.

---

## 📚 What This Lab Covers

- Creating a Conditional Access policy  
- Targeting specific users or groups  
- Configuring conditions like sign-in risk or locations  
- Requiring MFA or blocking access as controls  
- Testing the policy in a lab environment  

---

## 📝 What You’ll Need

🔹 Microsoft Entra ID tenant (configured from previous module)  
🔹 Global Administrator or Security Administrator privileges  
🔹 (Optional) Microsoft Entra ID P2 license for advanced features like sign-in risk conditions  
🔹 A test user account in a targeted group  

---

## ⚙️ Create a Conditional Access Policy

### Step 1: Navigate to Conditional Access

- Go to **Microsoft Entra Admin Center** → **Entra ID** → **Conditional Access**  
- Click **+ New policy** to create a new policy  

📸 **Screenshot Example:**  
`/entra/screenshots/conditional-access/01-create-new-policy.png`


### Step 2: Define Policy Basics

- **Name**: `Force MFA for Admin Portals`   

### Step 3: Select Users or Groups
- Click **users and groups selected**
- **Include**:
  -  **All users**
- **Exclude**:  
  - Your **Global Admin** account to prevent accidental lockout  
  - Any **break-glass accounts**  

📸 **Screenshot Example:**  
`/entra/screenshots/conditional-access/02-select-users.png`

### Step 4: Choose Cloud Apps or Actions

- Click **No target resources selected**
- **Include:**
  - **Select resources** → **Select specific resources** → **Microsoft Admin Portals** → **Select**

📸 **Screenshot Example:**  
`/entra/screenshots/conditional-access/03-select-cloud-apps.png`

### Step 5: Configure Conditions (Optional)

- **Sign-in risk** *(requires P2 license)*:  
  - Trigger on `Medium and above`  
- **Location**:  
  - Include or exclude specific locations  
  - For lab purposes, you can skip this step  

📸 **Screenshot Example:**  
`/entra/screenshots/conditional-access/04-conditions.png`

> 💡 **Tip:** Conditions are optional in a lab. For production, consider using trusted IP ranges and named locations

### Step 6: Configure Access Controls

- Under **Grant**, select:  
  - ✅ `Require multi-factor authentication`  
  - Ensure **Require all the selected controls** is checked  
- Click **Select** 

📸 **Screenshot Example:**  
`/entra/screenshots/conditional-access/05-grant-access.png`

### Step 7: Enable the Policy

- Set **Enable Policy** to `On`  
- Click **Create** to save and apply the policy  

📸 **Screenshot Example:**  
`/entra/screenshots/conditional-access/06-enable-policy.png`

---

## 🔍 Test Policies with the "What If" Tool

The **What If** tool allows you to simulate the effect of a Conditional Access policy for a specific user **without enforcing it**, which is perfect for lab testing and troubleshooting.

### Step 1: Open the What If Tool

- Go to **Microsoft Entra Admin Center → Entra ID → Conditional Access → What If**  

📸 **Screenshot Example:**  
`/entra/screenshots/conditional-access/07-what-if-tool.png`

### Step 2: Simulate a Policy

- Select the **user** you want to test
- Select the **Target resource** to simulate access to
- Optionally, configure **conditions**:
  - Sign-in risk  
  - Device state  
  - Location  
  - Client apps  
- Click **What If**

📸 **Screenshot Example:**  
`/entra/screenshots/conditional-access/08-what-if-simulation.png`

### Step 3: Review the Results

- The tool shows whether access would be **granted or blocked**  
- It highlights which policies are applied and which conditions triggered  
- Useful for validating policies **before deploying them** in production

> 💡 **Tip:** Use the What If tool in your lab to safely experiment with different combinations of users, apps, and conditions without affecting real access

---

## 🧾 Optional Enhancements

- Add **named locations** to enforce location-based policies  
- Include **client app filters** to block legacy authentication  
- Require MFA only for specific apps or sensitive actions  
- Automate policy creation via **PowerShell** or **Microsoft Graph API**  

---

## ✅ Expected Behavior

- Users in the targeted group are prompted for MFA  
- Excluded accounts bypass the policy  
- You can monitor sign-in events under:  
  **Microsoft Entra Admin Center → Monitoring → Sign-in Logs**

---

## 🔗 Next Steps

After configuring Conditional Access, you can proceed to:  
- [External Identities (B2B/B2C)](./external-identities.md)  
- [Device Compliance Policies in Intune](https://github.com/ColiverSEC/Microsoft-365-Security-Lab/blob/main/Intune/device-compliance.md)
