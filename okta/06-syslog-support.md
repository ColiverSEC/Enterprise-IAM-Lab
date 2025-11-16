# 📡 Syslog & Okta Support  

⬅️ [Back to Okta IAM Lab Overview](./README.md)

This walkthrough covers how to monitor events in Okta using the System Log and locate resources for help and support, including submitting support cases and using the Okta community.

---

## 📚 What This Lab Covers

- Finding and filtering events in the Okta System Log  
- Troubleshooting using log events  
- Identifying Okta support resources  
- Submitting a support case in Okta  
- Using the Okta Status page and community resources  

---

## 📝 What You’ll Need

- 🔹 Okta Developer or Enterprise Org  
- 🔹 Administrator privileges (Super Admin or equivalent)  
- 🔹 Test users and groups created from previous labs  
- 🔹 Browser (incognito recommended for testing)  

---

## 👀 Find Events in System Log

### Step 1: Navigate to System Log
- Go to **Reports → System Log** in the Okta Admin Console  

### Step 2: Filter Events
- Use filters to narrow by **User**, **Application**, **Event Type**, or **Date Range**  
- Example: filter `User = test.user@domain.com` and `Event Type = User Authentication`  

### Step 3: Review Event Details
- Click an event to see full details: timestamp, actor, outcome, and affected resources  

📸 **Screenshot Example:**  
`![System log overview](./screenshots/01-system-log-overview.png)`  
`![System log details](./screenshots/02-system-log-details.png)`

---

## 🛠 Identify Okta Support Resources

### Step 1: Okta Help Center
- Navigate to [https://help.okta.com](https://help.okta.com)  
- Search knowledge base articles for your issue  

### Step 2: Submit a Support Case
- Go to **Help → Submit a Case** in the Admin Console  
- Fill in details about the issue, attach screenshots or System Log events, and submit  

### Step 3: Use the Okta Status Page
- Visit [https://status.okta.com](https://status.okta.com)  
- Check for known outages or service disruptions  

### Step 4: Okta Community
- Access the [Okta Community](https://community.okta.com)  
- Ask questions, share experiences, or find solutions for common issues  

📸 **Screenshot Example:**  
`![Okta help center](./screenshots/03-okta-help.png)`  
`![Submit support case](./screenshots/04-submit-case.png)`  
`![Okta status page](./screenshots/05-status-page.png)`  

---

## ✅ Expected Behavior

- System Log events can be filtered and reviewed to troubleshoot user and application issues  
- Support resources are correctly identified, and a support case can be submitted successfully  

---

## 🔄 Optional Enhancements

- Set up automated alerts or reports from the System Log  
- Integrate System Log monitoring with SIEM tools (e.g., Splunk, QRadar)  
- Track recurring events to proactively address potential issues  

---

## 🔗 Next Steps

You’ve successfully monitored Okta events and explored available support resources.  
Next, you can review security enforcement policies or continue building advanced Okta workflows.

➡️ Return to: [Okta IAM Lab Overview](./README.md)
