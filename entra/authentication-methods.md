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

### Step 1: Configure Available MFA Methods

- Go to **Entra Admin Center → Entra ID → Authentication methods**  
- Click **Policies → Authentication method policies**  
- Review the available methods (e.g., Authenticator app, FIDO2, SMS, phone call)  
- Enable the methods your organization allows

📸 **Available MFA Methods**
![Available MFA methods](/entra/screenshots/05-authentication-methods-and-sspr/01-mfa-settings.png)

### Step 2: Require Users to Register for MFA

- Go to **Entra ID → Identity Protection → Dashboard → Multifactor Authentication registration policy**  
- Create a new policy:  
  - Assign policy to the users or groups you want to enforce MFA for  
- Save the policy and set to **Enabled**

📸 **Example of MFA Policy for All Users**
![Require MFA](/entra/screenshots/05-authentication-methods-and-sspr/02-mfa-enforced.png)

### Step 3 (Optional): Enforce MFA via Conditional Access

- Go to **Entra ID → Conditional Access**  
- Create a policy targeting users, apps, or locations  
- Under **Access controls** → **Grant**, select **Require multi-factor authentication**  
- **Enable** and save the policy  

📸 **Example of MFA Being Enforced via Conditional Access**  
![Enforce MFA with Conditional Access](/entra/screenshots/05-authentication-methods-and-sspr/03-mfa-enforced-via-ca-policy.png)

---

## ⚡ Configure FIDO2 Security Keys

### Enable FIDO2 for Passwordless Sign-In

- Go to **Authentication methods → Passkey FIDO2**  
- Enable for users or groups  
- Define **enrollment restrictions** if needed  
- Save configuration

📸 **FIDO2 Enabled**  
![FIDO2 Passkey](/entra/screenshots/05-authentication-methods-and-sspr/04-fido2-setup.png)

---

## 🖐️ Configure Windows Hello for Business

### Enable Windows Hello for Business

- Go to **Entra ID → Authentication Methods → Authentication Strengths**
- Create a new authentication strength (or edit an existing one)
  - Enable **Windows Hello for Business**
  - Optionally include other methods like FIDO2
-  Assign the authentication strength to users/groups via **Conditional Access policies**
  - Go to **→ Entra ID → Conditional Access**
  - Create a policy targeting users or groups
  - Under **Grant controls**, select **Require authentication strength** and choose your WHfB strength
- Save the policy


📸 **Windows Hello for Business**  
![Windows Hello for Business](/entra/screenshots/05-authentication-methods-and-sspr/05-windows-hello-for-business.png)

---

## 🔄 Enable Self-Service Password Reset (SSPR)

### Step 1: Configure SSPR

- Navigate to **Entra ID → Password reset → Properties**  
- Enable **SSPR for all or selected users**  
- Configure **authentication methods** (email, mobile, security questions)  
- Save changes

📸 **SSPR Enabled**  
![Configure SSPR](/entra/screenshots/05-authentication-methods-and-sspr/06-sspr-config.png)

### Step 2: Test SSPR

- Log in as a test user  
- Click **Forgot my password**  
- Verify reset process works correctly

📸 **SSPR Test**  
![Test SSPR](/entra/screenshots/05-authentication-methods-and-sspr/07-test-sspr.png)
![Test SSPR Successful](/entra/screenshots/05-authentication-methods-and-sspr/08-test-sspr-confirmation.png)

---

## 🛡️ Configure Tenant Restrictions

### Set Authentication Method Policies

- Navigate to **Authentication methods → Policies**  
- Configure:
  - Allowed/blocked authentication methods  
  - MFA requirements per user or group  
  - Temporary access and exclusions  

📸 **Tenant Restrictions for MS Authenticator**  
![Configure tenant restrictions](/entra/screenshots/05-authentication-methods-and-sspr/09-tenant-restrictions.png)

---

## 📊 Monitor and Report Authentication Activity

### Review Sign-In Logs

- Go to **Authentication Methods → Monitoring → Activity or Monitoring & Health → Audit logs**  
- Filter by authentication method, user, or status  
- Verify MFA, passwordless, and SSPR events  

📸 **Monitoring Authentication Activity and Audit Logs**  
![Auth Methods Monitor](/entra/screenshots/05-authentication-methods-and-sspr/10-monitor.png)
![SSPR Activity Log](/entra/screenshots/05-authentication-methods-and-sspr/11-sspr-log.png)

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

