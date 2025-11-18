# 🧩 Attribute Mapping & Offboarding  

⬅️ [Back to Okta IAM Lab Overview](./README.md)

This walkthrough covers how to map user attributes between Okta and an integrated application, and how to manage offboarding by deactivating users and verifying access removal.

---

## 📚 What This Lab Covers

- Mapping user attributes between Okta and a connected application  
- Extending the Okta user profile with custom attributes  
- Configuring attribute mapping in provisioning settings  
- Deactivating users and verifying that access to apps is removed  

---

## 📝 What You’ll Need

- 🔹 Okta Developer or Enterprise Org  
- 🔹 Administrator privileges (Super Admin or equivalent)  
- 🔹 A test application integrated via SAML/OIDC or SCIM  
- 🔹 Test users and groups created from previous labs  

---

## 🔗 Map Attributes Between Okta and an App

### Step 1: Open App Provisioning Settings
- Navigate to **Applications → [Your App] → Provisioning → To App**  
- Click **Edit Attribute Mappings**  

### Step 2: Configure Mappings
- Map Okta attributes to application attributes, for example:  
  - Okta **firstName** → App **givenName**  
  - Okta **lastName** → App **surname**  
  - Okta **email** → App **userPrincipalName**  
- Click **Save Mappings**  

📸 **Screenshot Example:**  
`![Attribute mapping page](./screenshots/01-attribute-mapping.png)`  
`![Edit mapping confirmation](./screenshots/02-mapping-saved.png)`

### Step 3: Test Attribute Mapping
- Update a user attribute in Okta (e.g., change last name)  
- Verify the updated value syncs to the app after the next provisioning cycle  

📸 **Screenshot Example:**  
`![Attribute updated in app](./screenshots/03-attribute-sync.png)`

---

## 🧹 Deactivate a User

### Step 1: Deactivate the User in Okta
- Navigate to **Directory → People → [User] → More Actions → Deactivate**  
- Confirm deactivation  

### Step 2: Verify Access Removal
- Attempt to log in to the integrated app with the deactivated user account  
- Access should be denied  
- Check the app’s provisioning logs to ensure deactivation was synced  

📸 **Screenshot Example:**  
`![Deactivate user in Okta](./screenshots/04-deactivate-user.png)`  
`![Access denied confirmation](./screenshots/05-user-access-denied.png)`

---

## 🔄 Optional Enhancements

- Automate deactivation workflows with Okta Workflows  
- Extend attribute mapping to include custom attributes (e.g., EmployeeID, Department)  
- Enable notifications to app owners or managers upon user deactivation  
- Configure automated offboarding for group membership changes  

---

## ✅ Expected Behavior

- Attribute changes in Okta sync correctly to the app  
- Deactivated users can no longer access the integrated application  
- Logs reflect successful mapping and deprovisioning  

---

## 🔗 Next Steps

You’ve successfully mapped attributes and managed offboarding for users in Okta.  
Next, you’ll configure **security enforcement policies including MFA and authentication rules**.

➡️ Continue to: [Authentication & MFA Policies](./authentication-mfa-policies.md)
