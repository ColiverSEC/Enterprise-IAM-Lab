# Active Directory Forest and Domain Architecture

⬅️ [Back to Enterprise IAM Lab Overview](../README.md)

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

### Step 1: Install Active Directory Domain Services (AD DS)

1. Open **Server Manager**.  
2. Select **Add roles and features**.  
3. Choose **Role-based or feature-based installation**.  
4. Select your server.  
5. Check **Active Directory Domain Services** role.  
6. Complete the wizard.

> _Screenshot placeholder: AD DS role selection_

---

### Step 2: Promote Server to Domain Controller and Create New Forest

1. Click **Promote this server to a domain controller** in Server Manager.  
2. Choose **Add a new forest**.  
3. Enter root domain name (e.g., `corp.lab`).  
4. Set forest/domain functional levels (latest supported).  
5. Provide DSRM password.  
6. Review and install; server will reboot.

> _Screenshot placeholder: New forest creation_

---

### Step 3: Explore the New Forest and Domain

1. Open **Active Directory Users and Computers (ADUC)**.  
2. Expand domain node (e.g., `corp.lab`).  
3. View default containers like **Users**, **Computers**, **Domain Controllers**.

> _Screenshot placeholder: ADUC domain structure_

---

### Step 4 (Optional): Create a Child Domain

1. On another server, install AD DS role.  
2. Promote to domain controller, selecting **Add a new domain to existing forest**.  
3. Choose **Child Domain**, enter name (e.g., `sales.corp.lab`).  
4. Complete wizard and reboot.

> _Screenshot placeholder: Child domain creation_

---

### Step 5: View Trust Relationships

1. Open **Active Directory Domains and Trusts** MMC.  
2. Right-click domain → **Properties** → **Trusts** tab.  
3. Review trust relationships.

> _Screenshot placeholder: Trusts tab_

---

## 📝 Summary

You learned about:

- AD forests, domains, and trust relationships  
- How to create and explore an AD forest and domain  
- Understanding trust relationships and architecture  

This foundation supports secure, scalable Active Directory environments.

---

## 📖 Further Reading

- [Active Directory Forests and Domains (Microsoft Docs)](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/active-directory-forests-and-domains)  
- [Understanding Trusts (Microsoft Docs)](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/understanding-trusts)

---

⬅️ [Back to Enterprise IAM Lab Overview](../README.md)
