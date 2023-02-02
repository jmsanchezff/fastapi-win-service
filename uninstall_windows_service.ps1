
Write-Host "[*] Uninstalling FastAPI-Service ..."
$service = Get-WmiObject -Class Win32_Service -Filter "Name='FastAPI-Service'"
$service.stopservice()
$service.delete()
Write-Host "[OK] FastAPI-Service marked as deleted. It will not appear on reboot."