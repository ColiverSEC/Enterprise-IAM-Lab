# 📊 Monitoring & Reporting  

⬅️ [Back to Entra ID Lab Overview](./README.md)

This walkthrough covers how to monitor and report on Microsoft Entra ID activities. You’ll review **sign-in and audit logs**, configure **diagnostic logs**, and use **workbooks** or **Microsoft Sentinel dashboards** to visualize security events and trends.

---

## 📚 What This Lab Covers

- Reviewing **sign-in logs** for users and applications  
- Reviewing **audit logs** for administrative changes  
- Enabling and analyzing **diagnostic logs**  
- Creating or using **workbooks** for monitoring trends  
- Optional: integrating with **Microsoft Sentinel** for centralized monitoring  

---

## 📝 What You’ll Need

🔹 Microsoft Entra ID tenant with **Global Administrator or Security Administrator** privileges  
🔹 Test users performing sign-ins and administrative actions  
🔹 Optional: Microsoft Sentinel workspace for enhanced monitoring  

---

## 📈 Review Sign-In Logs

### Step 1: Navigate to Sign-In Logs

- Go to **Entra Admin Center → Monitoring → Sign-in logs**  
- Review recent sign-ins including:
  - User  
  - Application accessed  
  - Sign-in status (success/failure)  
  - Location and device information  

📸 **Screenshot Example:**  
![Sign in Logs](/entra/screenshots/10-monitoring-and-reporting/01-sign-in-logs.png)

### Step 2: Filter and Analyze

- Filter by user, risk level, location, or application  
- Look for suspicious or failed sign-ins  
- Export logs for offline analysis if needed  

📸 **Screenshot Example:**  
![Filter and Analyze](/entra/screenshots/10-monitoring-and-reporting/02-failed-sign-ins.png)

---

## 📝 Review Audit Logs

### Step 1: Navigate to Audit Logs

- Go to **Entra Admin Center → Monitoring → Audit logs**  
- Review actions such as:
  - User creation/deletion  
  - Role assignments  
  - Policy changes  
  - Group and access package changes  

📸 **Screenshot Example:**  
![Audit Log](/entra/screenshots/10-monitoring-and-reporting/03-audit-log.png)

### Step 2: Filter and Export

- Filter by **activity, user, or date range**  
- Export logs for compliance reporting or investigation  

📸 **Screenshot Example:**  
![Audit Log Filter and Analyze](/entra/screenshots/10-monitoring-and-reporting/04-export-audit-log.png)

---

## 🛠️ Enable Diagnostic Logs

### Configure Diagnostic Settings

- Navigate to **Entra Admin Center → Monitoring → Diagnostic settings**  
- Send logs to:
  - **Log Analytics workspace**  
  - **Storage account**  
  - **Event Hub** for SIEM integration  

---

## 📊 Use Workbooks and Dashboards

### Step 1: Explore Workbooks

- Go to **Azure Monitor → Workbooks → + New**  
- Use templates for **sign-in trends, risky sign-ins, or audit activity**  
- Visualize metrics like:
  - Sign-in failures per day  
  - Risky users over time  
  - Policy enforcement outcomes  


### Step 2: Optional: Use Microsoft Sentinel

- Connect **Entra ID logs** to **Microsoft Sentinel**  
- Use built-in dashboards to monitor security events  
- Create custom queries and alerts for suspicious activities  

---

## ✅ Expected Behavior

- Sign-in logs reflect all user authentication events  
- Audit logs show changes to users, groups, roles, and policies  
- Diagnostic logs are sent to configured workspaces or SIEMs  
- Workbooks and dashboards provide clear visualization of activity trends  
- Alerts in Sentinel trigger for abnormal or risky events  

---

## 🔄 Optional Enhancements

- Schedule automatic log exports for compliance audits  
- Create **custom alert rules** in Sentinel for risky sign-ins or policy violations  
- Integrate with **Power BI** for advanced reporting and dashboards  
- Use **Access Reviews and Identity Protection reports** in combination with monitoring  

---

## 🔗 Next Steps

You’ve successfully set up monitoring and reporting for Microsoft Entra ID.  
Next, you’ll configure **Global Secure Access** to manage network-level access for users and devices.

➡️ [Continue to: Global Secure Access](./global-secure-access.md)

