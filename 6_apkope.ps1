$file = "Servisi.log"
$services = "Spooler", "wuauserv"

foreach ($name in $services) {
$status = (Get-Service -Name $name).Status
$time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
"[$time] Serviss [$name] ir [$status]." | Out-File -FilePath $file -Append
}
