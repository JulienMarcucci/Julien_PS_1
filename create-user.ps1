# create-user.ps1

# Demande les informations nécessaires
$firstName = Read-Host "Prénom de l'utilisateur"
$lastName = Read-Host "Nom de l'utilisateur"
$userName = "$firstName.$lastName"
$password = Read-Host "Mot de passe pour l'utilisateur (sera converti en SecureString)" -AsSecureString
$ouPath = Read-Host "Chemin LDAP de l'OU (ex: OU=Informatique,DC=formation,DC=local)"

# Création du compte utilisateur
New-ADUser `
    -Name "$firstName $lastName" `
    -GivenName $firstName `
    -Surname $lastName `
    -SamAccountName $userName `
    -UserPrincipalName "$userName@formation.local" `
    -AccountPassword $password `
    -Path $ouPath `
    -Enabled $true

Write-Host "✅ Utilisateur '$userName' créé dans '$ouPath'."
