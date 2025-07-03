# Monitoreo de servicio y reinicio si está detenido
$servicio = "Spooler"
$status = Get-Service -Name $servicio
if ($status.Status -ne "Running") {
    Restart-Service -Name $servicio
    Write-Host "Servicio $servicio reiniciado."
} else {
    Write-Host "Servicio $servicio ya está corriendo."
}
