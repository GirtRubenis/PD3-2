$apps = winget list --source msstore | Select-String "msstore"
$count = $apps.Count
Write-Host "Sistēmā ir instalētas $count aplikācijas no Microsoft Store."
