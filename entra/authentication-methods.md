# 🔑 Authentication Methods & SSPR  

⬅️ [Back to Entra ID Lab Overview](./README.md)

This walkthrough covers enabling and managing authentication methods in Microsoft Entra ID. You’ll configure **MFA**, **FIDO2 security keys**, **Windows Hello for Business**, **self-service password reset (SSPR)**, and tenant-wide authentication policies.

---

## 📚 What This Lab Covers

- Enabling and configuring Multi-Factor Authentication (MFA)  
- Configuring FIDO2 security keys for passwordless authentication  
- Setting up Windows Hello for Business  
- Enabling and testing Self-Service Password Reset (SSPR)  
- Configuring tenant-wide authentication methods and restrictions  
- Monitoring and reporting authentication events  

---

## 📝 What You’ll Need

🔹 Microsoft Entra ID tenant (configured from previous modules)  
🔹 Global Administrator privileges  
🔹 User accounts for testing MFA and SSPR  
🔹 Optional: Security keys or Windows Hello-capable devices  

---

## 🔐 Enable Multi-Factor Authentication (MFA)

### Step 1: Navigate to MFA Settings

- Go to **Entra Admin Center → Security → Authentication methods → Multi-Factor Authentication**  
- Review **per-user MFA**, **conditional access policies**, and **service settings**

### Step 2: Enable MFA for Users

- Select users or groups  
- Enable MFA and choose enforcement method (e.g., phone call, SMS, authenticator app)  
- Save settings

📸 **Screenshot Example:**  
`/entra/screenshots/authentication-methods/01-enable-mfa.png`

---

## ⚡ Configure FIDO2 Security Keys

### Step 3: Enable FIDO2 for Passwordless Sign-In

- Go to **Authentication methods → FIDO2 Security Key**  
- Enable for users or groups  
- Define **enrollment restrictions** if needed  
- Save configuration

📸 **Screenshot Example:**  
`/entra/screenshots/authentication-methods/02-fido2.png`

---

## 🖐️ Configure Windows Hello for Business

### Step 4: Enable Windows Hello

- Go to **Authentication methods → Windows Hello for Business**  
- Enable **key-based** or **certificate-based** sign-in  
- Assign to users or groups  
- Configure device restrictions as needed

📸 **Screenshot Example:**  
`/entra/screenshots/authentication-methods/03-windows-hello.png`

---

## 🔄 Enable Self-Service Password Reset (SSPR)

### Step 5: Configure SSPR

- Navigate to **Entra Admin Center → Password reset → Properties**  
- Enable **SSPR for all or selected users**  
- Configure **authentication methods** (email, mobile, security questions)  
- Save changes

### Step 6: Test SSPR

- Log in as a test user  
- Click **Forgot my password**  
- Verify reset process works correctly

📸 **Screenshot Example:**  
`/entra/screenshots/authentication-methods/04-sspr.png`

---

## 🛡️ Configure Tenant Restrictions

### Step 7: Set Authentication Method Policies

- Navigate to **Authentication methods → Policies**  
- Configure:
  - Allowed/blocked authentication methods  
  - MFA requirements per user or group  
  - Temporary access and exclusions  

📸 **Screenshot Example:**  
`/entra/screenshots/authentication-methods/05-tenant-restrictions.png`

---

## 📊 Monitor and Report Authentication Activity

### Step 8: Review Sign-In Logs

- Go to **Monitoring → Sign-ins**  
- Filter by authentication method, user, or status  
- Verify MFA, passwordless, and SSPR events  

📸 **Screenshot Example:**  
`/entra/screenshots/authentication-methods/06-auth-monitor.png`

---

## ✅ Expected Behavior

- MFA is enforced for selected users or groups  
- FIDO2 and Windows Hello allow passwordless sign-in  
- SSPR functions correctly for self-service password resets  
- Authentication method restrictions are applied at tenant level  
- Sign-in logs accurately reflect authentication events  

---

## 🔄 Optional Enhancements

- Configure **Conditional Access policies** to enforce MFA for sensitive apps  
- Enable **FIDO2 + Windows Hello combined** for enhanced security  
- Use **custom branding** for SSPR portal  
- Monitor **failed sign-ins** and suspicious activity alerts  

---

## 🔗 Next Steps

You’ve successfully configured authentication methods and self-service password reset for your Entra ID users.  
Next, you’ll plan and implement **Conditional Access policies** to enforce security and compliance for applications and devices.

➡️ [Continue to: Conditional Access](./conditional-access.md)

