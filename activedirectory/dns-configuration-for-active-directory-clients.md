# 🌐 DNS Configuration for Domain-Joined Windows Clients

⬅️ [Back to Active Directory (On-Prem) Lab Overview](./README.md)

This walkthrough shows how to configure DNS on a Windows 10 client so it can locate and join an Active Directory domain hosted on Windows Server 2019. Proper DNS setup is essential for successful domain joins, Group Policy processing, and Active Directory authentication.

---

## 📚 What This Lab Covers

- Configuring a static IP and loopback DNS on the Domain Controller  
- Installing and configuring NAT using Remote Access  
- Installing DHCP and setting up a scope  
- Configuring a Windows 10 client for domain connectivity  
- Joining the Windows 10 client to the AD domain

---

## 📝 What You’ll Need

🔹 **Windows Server 2019** VM with Active Directory and DNS installed  
🔹 **Windows 10** VM on the same **Internal Network** (VirtualBox)  
🔹 Two VirtualBox network adapters:  
- Adapter 1: NAT (for internet)  
- Adapter 2: Internal Network (e.g., `intnet`)  

> 💡 If using VirtualBox, you must use **two adapters**: one for NAT and one for the internal lab network.

---

## 🛠️ Configure Static IP and DNS on Domain Controller

### Step 1: Assign Static IP to DC

- Right-click the **network icon** in the system tray → **Open Network & Internet settings**  
- Click **Change adapter options**  
- Right-click the **Internal Network adapter** (usually `Ethernet 2` or renamed to `_Internal_`) → **Properties**  
- Select **Internet Protocol Version 4 (TCP/IPv4)** → **Properties**  
- Configure the following manually:
  - **IP address**: `192.168.56.1`
  - **Subnet mask**: `255.255.255.0`
  - **Default gateway**: *(leave blank)*
  - **Preferred DNS server**: `192.168.56.1` or loopback address 
  - **Alternate DNS server**: *(leave blank)*  
- Click **OK** → **OK**

📸 **Screenshots**:
![AD DS Role Overview](/activedirectory/screenshots/dns-config/01ad-ds-role-overview.png)

### How to Install DNS (If Not Already Installed)
- Open **Server Manager**
- Click **Add Roles and Features**
- Choose:
  - **Role-based or feature-based installation** → Your server
- On the Server Roles screen:
  - Check **DNS Server**
  - Click Add Features if prompted
- Continue through the wizard and click **Install**

---

## 🌐 Set Up NAT with Routing and Remote Access

### Step 2: Install Remote Access with NAT

- Open **Server Manager** → **Add Roles and Features**  
- Choose **Role-based or feature-based installation**  
- Select your server → Click **Next**  
- Choose **Remote Access** → Click **Next**  
- On Features screen → Click **Next**  
- Under Role Services → Select:
  - ✅ Routing  
  - (RAS and DirectAccess will auto-check)  
- Click **Next** → **Next** → **Next** → **Install**

📸 **Screenshots**:
![AD DS Role Overview](/activedirectory/screenshots/dns-config/01ad-ds-role-overview.png)

### Step 3: Enable NAT Routing

- After install, go to **Tools** → **Routing and Remote Access**  
- Right-click your server name → **Configure and Enable Routing and Remote Access**  
- Choose: **Network Address Translation (NAT)** → Click **Next**  
- Select: **Use this public interface to connect to the internet**  
- Choose your **Ethernet** adapter (Adapter 1 - NAT)  
- Click **Next** → **Finish**

📸 **Screenshots**:
![AD DS Role Overview](/activedirectory/screenshots/dns-config/01ad-ds-role-overview.png)

![AD DS Role Overview](/activedirectory/screenshots/dns-config/01ad-ds-role-overview.png)

---

## 📦 Install DHCP and Create a Scope

### Step 4: Install DHCP Role

- Open **Server Manager** → **Add Roles and Features**  
- Role-based installation → Select your server  
- Choose **DHCP Server** → Click **Add Features** when prompted  
- Click **Next** → **Install**

📸 **Screenshots**:
![AD DS Role Overview](/activedirectory/screenshots/dns-config/01ad-ds-role-overview.png)

### Step 5: Create DHCP Scope

