$newName = Read-Host "Entrez le nouveau nom du PC"
Rename-Computer -NewName $newName -Force
Write-Host "Le nom du PC a été changé. Redémarrage en cours..."
Restart-Computer