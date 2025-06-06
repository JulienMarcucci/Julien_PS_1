# configure-group.ps1

# Demande le nom du groupe
$groupName = Read-Host "Entrez le nom du groupe à créer (ex: IT-Admins)"

# Demande le chemin LDAP de l'OU où créer le groupe (ex: OU=Informatique,DC=formation,DC=local)
$ouPath = Read-Host "Entrez le chemin LDAP de l'OU (ex: OU=Informatique,DC=formation,DC=local)"

# Création du groupe dans l'OU spécifiée
New-ADGroup -Name $groupName -Path $ouPath -GroupScope Global -GroupCategory Security

Write-Host "✅ Groupe '$groupName' créé dans '$ouPath'."
