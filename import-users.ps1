# import-users.ps1

# Chemin vers le fichier CSV
$csvPath = Read-Host "Entrez le chemin complet du fichier CSV (ex: C:\Users\Administrateur\Desktop\utilisateurs.csv)"


# Nettoyer la variable en enlevant les espaces inutiles
$csvPath = $csvPath.Trim()

# Importation des utilisateurs
Import-Csv -Path $csvPath | ForEach-Object {
    $securePass = ConvertTo-SecureString $_.Password -AsPlainText -Force
    $upn = "$($_.Username)@formation.local"

    New-ADUser `
        -Name "$($_.FirstName) $($_.LastName)" `
        -GivenName $_.FirstName `
        -Surname $_.LastName `
        -SamAccountName $_.Username `
        -UserPrincipalName $upn `
        -Path $_.OU `
        -AccountPassword $securePass `
        -Enabled $true

    Write-Host "✅ Utilisateur '$($_.Username)' importé avec succès."
}
