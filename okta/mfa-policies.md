# 🔐 Okta MFA Policy Configuration Walkthrough

## 📝 What This Covers
- Setting up factor enrollment
- Creating and applying MFA policies
- Assigning to specific apps or groups
- Testing MFA prompt and enforcement

## 🛠️ Steps to Configure MFA

1. **Enable Factor Enrollment**
   - Go to *Security* → *Multifactor* → *Factor Enrollment*
   - Add factors: Okta Verify, SMS, Email

2. **Create a New Policy**
   - Go to *Security* → *Authentication Policies*
   - Name: `Require MFA for Okta Apps`
   - Conditions: `Users in Group`, or `All users`

3. **Apply to an App**
   - Go to the app → *Sign-on* tab → *Authentication Policy*

4. **Test User Sign-In**

📸 Screenshots:
- Factor enrollment screen  
- MFA prompt during login  
- Policy applied to specific apps

## ✅ Expected Behavior
- Users see MFA prompt upon sign-in  
- Okta logs enforcement actions in **System Log**

