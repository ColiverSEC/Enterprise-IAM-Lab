# 🌐 DNS Configuration for Domain-Joined Windows Clients

This walkthrough shows how to configure DNS on a Windows 10 client so it can locate and join an Active Directory domain hosted on Windows Server 2019. Proper DNS setup is essential for successful domain joins, Group Policy processing, and Active Directory authentication.

---

## 📚 What This Lab Covers

- Pointing a Windows client to the domain controller for DNS
- Verifying domain name resolution
- Joining a Windows 10 device to an Active Directory domain
- Optional PowerShell-based domain join

---

## 📝 What You’ll Need

🔹 **Windows Server 2019** with AD DS and DNS configured  
🔹 **Windows 10 VM** (client system)  
🔹 Both machines on the same network or virtual switch  
🔹 Static IP or DHCP reservation for the Domain Controller (recommended)

---

## 🔍 Quick Overview

You’ll configure the Windows 10 client to:
- Use the domain controller’s IP as its primary DNS
- Test DNS resolution of the domain
- Join the domain successfully

---

## 🛠️ DNS Configuration Steps

### 1️⃣ Identify the Domain Controller’s IP Address

- On your **Windows Server 2019** (Domain Controller):
  - Open **Command Prompt**
  - Run: `ipconfig`
  - Note the IPv4 address (e.g., `192.168.56.10`)

---

### 2️⃣ Configure DNS on Windows 10 Client

- Go to **Control Panel** → *Network and Sharing Center*  
- Click **Change adapter settings**  
- Right-click your active network → **Properties**  
- Select **Internet Protocol Version 4 (TCP/IPv4)** → Click **Properties**

- Set DNS manually:
  - **Preferred DNS server**: `192.168.56.10` (your domain controller IP)
  - **Alternate DNS server**: *(leave blank or set to internal DNS if available)*

> 💡 **Do not use public DNS (e.g., 8.8.8.8) — it will break domain name resolution.**

---

### 3️⃣ Test DNS Resolution

- Open **Command Prompt**:
```bash
nslookup corp.lab
