$filePath = Join-Path -Path $HOME -ChildPath "Documents\Warnings.txt"
$startDate = (Get-Date).AddDays(-3)
$allWarnings = Get-WinEvent -FilterHashtable @{
    LogName = 'Application'
    Level = 3
    StartTime = $startDate
} -ErrorAction SilentlyContinue
$allWarnings | Select-Object TimeCreated, Source, Id, Message | 
    Out-File -FilePath $filePath -Force
$summary = $allWarnings | Group-Object Source | 
    Sort-Object Count -Descending | 
    Select-Object -First 3
Add-Content -Path $filePath -Value "`r`n--- TOP 3 BRĪDINĀJUMU AVOTI ---"
$summary | Select-Object Name, Count | Add-Content -Path $filePath
Write-Host "Skripts pabeigts. Rezultāti saglabāti: $filePath" -ForegroundColor Green
