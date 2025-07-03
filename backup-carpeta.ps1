# Backup de carpeta con control de errores y log
$origen = "C:\MisDocumentos"
$destino = "D:\Backup"
$fecha = Get-Date -Format "yyyy-MM-dd_HH-mm"
$log = "backup_log_$fecha.txt"

if (Test-Path $origen) {
    Copy-Item -Path $origen -Destination $destino -Recurse -Force -ErrorAction SilentlyContinue
    "Backup completado: $fecha" | Out-File $log
    notepad $log
} else {
    "ERROR: Carpeta origen no encontrada." | Out-File $log
}
