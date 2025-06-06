# configure-dhcp.ps1

# Paramètres DHCP
$scopeName = Read-Host "Nom de la portée DHCP (ex: Portée-LAN)"
$scopeID = Read-Host "Adresse réseau de la portée (ex: 192.168.1.0)"
$startRange = Read-Host "Début de la plage IP (ex: 192.168.1.100)"
$endRange = Read-Host "Fin de la plage IP (ex: 192.168.1.200)"
$subnetMask = Read-Host "Masque de sous-réseau (ex: 255.255.255.0)"
$gateway = Read-Host "Adresse IP de la passerelle (ex: 192.168.1.1)"
$dnsServer = Read-Host "Adresse IP du serveur DNS (ex: 192.168.1.10)"
$domainName = Read-Host "Nom du domaine DNS (ex: formation.local)"

# Calcul automatique de l’ID de la portée à partir du réseau du début de plage
$scopeID = ($startRange -replace '\d+$','0')

# Créer une portée DHCP
Add-DhcpServerv4Scope -Name $scopeName -StartRange $startRange -EndRange $endRange -SubnetMask $subnetMask 
Write-Host "✅ Portée DHCP '$scopeName' créée."

# Définir l'option de la passerelle (option 003)
Set-DhcpServerv4OptionValue -ScopeId $scopeID -Router $gateway
Write-Host "✅ Passerelle définie : $gateway"

# Définir l'option DNS (option 006) et le domaine (option 015)
Set-DhcpServerv4OptionValue -ScopeId $scopeID -DnsServer $dnsServer -DnsDomain $domainName
Write-Host "✅ DNS défini : $dnsServer ($domainName)"

# Activer la portée
Set-DhcpServerv4Scope -ScopeId $scopeID -State Active
Write-Host "✅ Portée activée."
