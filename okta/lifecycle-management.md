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
   - **Test Credentials** and click **Save**

📸 Screenshot:
![Provisioning Settings Enabled](./screenshots/lifecycle/provisioning-settings.png)

---

2️⃣ **Configure Lifecycle Hooks**
   - Enable *Create Users*, *Deactivate Users*, etc.
   - Map Okta attributes to the app

3. **Create a Workflow (Optional)**
   - Trigger: User deactivated
   - Action: Send Slack/email to IT

📸 Screenshots:
- Provisioning settings enabled  
- Workflow builder view  
- Audit logs of user being deprovisioned

## ✅ Outcome
- When a user is removed from Okta, the app account is also deactivated  
- Logs confirm provisioning events

