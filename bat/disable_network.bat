@echo off
title [DEDSEC] Desativar Conexão de Rede
color 0a
echo [DEDSEC] Desativando a conexão de rede...

REM Desativar adaptadores de rede
for /f "tokens=*" %%a in ('wmic nic where "NetEnabled=true" get DeviceID') do (
    if not "%%a"=="DeviceID" netsh interface set interface "%%a" admin=disable
)

echo [DEDSEC] Conexão de rede desativada com sucesso.
pause
exit
