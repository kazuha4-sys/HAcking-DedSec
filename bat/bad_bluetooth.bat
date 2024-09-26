# Obtemos a lista de dispositivos Bluetooth emparelhados
$devices = Get-PnpDevice -Class Bluetooth

# Se houver dispositivos encontrados, exiba suas informações
if ($devices) {
    foreach ($device in $devices) {
        Write-Output "Nome: $($device.Name)"
        Write-Output "Status: $($device.Status)"
        Write-Output "Descrição: $($device.Description)"
        Write-Output "-----------------------------------"
    }
} else {
    Write-Output "Nenhum dispositivo Bluetooth encontrado."
}
