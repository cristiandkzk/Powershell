# Reporte del sistema exportado a TXT
$info = @{
    "Usuario" = $env:USERNAME
    "Equipo" = $env:COMPUTERNAME
    "Sistema Operativo" = (Get-CimInstance Win32_OperatingSystem).Caption
    "RAM Total (GB)" = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
    "Procesador" = (Get-CimInstance Win32_Processor).Name
    "Dirección IP" = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.PrefixOrigin -ne "WellKnown"}).IPAddress
}
$info.GetEnumerator() | Out-File "reporte_sistema.txt"
notepad "reporte_sistema.txt"
