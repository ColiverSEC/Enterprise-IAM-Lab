# 🧰 Troubleshooting & User Access  

⬅️ [Back to Okta IAM Lab Overview](./README.md)

This walkthrough covers common troubleshooting tasks in Okta, including resolving login issues, managing user sessions, verifying app access, and correcting group assignment errors.

---

## 📚 What This Lab Covers

- Troubleshooting why a user cannot sign in to the Okta Org  
- Expiring a user’s password and clearing sessions  
- Troubleshooting why a user cannot access an application from their dashboard  
- Troubleshooting incorrect group assignments for users  
- Using Okta System Log to identify issues  

---

## 📝 What You’ll Need

- 🔹 Okta Developer or Enterprise Org  
- 🔹 Administrator privileges (Super Admin or equivalent)  
- 🔹 Test users and groups created from previous labs  
- 🔹 Test applications integrated via SAML/OIDC or SCIM  
- 🔹 Browser (incognito recommended for testing)  

---

## 👥 Troubleshoot Sign-In Issues

### Step 1: Identify the Problem
- Navigate to **Directory → People → [User] → More Actions → Unlock Account**  
- Check **Sign-in attempts** or **User status** for failures  

### Step 2: Resolve
- If locked out, click **Unlock Account**  
- Verify user credentials and reset password if needed  

📸 **Screenshot Example:**  
`![Unlock user account](./screenshots/01-unlock-user.png)`  
`![Sign-in attempts](./screenshots/02-signin-attempts.png)`

---

## 🔄 Expire User Password and Clear Sessions

### Step 1: Expire Password
- Navigate to **Directory → People → [User] → More Actions → Expire Password**  
- Confirm the expiration  

### Step 2: Clear Active Sessions
- Go to **Security → Sessions → Clear User Sessions**  
- Select the affected user and confirm  

📸 **Screenshot Example:**  
`![Expire password](./screenshots/03-expire-password.png)`  
`![Clear sessions](./screenshots/04-clear-sessions.png)`

---

## 🔐 Troubleshoot App Access

### Step 1: Verify Assignments
- Navigate to **Applications → [App] → Assignments**  
- Ensure the user is assigned directly or via a group  

### Step 2: Check Dashboard Access
- Log in as the user in incognito mode  
- Confirm the application appears in the dashboard  
- If missing, check app provisioning logs  

📸 **Screenshot Example:**  
`![App assignment](./screenshots/05-app-assignment.png)`  
`![Dashboard access](./screenshots/06-dashboard-access.png)`

---

## 🧩 Troubleshoot Group Assignment Issues

### Step 1: Check Group Membership
- Navigate to **Directory → Groups → [Group] → Members**  
- Ensure the user is included in the correct group  

### Step 2: Verify Group Rules
- Go to **Directory → Groups → Group Rules**  
- Check for any rules preventing automatic membership  

📸 **Screenshot Example:**  
`![Group membership](./screenshots/07-group-membership.png)`  
`![Group rules](./screenshots/08-group-rules.png)`

---

## 📜 Using Okta System Log

- Navigate to **Reports → System Log**  
- Filter by **User** or **Application** to identify errors  
- Review timestamps, actions, and outcomes to troubleshoot issues  

📸 **Screenshot Example:**  
`![System log filter](./screenshots/09-system-log.png)`  
`![System log details](./screenshots/10-system-log-details.png)`

---

## ✅ Expected Behavior

- Users can sign in successfully after issues are resolved  
- Expired passwords and cleared sessions enforce new login requirements  
- Applications appear correctly in user dashboards  
- Group assignments and rules apply as expected  
- System Log entries match the actions taken  

---

## 🔄 Optional Enhancements

- Enable alerts for failed sign-ins or app provisioning failures  
- Automate session clearances or account unlocks using Okta Workflows  
- Periodically review System Log for recurring errors  

---

## 🔗 Next Steps

You’ve successfully troubleshooted common user and app access issues in Okta.  
Next, you’ll monitor events using Syslog and learn how to access Okta support resources.

➡️ Continue to: [Syslog & Okta Support](./syslog-support.md)
