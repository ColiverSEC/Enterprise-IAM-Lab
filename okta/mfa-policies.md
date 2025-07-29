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
- Click **Add a policy**
- Name the policy something like: `Require MFA for Okta Apps`
- Click **Save**
- Click **Add rule**
- Name the rule something like: `MFA Rule for MFA-Test-Group`
- Under the **IF** section configure the following:
   - **IF**: User's user type is
      -  Select **Any user type**
   - **AND**: User's group membership includes
      - Select **At least one of the following groups:**
         - Type the name of test group, `MFA-Test-Group`
   - **AND**: User is
      - Select **Any user**
   - **And**: Device state is:
      - Select **Any**
  - **AND**: Device assurance policy is:
     - Select **No policy**
  - **AND**: Device platform is:
     - Select **Any platform**
  - **AND**: User's IP is:
     - Select **Any IP**
  - **AND**: Risk is:
     - Select **Any**
  - **AND**: The following custom expression is true:
     - Optional, in this case you can leave blank
- Under the **THEN** section configure the following:
   - **THEN** Access is
      - Select **Allowed after succesful authentication**
   - **AND** User must authenticate with
      - Select **Any 2 factor types**
   - **AND** Possession factor constraints are
      - Select **Phishing resistant**, **Require user interaction** and **Any interaction**
   - **AND** Authentication methods
      - Select **Allow any method can be used to meet the requriement**
- Now under the **When to prompt for authentication** section configure the last **AND** conditon:
   - **AND** Prompt for authentication
      - Select **When it’s been over a specified length of time since the user accessed any resource protected by the active Okta global session**
         - For Time since last sign in, set to 1 hour.
- Click **Save**
     
📸 Screenshot:  
![Authentication Policy Setup](../screenshots/okta_auth_policy.png)

---

### 4️⃣ Apply Policy to Application(s)

- Go to **Applications** → Choose your test app (e.g., GitHub SAML)
- Click the **Sign-On** tab
- Under **User authentication**, click **Edit** → Assign your new policy
- Click **Save**

📸 Screenshot:  
![Apply Policy to App](../screenshots/okta_policy_applied_to_app.png)

---

### 5️⃣ Test Sign-In

1. Ensure your **test user** is in the correct group (if applicable)
2. Copy your app URL from the **Embed Link** section of the **General** tab of your app
3. Open a new incognito browser window and paste the URL
4. Go to the **Okta user portal** or launch the app directly
5. Confirm you are prompted for MFA

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

