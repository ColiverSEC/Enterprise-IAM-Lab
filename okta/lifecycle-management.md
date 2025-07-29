# 🔄 Okta Lifecycle Management Walkthrough

This lab demonstrates how Okta’s Lifecycle Management (LCM) feature can automatically provision and deprovision users in connected applications and how workflows can enhance automation during key lifecycle events.

## 📝 What This Covers
- Auto-provisioning users to connected apps via SCIM
- Automatically deactivating users when offboarded from Okta
- Using Okta Workflows to send alerts or perform actions on lifecycle events (e.g., deactivation)

## 🛠️ Key Steps

1️⃣ **Enable Provisioning for an App**
   - Go to *Applications* → select app → *Provisioning* tab
   - Enable SCIM or API integration

2. **Configure Lifecycle Hooks**
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

