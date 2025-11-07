# 🛠️ Enterprise IAM Lab — VM Setup Guide

This guide covers the **initial setup of your virtual lab environment VMs** for the Enterprise IAM Lab. It focuses on installing the operating systems and preparing the machines so they’re ready for domain and cloud lab walkthroughs.

---

## 🖥️ Prerequisites

- **Hardware Requirements**
  - Minimum 16 GB RAM
  - 4 CPU cores
  - 100 GB free disk space
- **Hypervisor**
  - VMware Workstation, VirtualBox, or Hyper-V
- **Windows ISO Images**
  - Windows Server 2019 (for Domain Controller)
  - Windows Server 2022 (for cloud environment)
  - Windows 10 or 11 (for client)
- **Network**
  - NAT or Host-Only network configured for VM communication

---

## 1️⃣ Download Windows ISO Images

1. Go to [Microsoft Software Download](https://www.microsoft.com/en-us/software-download/)
2. Download the following:
   - **Windows Server 2019** → save as `C:\ISOs\WindowsServer2019.iso`
   - **Windows Server 2022** → save as `C:\ISOs\WindowsServer2022.iso`
   - **Windows 10 or 11** → save as `C:\ISOs\Windows10.iso` or `C:\ISOs\Windows11.iso`

> 💡 Tip: Use the Pro edition for clients, Standard or Datacenter edition for servers.

---

## 2️⃣ Create Virtual Machines

You will create **three VMs**:

### 1. Domain Controller VM
- Name: `DC01`
- OS: Windows Server 2019
- CPU: 2 vCPU
- RAM: 8 GB
- Disk: 60 GB
- Network: Internal/Host-Only
- ISO: `WindowsServer2019.iso`

### 2. Cloud Environment VM
- Name: `CLOUD01`
- OS: Windows Server 2022
- CPU: 2 vCPU
- RAM: 8 GB
- Disk: 60 GB
- Network: Same as `DC01`
- ISO: `WindowsServer2022.iso`

### 3. Client VM
- Name: `CLIENT01`
- OS: Windows 10 or 11 Pro
- CPU: 2 vCPU
- RAM: 4 GB
- Disk: 50 GB
- Network: Same as `DC01`
- ISO: `Windows10.iso` or `Windows11.iso`

---

## 3️⃣ Steps to Create the VMs

1. Open your hypervisor (VMware, VirtualBox, Hyper-V)
2. Click **New VM** and select the ISO file for the OS
3. Allocate CPU, RAM, and disk as specified above
4. Configure the network to **Host-Only** or **Internal** for lab isolation
5. Complete OS installation using default settings
6. After installation, take a **snapshot** named `Base OS Installation`

---

## ✅ Your VMs Are Ready

- All three VMs are installed and bootable
- Snapshots are created for safe restoration
- Machines are ready for domain joining, Active Directory, and cloud lab walkthroughs
