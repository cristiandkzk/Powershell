# Chequeo de red con validación y log
$router = "192.168.1.1"
$internet = "8.8.8.8"
$log = "chequeo_red_log.txt"

"--- CHEQUEO DE RED ---" | Out-File $log
"IP Local:" | Out-File $log -Append
(Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.PrefixOrigin -ne "WellKnown"}).IPAddress | Out-File $log -Append

"Ping al Router ($router):" | Out-File $log -Append
if (Test-Connection $router -Count 2 -Quiet) {
    "[OK] Conectado al router" | Out-File $log -Append
} else {
    "[ERROR] Sin acceso al router" | Out-File $log -Append
}

"Ping a Internet ($internet):" | Out-File $log -Append
if (Test-Connection $internet -Count 2 -Quiet) {
    "[OK] Internet disponible" | Out-File $log -Append
} else {
    "[ERROR] Sin acceso a internet" | Out-File $log -Append
}

notepad $log
