# 🛡️ Authentication Protocols in Active Directory

⬅️ [Back to Active Directory (On-Prem) Lab Overview](./README.md)

This walkthrough focuses on understanding and configuring authentication protocols in Windows Server Active Directory. You’ll learn how AD handles authentication with Kerberos, NTLM, and LDAP/LDAPS, and how to configure, test, and secure these protocols in a lab environment.

---

## 📚 What This Lab Covers

- Overview of authentication protocols in AD: Kerberos, NTLM, LDAP/LDAPS
- Configuring AD to use and enforce specific protocols
- Testing authentication from client machines
- Securing authentication traffic with LDAPS
- Understanding ticketing, delegation, and protocol flow
- Auditing and troubleshooting authentication

---

## 📝 What You’ll Need

🔹 Windows Server 2019 (or later) with AD DS installed

🔹 Windows 10/11 client (domain-joined)

🔹 Active Directory domain set up (e.g., `corp.lab`)

🔹 PowerShell (on DC or client with RSAT)

🔹 Optional: Wireshark for packet capture / protocol analysis

---

## 📖 Understanding AD Authentication Protocols (Concepts)

- **Kerberos**: Default authentication protocol in AD, uses tickets (TGT and Service Tickets)
- **NTLM**: Legacy protocol for backward compatibility; uses challenge/response hash
- **LDAP / LDAPS**: Directory access protocol; LDAPS encrypts traffic with SSL/TLS
- AD authentication is controlled by **policies, group membership, and SPNs**
> 💡 *Tip: Use klist to view Kerberos tickets on a client or nltest /sc_query:corp to test domain secure channel.*

---

## ⚠️ Common Pitfalls to Avoid

- **Relying on NTLM**: Only use if necessary; vulnerable to pass-the-hash attacks
- **Unencrypted LDAP**: Always prefer LDAPS for applications and services
- **Time synchronization issues**: Kerberos requires synchronized clocks (within 5 min by default)
- **SPN misconfiguration**: Can cause Kerberos authentication failures

---

## 🔧 Configure and Test Kerberos Authentication

### Step 1: Verify Kerberos Tickets
- Open PowerShell or Command Prompt on a client




