- Go to **Tools** → **DHCP**  
- Expand your server → Right-click **IPv4** → **New Scope**  
- In the wizard:
  - **Scope Name**: `192.168.56.100-200`  
  - **Start IP**: `192.168.56.100`  
  - **End IP**: `192.168.56.200`  
  - **Subnet mask**: `255.255.255.0`  
- Click **Next** through options  
- Lease duration: Keep default (8 days)  
- Choose: `Yes, I want to configure these options now`  
- Configure:
  - **Router (Default Gateway)**: `192.168.56.1`
  - **Parent Domain**: `corp.lab` *(or your custom domain)*
  - **DNS Server**: `192.168.56.1`
- If **IPv4** and **IPv6** have red arrows right click your server → select **Authorize**
- right click **IPv4** → **Refresh** → right click IPv6 → **Refresh**

📸 **Screenshots**:
![AD DS Role Overview](/activedirectory/screenshots/dns-config/01ad-ds-role-overview.png)

### Step 6: Finalize DHCP Options

- Under **DHCP > IPv4 > Server Options**:
  - Right-click → **Configure Options**  
  - Check:
    - ✅ `003 Router` → `192.168.56.1`
    - ✅ `006 DNS Servers` → `192.168.56.1`  
- Click **Apply** → **OK**  
- Right-click your DHCP server → **All Tasks** → **Restart**

📸 **Screenshots**:
![AD DS Role Overview](/activedirectory/screenshots/dns-config/01ad-ds-role-overview.png)

---

## 💻 Configure Windows 10 Client

### Step 7: Assign Static IP or Use DHCP

**Option A: Static IP**
- Right-click **Network icon** → **Change adapter options**  
- Right-click **Ethernet 2** (internal adapter) → **Properties**  
- Select **IPv4** → **Use the following IP**  
  - **IP**: `192.168.56.2`  
  - **Subnet Mask**: `255.255.255.0`  
  - **Default Gateway**: `192.168.56.1`  
  - **Preferred DNS**: `192.168.56.1`

📸 **Screenshots**:
![AD DS Role Overview](/activedirectory/screenshots/dns-config/01ad-ds-role-overview.png)

**Option B: Use DHCP**
- Choose:
  - `Obtain an IP address automatically`  
  - `Obtain DNS server address automatically`  
- IP should be assigned from your configured DHCP scope

📸 **Screenshots**:
![AD DS Role Overview](/activedirectory/screenshots/dns-config/01ad-ds-role-overview.png)

### Step 8: Verify Connection

Open **Command Prompt**:

```cmd
ipconfig
ping 192.168.56.1
```
- You should see replies from the domain controller.

📸 **Screenshots**:
![AD DS Role Overview](/activedirectory/screenshots/dns-config/01ad-ds-role-overview.png)

![AD DS Role Overview](/activedirectory/screenshots/dns-config/01ad-ds-role-overview.png)

## 🏷️ Join the Domain

### Step 9: Join the Domain
- Go to **Settings** → **System** → **About** → **Rename this PC (Advanced)**
- Click **Change**
- Under **Member of**, choose **Domain**
- Enter your domain (e.g., corp.lab)
- Provide domain admin credentials
- **Restart** when prompted

📸 **Screenshots**:
![AD DS Role Overview](/activedirectory/screenshots/dns-config/01ad-ds-role-overview.png)

---

### ✅ Expected Behavior
- The Windows 10 client will reboot and be part of the domain
- You’ll be able to sign in with domain credentials (e.g., corp\jdoe)
- The machine becomes manageable from the domain controller (e.g., via GPO)

---

### 🔄 Optional Enhancements
- Configure DHCP on your network to issue DNS from the DC automatically
- Add **DNS forwarders** on your DC to allow internet access from domain clients
- Use PowerShell to join the domain:
  - ```Add-Computer -DomainName "corp.lab" -Credential "corp\administrator" -Restart```

--- 

🔗 Next Steps
➡️ [Create and apply GPOs to manage this device](./ou-gpo-management.md)  
➕ [Provision domain users and test logins](./user-group-management.md)  
🧪 [Test policy refresh and domain-wide settings](./active-directory-security.md)

