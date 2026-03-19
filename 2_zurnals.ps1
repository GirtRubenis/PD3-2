$file = "$env:USERPROFILE\Documents\Warnings.txt"
$date = (Get-Date).AddDays(-3)
$warnings = Get-EventLog -LogName Application -EntryType Warning -After $date
$warnings | Out-File -FilePath $file
$groups = $warnings | Group-Object Source | Sort-Object Count -Descending | Select-Object -First 3
$groups | Out-File -FilePath $file -Append
