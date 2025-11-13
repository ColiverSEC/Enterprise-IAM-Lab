# 🌍 Global Secure Access  

⬅️ [Back to Entra ID Lab Overview](./README.md)

This walkthrough covers how to configure **secure access policies for users and devices** in Microsoft Entra ID. You’ll manage **Internet vs private access**, **remote networks**, and **Conditional Access policies for network resources**.

---

## 📚 What This Lab Covers

- Configuring **Named Locations** (trusted IPs, countries, regions)  
- Configuring **Private Access** for internal applications  
- Integrating **VPNs and remote networks**  
- Applying **Conditional Access policies** based on network conditions  
- Monitoring and testing access from different locations  

---

## 📝 What You’ll Need

🔹 Microsoft Entra ID tenant with **Global Administrator** privileges  
🔹 Test users with devices that can simulate internal and external network access  
🔹 Optional: VPN setup or lab network to test private access  
🔹 Pre-configured Conditional Access policies (if following previous lab modules)  

---

## 🌐 Configure Named Locations

### Define Trusted Locations

- Go to **Entra Admin Center → Conditional Access → Named locations**  
- Click **+ New location** → choose **+ IP ranges location** (recommended for lab/testing)  
- Configure:
  - **Name:** e.g., `Corporate HQ`  
  - **IP ranges (CIDR blocks):** e.g., `10.0.0.0/24`  
- **Create**

💡 **Tip:** Using IP ranges is preferred in labs so you can simulate trusted/untrusted networks accurately.  

📸 **Screenshot Example:**  
![Trusted Location Defined](/entra/screenshots/11-global-secure-access/01-trusted-location-config.png)

---

## 🛡️ Configure Private Access

### Enable Private Access

- Navigate to **Entra Admin Center → Global Secure Access → Connect → Traffic forwarding**  
- Click **+ New Private Access Policy** or edit an existing one  
- Configure:
  - Internal applications accessible only from trusted networks  
  - Define **IP ranges, subnets, or VPN endpoints** for allowed access  
  - Optionally, enforce **device compliance or named locations** for policy conditions  
- Save the policy  

💡 **Summary:** Private Access lets you secure internal applications by restricting access to trusted networks, VPNs, or compliant devices. It ensures that sensitive apps are only reachable from approved locations, helping simulate enterprise network security in a lab environment.  

---

## 🌍 Configure Remote Networks / VPN

### Set Up Trusted Remote Networks

- Go to **Entra Admin Center → Global Secure Access → Conditional Access → Named locations**  
- Click **+ New location** and choose one of the available types:  
  - **IP ranges location** → Add VPN or remote office subnet IP ranges  
  - **Countries location** → Restrict access based on geographic location (optional)  
- Name your location (e.g., `HQ VPN` or `Remote Office`)  
- Mark the location as **trusted** to allow Conditional Access policies to recognize it  
- Ensure that the IP ranges you configure align with your Conditional Access rules for app access  

💡 **Tip:** Use **IP ranges location** for VPNs or specific remote offices. **Countries location** is optional and useful for broader geographic restrictions.  

📸 **Screenshot Example:**  
![Remote Trusted Network](/entra/screenshots/11-global-secure-access/02-remote-office-settings.png)


---

## ⚡ Apply Conditional Access for Network Resources

### Create Network-Based Conditional Access Policy

- Go to **Conditional Access → + New Policy**  
- **Name your policy**: `Lab - Network Resource Access Policy`  
  - This helps distinguish it as a lab/demo policy for controlling access based on network location.
- Configure the policy:
  - **Users/Groups**: Select the target users or groups who will be affected (e.g., all test users)  
  - **Cloud apps or actions**: Choose the apps or resources to protect (e.g., SharePoint, Teams, or lab apps)  
  - **Conditions → Locations**:
    - **Include**: All locations  
    - **Exclude**: Trusted named locations you defined earlier (e.g., `Corporate HQ`, `VPN Lab Network`)  
  - **Access controls → Grant**:
    - Require **Multi-Factor Authentication (MFA)** for users outside trusted networks  
    - Or **Block access** entirely for untrusted locations  
- **Enable policy**: Save and turn it on for lab testing  

💡 **Tip:** Naming policies clearly (e.g., including `Lab` in the name) helps prevent confusion with production policies. This policy simulates enforcing MFA or blocking access based on network location, helping you test Conditional Access behavior in a controlled environment.

📸 **Screenshot Example:**  
![Network based Conditional Access](/entra/screenshots/11-global-secure-access/03-remote-office-conditional-access.png)

---

## 🔁 Test Access

### Step 1: Verify Policy Enforcement

- Ensure your VM has two NICs configured:  
  - **Internal NIC** → `192.168.56.x` (your trusted lab network, domain-joined)  
  - **NAT NIC** → external/untrusted network  
- Test access from both network types:

### Step 2: Trusted Network (Internal NIC)

     - Use the Internal NIC (`192.168.56.2`) to connect your VM to the lab network
     - Log in to your Entra-protected application
     - Expected result: Seamless access, no MFA prompt 

### Step 3: Untrusted Network (NAT NIC)

- Disable or deprioritize the Internal NIC so NAT is used 
- Log in to the same application
- Expected result:
  - Conditional Access triggers MFA or blocks access, depending on your policy  
- Validate Conditional Access enforcement:  
  - MFA prompt appears for untrusted networks  
  - Access is blocked if conditions are violated  
  - Trusted networks allow seamless access  
- Optional: If you need to check network resolution for your internal domain, refer to your [DNS configuration walkthrough](https://github.com/ColiverSEC/Enterprise-IAM-Lab/blob/main/activedirectory/dns-configuration-for-active-directory-clients.md).

📸 **Screenshot Example:**  
![Test Policy](/entra/screenshots/11-global-secure-access/05-mfa-enforced-outside-of-range.png)
![Test Policy Success](/entra/screenshots/11-global-secure-access/04-test-access.png)

---

## ✅ Expected Behavior

- Users on trusted networks can access resources without extra prompts  
- Users on untrusted networks are blocked or required to perform MFA  
- VPN or private network access is correctly recognized by Conditional Access policies  
- All events are logged and visible in **sign-in logs**  

---

## 🔄 Optional Enhancements

- Enable **Continuous Access Evaluation (CAE)** for real-time policy enforcement  
- Integrate with **Microsoft Defender for Endpoint** for device-based access control  
- Configure **network-based access for hybrid applications** via App Proxy  
- Create alerts for suspicious network access or risky sign-ins  

---

## 🔗 Next Steps

You’ve successfully configured global secure access policies for users and devices.  
Next, you can review your **entire lab workflow**, validate settings, and ensure all identity security controls are working as expected.

➡️ End of Lab Series

