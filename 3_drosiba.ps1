$defenderStatus = Get-MpComputerStatus
$securityRating = 100
if ($defenderStatus.RealTimeProtectionEnabled -eq $false) {
    $securityRating -= 50
}
if ($null -ne $defenderStatus.AntivirusSignatureAge -and $defenderStatus.AntivirusSignatureAge -gt 3) {
    $securityRating -= 20
}
if ($null -ne $defenderStatus.QuickScanAge -and $defenderStatus.QuickScanAge -gt 7) {
    $securityRating -= 20
}
Write-Host "System Security Rating: $securityRating / 100"
