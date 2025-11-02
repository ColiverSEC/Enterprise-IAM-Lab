# ⚡ Identity Protection  

⬅️ [Back to Entra ID Lab Overview](./README.md)

This walkthrough covers configuring **Microsoft Entra Identity Protection** to detect and respond to risky users and sign-ins. You’ll create risk policies, monitor risk events, and integrate with **Microsoft Defender for Identity** to enhance threat detection.

---

## 📚 What This Lab Covers

- Enabling Identity Protection in Entra ID  
- Configuring **User Risk Policies** and **Sign-in Risk Policies**  
- Monitoring risky users and sign-in events  
- Reviewing and remediating risk events   
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

- Go to **Entra Admin Center → Identity Protection**  
- Review dashboard with **Users at risk, Sign-ins at risk, and Risk detections**  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-protection/01-dashboard.png`

---

## ⚡ Configure Risk Policies

### Step 2: User Risk Policy

- Navigate to **Identity Protection → Protect → User risk policy**   
- Configure:
  - **Users or groups**: target specific users or all users  
  - **Risk level**: Low, Medium, High  
  - **Controls**: Require password change, require MFA  
- Enable policy and save

> 💡 **Tip:**
> - **Low Risk:** Involving minor anomalies with less confidence of a real threat
> - **Medium Risk:** Suggesting suspicious patterns (e.g., unfamiliar sign-ins)
> - **High Risk:** Indicating a strong possibility of compromise (e.g., leaked credentials)

📸 **Screenshot Example:**  
`/entra/screenshots/identity-protection/02-user-risk-policy.png`

---

### Step 3: Sign-in Risk Policy

- Navigate to **Protect → Sign-in risk policy**    
- Configure:
  - **Users or groups**: target users for high-risk sign-ins  
  - **Risk level**: Medium and above  
  - **Controls**: Require MFA or block access  
- Enable policy and save  

> 💡 **Tip:**
> - **Low Risk:** Minor anomalies are present, such as an unfamiliar sign-in property or a sign-in from an anonymous IP address
> - **Medium Risk:** More suspicious signals are detected, such as a suspicious sending pattern or a combination of low-risk anomalies like multiple unfamiliar sign-in properties
> - **High Risk:** There is a high confidence that the sign-in is unauthorized and the account is compromised

📸 **Screenshot Example:**  
`/entra/screenshots/identity-protection/03-signin-risk-policy.png`

---

## 📊 Monitor Risk Events

### Step 4: Review Risky Users

- Go to **Identity Protection → Report → Users at risk**  
- Review detected risks, risk level, and remediation status  
- Optionally, filter by **risk event type, user, or group**  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-protection/04-risky-users.png`

### Step 5: Review Risky Sign-ins

- Go to **Identity Protection → Report → Sign-ins at risk**  
- Review each sign-in event for **risk type, device, location, and risk level**  
- Trigger remediation if needed (require MFA or block access)  

📸 **Screenshot Example:**  
`/entra/screenshots/identity-protection/05-risky-signins.png`


## ✅ Expected Behavior

- Risky users are detected automatically based on sign-in and user activity  
- Policies enforce MFA or password change for medium/high-risk users  
- Administrators can review and remediate risks effectively  

---

## 🔄 Optional Enhancements

- Configure **automated risk remediation** via Identity Protection policies  
- Integrate with **Conditional Access** to block or limit risky sign-ins    
- Simulate risky sign-ins for lab testing using test accounts  

---

## 🔗 Next Steps

You’ve successfully configured Identity Protection to detect, monitor, and respond to risky users and sign-ins.  
Next, you can assign **RBAC roles and manage access to Azure resources** using **Azure Resource Access Management**.

➡️ [Continue to: Azure Resource Access Management](./azure-access.md)

