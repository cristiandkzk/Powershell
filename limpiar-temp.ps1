# Limpieza de temporales de usuario y sistema
$tempPaths = @($env:TEMP, "$env:WINDIR\Temp")
foreach ($path in $tempPaths) {
    Write-Host "Limpiando: $path"
    Get-ChildItem -Path $path -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
}
Write-Host "Limpieza completada."
