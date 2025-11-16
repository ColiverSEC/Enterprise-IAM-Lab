# 📦 Application Integrations (SAML/OIDC)  

⬅️ [Back to Okta IAM Lab Overview](./README.md)

This walkthrough covers how to integrate applications from the **Okta Integration Network (OIN)** using SAML or OIDC, configure user provisioning, assign groups, and verify successful provisioning.

---

## 📚 What This Lab Covers

- Integrating an app from the OIN using SAML SSO  
- Configuring Just-in-Time (JIT) or SCIM user provisioning from Okta to an app  
- Assigning a group to an app  
- Verifying that users are successfully provisioned to the app  

---

## 📝 What You’ll Need

- 🔹 Okta Developer or Enterprise Org  
- 🔹 Administrator privileges (Super Admin or equivalent)  
- 🔹 Test users and groups created from the **User & Group Management** lab  
- 🔹 Target application (SAML/OIDC-compatible) from the OIN  
- 🔹 Browser (incognito recommended for testing)  

---

## 🔗 Integrate an App from the OIN

### Step 1: Browse the Okta Integration Network
- Navigate to **Applications → Browse App Catalog**  
- Search for a test application (e.g., **GitHub**, **Salesforce**, or a demo SAML app)  
- Click **Add** to start configuration  

### Step 2: Configure SAML Settings
- Fill in required SAML configuration fields:  
  - **Single Sign-On URL / ACS URL**  
  - **Audience URI / Entity ID**  
  - Optional: Default RelayState  
- Click **Next** and **Finish** configuration  

📸 **Screenshot Example:**  
`![App selection](./screenshots/01-app-selection.png)`  
`![SAML configuration](./screenshots/02-saml-config.png)`

---

## 🔄 Configure User Provisioning

### Step 1: Enable Provisioning
- Navigate to **Applications → [Your App] → Provisioning → Integration**  
- Select **Enable API Integration** (SCIM or OIN-supported provisioning)  
- Enter required API credentials or token provided by the app  
- Test API credentials to confirm connectivity  

### Step 2: Set Provisioning Options
- Enable the following actions (if supported):  
  - **Create Users**  
  - **Update User Attributes**  
  - **Deactivate Users**  
- Save changes  

📸 **Screenshot Example:**  
`![Provisioning setup](./screenshots/03-provisioning-setup.png)`  
`![Test API integration](./screenshots/04-provisioning-test.png)`

---

## 🧑‍🤝‍🧑 Assign a Group to the App

### Step 1: Navigate to Assignments
- Go to **Applications → [Your App] → Assignments → Assign → Assign to Groups**  
- Select a test group (e.g., `Finance Team`)  
- Click **Assign**  

### Step 2: Verify Assignment
- Ensure the group is listed under **Assigned Groups**  
- Review which users are included based on group membership  

📸 **Screenshot Example:**  
`![Assign group to app](./screenshots/05-assign-group.png)`  
`![Assigned users preview](./screenshots/06-assigned-users.png)`

---

## ✅ Verify User Provisioning

### Step 1: Trigger Provisioning
- Provision a user in Okta (e.g., add a user to the assigned group)  
- Check the target application to confirm the account is created automatically  

### Step 2: Validate User Access
- Log in as the provisioned user to the app via **SSO**  
- Confirm access and correct attribute mapping (e.g., name, email)  

📸 **Screenshot Example:**  
`![User provisioned](./screenshots/07-user-provisioned.png)`  
`![SSO login confirmation](./screenshots/08-sso-success.png)`

---

## 🔄 Optional Enhancements

- Map custom attributes between Okta and the application  
- Configure group-based application access policies  
- Automate app assignments using Okta Workflows  
- Enable Just-in-Time provisioning for apps without SCIM  

---

## 🔗 Next Steps

You’ve successfully integrated an application from the OIN, enabled provisioning, and assigned groups.  
Next, you’ll configure **attribute mapping and offboarding workflows** for automated user lifecycle management.

➡️ Continue to: [Attribute Mapping & Profile Management](./attribute-mapping.md)

