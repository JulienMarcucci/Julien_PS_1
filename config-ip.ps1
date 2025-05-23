# Demande à l'utilisateur les infos réseau
$ip = Read-Host "Entrez l'adresse IP"
$mask = Read-Host "Entrez le masque (ex: 24)"
$gateway = Read-Host "Entrez la passerelle"
$dns = Read-Host "Entrez l'adresse du DNS"

# Récupère la carte réseau connectée
$interface = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}

# Applique l'adresse IP et la passerelle
New-NetIPAddress -InterfaceAlias $interface.Name -IPAddress $ip -PrefixLength $mask -DefaultGateway $gateway

# Configure l'adresse DNS
Set-DnsClientServerAddress -InterfaceAlias $interface.Name -ServerAddresses $dns

Write-Host "Configuration IP appliquée avec succès."