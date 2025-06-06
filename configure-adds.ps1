# configure-adds.ps1

$domainName = Read-Host "Entrez le nom de domaine (ex: formation.local)"
$secureDSRMPwd = Read-Host "Entrez le mot de passe DSRM" -AsSecureString

Install-ADDSForest -DomainName $domainName -SafeModeAdministratorPassword $secureDSRMPwd -CreateDnsDelegation $false -DatabasePath "C:\Windows\NTDS" -DomainMode WinThreshold -DomainNetbiosName ($domainName.Split('.')[0].ToUpper()) -ForestMode WinThreshold -InstallDns $true -LogPath "C:\Windows\NTDS" -SysvolPath "C:\Windows\SYSVOL" -NoRebootOnCompletion $false -Force

Read-Host "AD DS configuré. Appuyez sur Entrée pour fermer."
