$services = @("Spooler", "wuauserv")
$logFile = "Services.log"
$timestamp = Get-Date -Format "dd.MM.yyyy HH:mm:ss"
foreach ($serviceName in $services) {
    try {
        
        $service = Get-Service -Name $serviceName -ErrorAction Stop
        $status = $service.Status
        
       
        $logEntry = "[$timestamp] Service $serviceName is in $status."
        Add-Content -Path $logFile -Value $logEntry
    }
    catch {
      
        $logEntry = "[$timestamp] Service $serviceName could not be found."
        Add-Content -Path $logFile -Value $logEntry
    }
}
