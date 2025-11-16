# 🔐 Authentication & MFA Policies  

⬅️ [Back to Okta IAM Lab Overview](./README.md)

This walkthrough covers how to enforce security policies in Okta, including multi-factor authentication (MFA), authentication and enrollment policies, global session rules, and password/self-service recovery policies.

---

## 📚 What This Lab Covers

- Setting up authenticators (Okta Verify, SMS, etc.)  
- Creating enrollment policies for MFA  
- Adding rules to the global session policy  
- Configuring authentication policies for users or groups  
- Setting up password policies and self-service recovery  
- Verifying that users are required to use the configured authenticators  

---

## 📝 What You’ll Need

- 🔹 Okta Developer or Enterprise Org  
- 🔹 Administrator privileges (Super Admin or equivalent)  
- 🔹 Test users and groups created from previous labs  
- 🔹 Browser (incognito recommended for testing)  

---

## 👥 Set Up Authenticators

### Step 1: Navigate to Authenticators
- Go to **Security → Authenticators** in the Okta Admin Console  
- Select an authenticator type (e.g., **Okta Verify**, **SMS Authentication**)  

### Step 2: Configure the Authenticator
- Enable the authenticator for your Org  
- Configure required options (enrollment, verification methods, push notifications, etc.)  
- Save the configuration  

📸 **Screenshot Example:**  
`![Authenticator settings](./screenshots/01-authenticator-settings.png)`  
`![Authenticator enabled](./screenshots/02-authenticator-enabled.png)`

---

## 🧩 Create Enrollment Policies

### Step 1: Navigate to Enrollment Policies
- Go to **Security → Multifactor → Enrollment Policies**  
- Click **Add Policy**  

### Step 2: Configure Rules
- Name the policy (e.g., **MFA Required for All Users**)  
- Assign policy to a group (e.g., `All Users`)  
- Set the required authenticators and verification methods  
- Save the policy  

📸 **Screenshot Example:**  
`![Enrollment policy](./screenshots/03-enrollment-policy.png)`  
`![Policy rules](./screenshots/04-policy-rules.png)`

---

## 🔄 Configure Global Session Policies

### Step 1: Open Global Session Policies
- Go to **Security → Sessions → Global Session Policy**  
- Click **Add Rule** or edit an existing rule  

### Step 2: Configure Session Rules
- Define conditions (e.g., network zone, group, MFA required)  
- Set session behavior (e.g., sign-on frequency, idle timeout)  
- Save changes  

📸 **Screenshot Example:**  
`![Global session rule](./screenshots/05-session-rule.png)`

---

## 🔐 Configure Authentication Policies

### Step 1: Navigate to Authentication Policies
- Go to **Security → Authentication → Policies**  
- Select **Add Policy**  

### Step 2: Add Rules
- Define which groups/users the policy applies to  
- Configure allowed authenticators and access conditions  
- Save policy  

📸 **Screenshot Example:**  
`![Authentication policy](./screenshots/06-authentication-policy.png)`

---

## 🧾 Password & Self-Service Recovery Policies

### Step 1: Open Password Policies
- Go to **Security → Authentication → Password**  
- Edit **Password Policy** for your org or group  

### Step 2: Configure Recovery Options
- Enable self-service password reset  
- Define complexity, expiration, and history settings  
- Save policy  

📸 **Screenshot Example:**  
`![Password policy](./screenshots/07-password-policy.png)`  
`![Self-service recovery](./screenshots/08-password-recovery.png)`

---

## ✅ Verify MFA Enforcement

- Log in as a test user in the assigned group  
- Attempt to access the Org or assigned app  
- Ensure MFA enrollment is prompted and required authenticators are enforced  
- Confirm users cannot bypass MFA  

📸 **Screenshot Example:**  
`![MFA prompt](./screenshots/09-mfa-prompt.png)`  
`![MFA verified](./screenshots/10-mfa-success.png)`

---

## 🔄 Optional Enhancements

- Configure contextual access policies based on network zones, device trust, or user groups  
- Enforce step-up authentication for sensitive applications  
- Combine MFA policies with adaptive authentication rules  

---

## 🔗 Next Steps

You’ve successfully implemented authentication and MFA policies in Okta.  
Next, you’ll troubleshoot user and app access issues, analyze Syslog events, and ensure policy enforcement.

➡️ Continue to: [Troubleshooting & Syslog Analysis](./troubleshooting-syslog.md)

