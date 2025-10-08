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

### Step 1: Define Trusted Locations

- Go to **Entra Admin Center → Security → Conditional Access → Named locations**  
- Click **+ New location**  
- Configure:
  - Name (e.g., `Corporate HQ`)  
  - IP ranges (CIDR blocks)  
  - Country or region (optional)  

📸 **Screenshot Example:**  
`/entra/screenshots/global-secure-access/01-named-locations.png`

---

## 🛡️ Configure Private Access

### Step 2: Enable Private Access

- Navigate to **Entra Admin Center → Identity Governance → Private Access**  
- Configure:
  - Internal apps accessible only from private network  
  - Define IP ranges, subnets, or VPN endpoints  
  - Enable access policies based on device or location  

📸 **Screenshot Example:**  
`/entra/screenshots/global-secure-access/02-private-access.png`

---

## 🌍 Configure Remote Networks / VPN

### Step 3: Set Up Remote Networks

- Go to **Conditional Access → Named locations → + New location → Mark as trusted network**  
- Add **VPN IP ranges** or **remote office subnets**  
- Ensure network ranges align with Conditional Access rules  

📸 **Screenshot Example:**  
`/entra/screenshots/global-secure-access/03-remote-networks.png`

---

## ⚡ Apply Conditional Access for Network Resources

### Step 4: Create Network-Based Conditional Access Policy

- Go to **Conditional Access → + New Policy**  
- Configure:
  - **Users/Groups**: Select target users  
  - **Cloud apps**: Select apps or resources  
  - **Conditions → Locations**:
    - Include all locations  
    - Exclude trusted named locations (corporate network, VPN)  
  - **Grant**: Require MFA or block access  

📸 **Screenshot Example:**  
`/entra/screenshots/global-secure-access/04-network-ca-policy.png`

---

## 🔁 Test Access

### Step 5: Verify Policy Enforcement

- Test access from:
  - Trusted network (internal LAN or VPN)  
  - Untrusted network (external internet)  
- Validate Conditional Access enforcement:
  - MFA prompt appears for untrusted networks  
  - Access is blocked if conditions are violated  
  - Trusted networks allow seamless access  

📸 **Screenshot Example:**  
`/entra/screenshots/global-secure-access/05-test-access.png`

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

