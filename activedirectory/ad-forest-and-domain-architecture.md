# Active Directory Forest and Domain Architecture

⬅️ [Back to Active Directory (On-Prem) Lab Overview](./README.md)

---

## 📝 Introduction

Active Directory (AD) is organized into logical containers called forests and domains. Understanding the architecture of forests and domains is essential for designing a secure, scalable, and manageable AD environment.

This walkthrough covers core concepts of forests, domains, trusts, and design considerations, along with a hands-on lab to create and explore your own AD forest and domain.

---

## 📚 Concepts Overview

### 🌲 Active Directory Forests

- **What is a Forest?**  
  Top-level container and security boundary containing one or more domains sharing schema, config, and global catalog.

- **Forest Root Domain**  
  First domain in a forest holding forest-wide roles and policies.

- **Schema and Global Catalog**  
  Forest schema defines object types and attributes; Global Catalog holds a partial replica of all forest objects.

- **Forest-wide Policies**  
  Policies that apply across all domains in the forest.

### 🏷️ Active Directory Domains

- **What is a Domain?**  
  Logical group of users, computers, and groups sharing a directory database and security policies.

- **Domain Naming**  
  DNS-compatible names (e.g., `corp.lab`) with legacy NetBIOS names.

- **Domain Controllers (DCs)**  
  Servers with writable copies of the domain database, providing authentication and directory services.

- **Domain Replication and Sites**  
  DCs replicate changes; Sites define physical network topology to optimize replication.

### 📂 Organizational Units (OUs)

Containers within domains to organize objects and delegate administration. Not security or replication boundaries.

_See [OU and GPO Management](./ou-gpo-management.md) for details._

### 🔐 Trust Relationships
*This lab does not configure any child or external trusts.*

Enable users in one domain/forest to access resources in another.

- **Types of Trusts:**  
  - Parent-child (same forest)  
  - Tree-root (between trees in forest)  
  - External (between different forests)  
  - Forest trusts (between forests)

- **Trust Transitivity:**  
  Some trusts extend access transitively beyond two domains.

- **Authentication Flow:**  
  Trusts allow cross-domain/forest authentication as permitted.

### ⚙️ Design Considerations

- **When to Create Multiple Domains/Forests:**  
  - Separate security boundaries  
  - Regulatory or organizational requirements  
  - Administrative delegation needs

- **Security vs Administrative Boundaries:**  
  Forests are strict security boundaries; domains serve administrative delegation.

- **Replication & Management Impact:**  
  More domains/forests add replication complexity and management overhead.

- **Best Practices:**  
  - Minimize number of forests  
  - Use domains for delegation  
  - Use sites to optimize replication

---

## 🖥️ Hands-On Lab: Create and Explore an AD Forest and Domain

### Prerequisites

- Windows Server VM (2016/2019/2022 recommended) with Administrator access  
- Static IP configured  
- Permissions to install AD DS role

---

> 🧰 VM Setup (Quick Overview)
> Before starting, ensure you have the following:
>
> A Windows Server 2016/2019/2022 VM (Hyper-V, VirtualBox, VMware, or cloud VM)
>
> 2 vCPUs and at least 4GB RAM recommended
>
> A static IP address configured (for DNS reliability)
>
> Administrator access to install server roles
>
> ⚠️ Skip this step if you're using a prebuilt Windows Server VM with a static IP already configured.

---

### Step 1: Install Active Directory Domain Services (AD DS)

- Open **Server Manager**  
- Select **Add roles and features**  
- Choose **Role-based or feature-based installation**  
- Select your server  
- Check **Active Directory Domain Services** role  
- Complete the wizard by clicking **Next** through the rest of the options until **Install**

📸 **Screenshots**:
![AD DS Role Overview](/activedirectory/screenshots/ad-forest/01ad-ds-role-overview.png)
![AD Role Installed](/activedirectory/screenshots/ad-forest/02ad-ds-installed.png)


---

### Step 2: Promote Server to Domain Controller and Create New Forest

- Click **Promote this server to a domain controller** in Server Manager.
- Choose **Add a new forest**.
- Enter root domain name (e.g., `corp.lab`).
- Set forest/domain functional levels (latest supported).  
- Provide DSRM password.  
- Review and install; server will reboot.

📸 **Screenshots**: 
![Promote Server](/activedirectory/screenshots/ad-forest/03promote-server.png)
![Add Forest](/activedirectory/screenshots/ad-forest/04add-forest.png)
![Configure Domain Controller](/activedirectory/screenshots/ad-forest/05domain-controller-options.png)
---

### Step 3: Explore the New Forest and Domain

- Click **Start Menu** → **Windows Administrative Tools** →  **Active Directory Users and Computers (ADUC)**.
- Expand domain node (e.g., `corp.lab`).  
- View default containers like **Users**, **Computers**, **Domain Controllers**.

📸 **Screenshots**: 
![Default Containers](/activedirectory/screenshots/ad-forest/06default-containers.png)

---

### 🧭 Optional Exploration:
> If you later choose to expand your forest, you can revisit Active Directory Domains and Trusts to create child domains and configure trust relationships. For now, this lab uses a single-domain structure.

---

🧩 Use Case Example: Building a Corporate Directory

Scenario:
A growing company needs a centralized directory service to manage employees, secure access to internal apps, and enable future cloud sync.

🛠 Steps Taken:
- Forest and Domain Creation: A new IDSentinelSolutions.com domain is created to serve as the organization’s root and only domain.
- Domain Controller Deployment: AD DS is installed and configured on a secure Windows Server VM.

✅ Outcome:
- A functional AD forest and domain are created
- You can manage users, groups, and OUs using Active Directory tools
- This provides a foundation for secure identity management and future cloud integration

This foundation supports secure, scalable Active Directory environments.

---

## 🔗 Next Steps

Now that your forest and domain are operational:

➡️ [Organize OUs and apply GPOs](./ou-gpo-management.md)  
Structure your directory for policy-based management and delegation.

➕ [Provision users and groups](./user-and-group-management.md)  
Start creating user accounts, managing groups, and controlling access.

🌐 [Configure DNS for domain clients](./dns-configuration-for-active-directory-clients.md)  
Ensure proper name resolution and domain join reliability.

🔗 [Connect your AD to Microsoft Entra ID](https://github.com/ColiverSEC/Enterprise-IAM-Lab/blob/main/entra/hybrid-identity.md)  
Extend identity management into the cloud with hybrid sync.

