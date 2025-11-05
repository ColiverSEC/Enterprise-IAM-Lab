# 🛡️ Microsoft Entra Conditional Access Policy Walkthrough

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

- Go to **Microsoft Entra Admin Center** → **Entra ID** → **Security** → **Conditional Access**  
- Click **+ New policy** to create a new policy  

📸 **Screenshot Example:**  
`/entra/screenshots/conditional-access/01-create-new-policy.png`

---

### Step 2: Define Policy Basics

- **Name**: `Require MFA for Licensed Users`  
- Optional description: `Enforces MFA for test lab users to validate Conditional Access`  

---

### Step 3: Select Users or Groups

- **Include**: Select your test group or a license-based group (e.g., `M365-E5-License-Group`)  
- **Exclude**:  
  - Your **Global Admin** account to prevent accidental lockout  
  - Any **break-glass accounts**  

📸 **Screenshot Example:**  
`/entra/screenshots/conditional-access/02-select-users.png`

---

### Step 4: Choose Cloud Apps or Actions

- Click **Cloud apps or actions** → **Select apps**  
- Include **All cloud apps** for testing or select specific apps like Exchange Online, SharePoint, etc.  

📸 **Screenshot Example:**  
`/entra/screenshots/conditional-access/03-select-cloud-apps.png`

---

### Step 5: Configure Conditions (Optional)

- **Sign-in risk** *(requires P2 license)*:  
  - Trigger on `Medium and above`  
- **Location**:  
  - Include or exclude specific locations  
  - For lab purposes, you can skip this step  

📸 **Screenshot Example:**  
`/entra/screenshots/conditional-access/04-conditions.png`

> 💡 **Tip:** Conditions are optional in a lab. For production, consider using trusted IP ranges and named locations.

---

### Step 6: Configure Access Controls

- Under **Grant**, select:  
  - ✅ `Require multi-factor authentication`  
  - Ensure **Require all the selected controls** is checked  
- Click **Select** → **Done**  

📸 **Screenshot Example:**  
`/entra/screenshots/conditional-access/05-grant-access.png`

---

### Step 7: Enable the Policy

- Set **Enable Policy** to `On`  
- Click **Create** to save and apply the policy  

📸 **Screenshot Example:**  
`/entra/screenshots/conditional-access/06-enable-policy.png`

---

## 🧪 Test the Conditional Access Policy

1. Confirm your test user is part of the targeted group.  
2. Open a new browser or incognito window and sign in as the test user.  
3. Verify that MFA is prompted according to the policy.  
4. Ensure your **Global Admin or break-glass accounts** are excluded and can still sign in without MFA.  

> ⚠️ **Important:** Always keep a backup Global Admin or break-glass account excluded to prevent lockout.

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
