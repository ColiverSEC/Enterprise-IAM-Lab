# 🔄 Okta Lifecycle Management Walkthrough

This lab demonstrates how Okta’s Lifecycle Management (LCM) feature can automatically provision and deprovision users in connected applications and how workflows can enhance automation during key lifecycle events.

## 📝 What This Covers
- Auto-provisioning users to connected apps via SCIM
- Automatically deactivating users when offboarded from Okta
- Using Okta Workflows to send alerts or perform actions on lifecycle events (e.g., deactivation)

## 🛠️ Key Steps

1️⃣ **Enable Provisioning for an App**
   - Go to **Applications** → **Applications**
   - Select a SCIM-enabled app like **Slack** or **GitHub** in the **Browse App Catalog**, or for testing purposes you can use the built in SCIM 2.0 Test App (OAuth Bearer Token) app 
   - Click **Add Integration** then fill out the fields in the **General Settings** tab → **Next** → **Done**
   - Go to the **Provisioning** tab click → **Configure API Integration** → **Check Enable API integration**
   - For this step, if you’re using the **SCIM 2.0 Test App (OAuth Bearer Token)**:
      - Go to https `//scim.dev` and click **Get an API Key** to generate a free SCIM 2.0 Base URL and OAuth Bearer Token.
      - Paste those values into the **SCIM 2.0 Base URL** and **OAuth Bearer Token** fields to continue setup
   - **Test API Credentials** and click **Save**

📸 Screenshot:
![Provisioning Settings Enabled](./screenshots/lifecycle/provisioning-settings.png)

---

2️⃣ **Configure Lifecycle Hooks**
   - Under the same **Provisioning** tab, ensure **Create Users**, ***Deactivate Users*** and **Sync Password** are set to **Enable**
   - Scroll down to the **Attribute Mappings** section and map Okta attributes to the app
   - You'll notice that **userName** says **"Configured in Sign On Settings"** — that’s normal
      - This means Okta is using the value defined under the **Sign On** tab (typically the user's email or username)
         - verify these mappings exist:
         - `userName` → **Configured in Sign On Settings**
         - `givenName` → `firstName`
         - `familyName` → `lastName`
   - If you're using `https://scim.dev`, these mappings work as expected for test provisioning
   - Click **Save Mappings** if prompted

📸 Screenshot:
![Provisioning Settings Enabled](./screenshots/lifecycle/provisioning-settings.png)

---
         
3️⃣ **Assign a Test User**
   - Go to **Directory** → **People**
   - Select an existing test user or click **Add Person** to create one
   - After creating or selecting a user, click **Assign Applications**
   - Choose your SCIM-enabled app (e.g., the SCIM 2.0 Test App you set up)
   - Fill in any required fields (like username or email) and click **Save and Go Back**
   - Click **Done** to complete the assignment

📸 Screenshot:
![Provisioning Settings Enabled](./screenshots/lifecycle/provisioning-settings.png)

---

4️⃣ **Deactivate the Test User**
   - Go to **Directory** → **People**
      - Find the test user you assigned the SCIM app to in Step 3
   - Click on the User’s Name to open profile
   - Click **More Actions** → **Deactivate**
   - Okta will ask for confirmation, click the red **Deactivate**
   - Confirm the user is **Deactivated** in Okta
   - Check that the account is **automatically deactivated** in the external application
   - Check **System Log** to confirm user was deactivated

📸 Screenshot:
![Provisioning Settings Enabled](./screenshots/lifecycle/provisioning-settings.png)

---

## ✅ Outcome
- When a user is removed from Okta, the app account is also deactivated  
- Logs confirm provisioning events

