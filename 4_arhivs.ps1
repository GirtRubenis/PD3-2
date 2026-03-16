$downloadsPath = Join-Path "$env:USERPOFILE\Downloads"
$documentsPath = Join-Path "$env:USERPROFILE\Documents\"PDF_Backup.zip"


"
$backupPath = Join-Path $documentsPath


$limitDate = (Get-Date).AddHours(-48)

$filesToBackup = Get-ChildItem -Path $downloadsPath -Filter "*.pdf" | Where-Object {
    $_.LastWriteTime -gt $limitDate -or $_.CreationTime -gt $limitDate
}

if ($filesToBackup) {
    Compress-Archive -Path $filesToBackup.FullName -DestinationPath $backupPath -Force
    Write-Host "Rezerves kopija veiksmigi izveidota: $backupPath" -ForegroundColor Green
} else {
    Write-Host "Pedejo 48 stundu laika nav atrasts neviens jauns vai mainits PDF fails." -ForegroundColor Yellow
}
