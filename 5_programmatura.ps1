$msStoreApps = Get-AppxPackage | Where-Object { $_.SignatureKind -eq "Store" }
$appCount = $msStoreApps.Count
Write-Host "[$appCount] apps from the Microsoft Store are installed on the system."
