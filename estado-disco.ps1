# Estado de discos por volumen
Get-PSDrive -PSProvider 'FileSystem' | Select-Object Name, @{Name="Tamaño (GB)";Expression={[math]::Round($_.Used/1GB + $_.Free/1GB,2)}}, @{Name="Libre (GB)";Expression={[math]::Round($_.Free/1GB,2)}} | Format-Table
