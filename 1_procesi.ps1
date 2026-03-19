$outputPath = "$env:USERPROFILE\Documents\Large Processes.csv"
Get-Process | Where-Object { 
    $_.WorkingSet -gt 150MB -and $_.Name -ne "msedge" 
} | Select-Object Name, Id, WorkingSet | Export-Csv -Path $outputPath -NoTypeInformation

Write-Host "Informācija ir saglabāta failā: $outputPath"
