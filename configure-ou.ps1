# configure-ou.ps1

# Demande le nom de l'OU à créer
$ouName = Read-Host "Entrez le nom de l'OU à créer (ex: Comptabilité)"

# Demande le chemin de la racine où créer l'OU (ex: "DC=formation,DC=local")
$rootPath = Read-Host "Entrez le chemin LDAP de la racine (ex: DC=formation,DC=local)"

# Construction du chemin complet de la nouvelle OU
$ouPath = "OU=$ouName,$rootPath"

# Création de l'OU
New-ADOrganizationalUnit -Name $ouName -Path $rootPath -ProtectedFromAccidentalDeletion $true

Write-Host "✅ OU '$ouName' créée sous '$rootPath'."
