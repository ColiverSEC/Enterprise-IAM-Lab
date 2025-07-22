# 🔄 Okta Lifecycle Management Walkthrough

## 📝 What This Covers
- Auto-provisioning users to connected apps
- Setting up deactivation flows
- Okta Workflows to send alerts or take actions

## 🛠️ Key Steps

1. **Enable Provisioning for an App**
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

