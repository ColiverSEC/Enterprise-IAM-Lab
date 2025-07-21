# Connect to Azure AD
Connect-AzureAD

# Create 10 test users
for ($i = 1; $i -le 10; $i++) {
    $user = @{
        AccountEnabled = $true
        DisplayName = "Test User $i"
        PasswordProfile = @{
            Password = "Pass@1234"
            ForceChangePasswordNextLogin = $false
        }
        UserPrincipalName = "testuser$i@idsentinelsolutions.com"
        MailNickname = "testuser$i"
        UsageLocation = "US"
    }
    New-AzureADUser @user
}
