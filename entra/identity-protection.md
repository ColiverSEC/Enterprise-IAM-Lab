# ⚡ Identity Protection  

⬅️ [Back to Entra ID Lab Overview](./README.md)

This walkthrough covers configuring **Microsoft Entra Identity Protection** to detect and respond to risky users and sign-ins. You’ll create risk policies, monitor risk events, and integrate with **Microsoft Defender for Identity** to enhance threat detection.

---

## 📚 What This Lab Covers

- Enabling Identity Protection in Entra ID  
- Configuring **User Risk Policies** and **Sign-in Risk Policies**  
- Monitoring risky users and sign-in events  
- Reviewing and remediating risk events  
- Integrating Microsoft Defender for Identity  
- Optional: configuring automated remediation actions  

---

## 📝 What You’ll Need

🔹 Microsoft Entra ID tenant with P2 licenses (required for Identity Protection)  
🔹 Global Administrator or Security Administrator privileges  
🔹 Test users and accounts for simulated risk events  
🔹 Optional: Microsoft Defender for Identity sensor deployed on domain controllers  

---

## 🛡️ Enable Identity Protection

### Step 1: Navigate to Identity Protection

- Go to **Entra Admin Center → Security → Identity Protection**  
- Review dashboard with **Overview, Users at risk, Sign-ins at risk, and Risk detections**  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-protection/01-dashboard.png`

---

## ⚡ Configure Risk Policies

### Step 2: User Risk Policy

- Navigate to **Identity Protection → Policies → User risk policy**  
- Click **+ New policy**  
- Configure:
  - **Users or groups**: target specific users or all users  
  - **Risk level**: Low, Medium, High  
  - **Controls**: Require password change, require MFA  
- Enable policy and save  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-protection/02-user-risk-policy.png`

---

### Step 3: Sign-in Risk Policy

- Navigate to **Policies → Sign-in risk policy**  
- Click **+ New policy**  
- Configure:
  - **Users or groups**: target users for high-risk sign-ins  
  - **Risk level**: Medium and above  
  - **Controls**: Require MFA or block access  
- Enable policy and save  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-protection/03-signin-risk-policy.png`

---

## 📊 Monitor Risk Events

### Step 4: Review Risky Users

- Go to **Identity Protection → Users at risk**  
- Review detected risks, risk level, and remediation status  
- Optionally, filter by **risk event type, user, or group**  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-protection/04-risky-users.png`

### Step 5: Review Risky Sign-ins

- Go to **Identity Protection → Sign-ins at risk**  
- Review each sign-in event for **risk type, device, location, and risk level**  
- Trigger remediation if needed (require MFA or block access)  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-protection/05-risky-signins.png`

---

## 🛡️ Integrate Microsoft Defender for Identity

### Step 6: Configure Defender for Identity

- Navigate to **Microsoft 365 Security → Microsoft Defender for Identity**  
- Ensure **sensors are deployed** on your domain controllers  
- Integrate with Identity Protection to correlate on-premises AD activities with cloud risk events  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-protection/06-defender-for-identity.png`

### Step 7: Review Alerts and Remediation

- Monitor alerts from Defender for Identity  
- Cross-reference with Identity Protection risky users and sign-ins  
- Take remediation actions as needed (password resets, MFA prompts, account review)  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-protection/07-remediation.png`

---

## ✅ Expected Behavior

- Risky users are detected automatically based on sign-in and user activity  
- Policies enforce MFA or password change for medium/high-risk users  
- Defender for Identity alerts correlate on-premises events with cloud risk detections  
- Administrators can review and remediate risks effectively  

---

## 🔄 Optional Enhancements

- Configure **automated risk remediation** via Identity Protection policies  
- Integrate with **Conditional Access** to block or limit risky sign-ins  
- Use **Azure Sentinel** or other SIEM for additional alerting  
- Simulate risky sign-ins for lab testing using test accounts  

---

## 🔗 Next Steps

You’ve successfully configured Identity Protection to detect, monitor, and respond to risky users and sign-ins.  
Next, you can assign **RBAC roles and manage access to Azure resources** using **Azure Resource Access Management**.

➡️ [Continue to: Azure Resource Access Management](./azure-access.md)

