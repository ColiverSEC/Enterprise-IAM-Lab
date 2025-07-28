# 🔐 Okta MFA Policy Configuration Walkthrough

This section demonstrates how to configure and test Okta Multi-Factor Authentication (MFA) policies. You’ll enable factor enrollment, define an authentication policy, assign it to applications, and verify enforcement.

---

## 📝 What This Covers

- Enabling user factor enrollment
- Creating and customizing MFA policies
- Assigning MFA to users, groups, or apps
- Testing MFA prompts during login

---


## 🛠️ Step-by-Step Configuration

### 1️⃣ Create A Test Group
- Go to **Directory** → **Groups**
- Click **Add Group**
- Name the group something like: ```MFA-Test-Group```
- (Optional) Add your test user(s) to this group now
- Click **Done**

📸 Screenshot:  
![Factor Enrollment Screen](../screenshots/okta_factor_enrollment.png)

---

### 2️⃣ Enable Factor Enrollment

- Go to **Okta Admin Console** → **Security** → **Authenticators**
- Under the **Authenticators** tab, confirm that **Okta Verify** and **Email** are listed
   - If needed, click **Add Authenticator** to add other factors like:
        - **SMS Authentication**
        - **Security Questions** (not recommended for production) 
- Click the **Enrollment** tab
- Click **Add Policy**
- Name the policy something like: ``` MFA Enrollment Policy – Demo Group ```
- Under **Assign to Groups**, assign the policy to ```MFA-Test-Group```(created in step 1) or another test group
- For each authenticator (e.g., Okta Verify, Email), click dropdown and choose:
   - **Required**, **Optional**, or **Disabled**, depending on your goal
        - Example:
             - Okta Verify → **Required**
             - Email → **Optional**
-** Click **Create Policy** to configure the rule
- In the **Add Rule** settings:
   - Set the **Rule Name** (e.g., ```Require Okta Verify```)
   - **IF**: User IP is
      - set to **Anywhere**
   - **AND**: User is accessing
      - For the lab, select **Okta**, **Applications** and **Any application that supports MFA enrollment**
   - **THEN**: Enrollment is
      - **Allowed for all authenticators****
- click **Create rule**
     

📸 Screenshot:  
![Factor Enrollment Screen](../screenshots/okta_factor_enrollment.png)

---

### 3️⃣ Create an Authentication Policy

- Go to **Okta Admin Console** → **Security** → **Authentication Policies**
2. Click **Add a policy**
3. Name the policy something like: `Require MFA for Okta Apps`
4. Under **Rules**, add:
   - **IF**: User is in `All users` or a custom group (e.g., `MFA-Test-Group`)
   - **THEN**: Require `Password + Any enrolled factor`

📸 Screenshot:  
![Authentication Policy Setup](../screenshots/okta_auth_policy.png)

---

### 3️⃣ Apply Policy to Application(s)

1. Go to **Applications** → Choose your test app (e.g., GitHub SAML)
2. Click the **Sign-On** tab
3. Under *Authentication Policy*, click **Edit** → Assign your new policy

📸 Screenshot:  
![Apply Policy to App](../screenshots/okta_policy_applied_to_app.png)

---

### 4️⃣ Test Sign-In

1. Ensure your **test user** is in the correct group (if applicable)
2. Open a new incognito browser window
3. Go to the **Okta user portal** or launch the app directly
4. Confirm you are prompted for MFA

📸 Screenshot:  
![MFA Prompt](../screenshots/okta_mfa_prompt.png)

---

## ✅ Expected Behavior

- Users will be prompted for MFA based on the configured policy
- Logs of successful or failed MFA attempts can be found under:  
  **Reports** → *System Log*

📸 Screenshot:  
![System Log Screenshot](../screenshots/okta_mfa_logs.png)

---

## 🔄 Optional Enhancements

- Use **device context** or **network conditions** for adaptive MFA
- Apply separate policies per app (e.g., higher enforcement on admin tools)
- Create fallback recovery factors for locked-out users

---

## 🔗 Next Step: [App Integration Walkthrough](./app-integration.md)

