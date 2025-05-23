# Liste des rôles à installer
$roles = @(
    "AD-Domain-Services",
    "DNS",
    "DHCP"
)

# Installation
Install-WindowsFeature -Name $roles -IncludeManagementTools

# Confirmation
Write-Host "Les rôles ADDS, DNS et DHCP ont été installés avec succès." -ForegroundColor Green