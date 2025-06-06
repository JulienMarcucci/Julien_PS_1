# Demande le nom de la zone DNS
$zoneName = Read-Host "Entrez le nom de la zone DNS (ex: formation.local)"

# Vérifie si la zone existe déjà
if (-not (Get-DnsServerZone -Name $zoneName -ErrorAction SilentlyContinue)) {
    # Crée la zone de recherche directe principale
    Add-DnsServerPrimaryZone -Name $zoneName -ZoneFile "$zoneName.dns" -DynamicUpdate Secure
    Write-Host "Zone DNS $zoneName créée avec succès."
} else {
    Write-Host "La zone DNS $zoneName existe déjà."
}

# Ajoute un enregistrement A dans la zone
$hostname = Read-Host "Nom de l'hôte à ajouter (ex: serveur01)"
$ipAddress = Read-Host "Adresse IP de l'hôte (ex: 192.168.1.10)"
Add-DnsServerResourceRecordA -Name $hostname -ZoneName $zoneName -IPv4Address $ipAddress
Write-Host "Enregistrement A ajouté : $hostname.$zoneName -> $ipAddress"

# Configuration de la redirection DNS
$forwarderIP = Read-Host "Adresse IP du redirecteur DNS (ex: 8.8.8.8)"
Set-DnsServerForwarder -IPAddress $forwarderIP -UseRootHint $true
Write-Host "Redirecteur DNS configuré vers $forwarderIP"
