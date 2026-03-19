$source = "$env:USERPROFILE\Downloads"
$dest = "$env:USERPROFILE\Documents\PDF_Backup.zip"
$files = Get-ChildItem -Path $source -Filter *.pdf | Where-Object { $_.LastWriteTime -gt (Get-Date).AddHours(-48) }

if ($files) {
Compress-Archive -Path $files.FullName -DestinationPath $dest -Force
}
