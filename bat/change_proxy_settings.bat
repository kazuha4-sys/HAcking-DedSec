@echo off
title [DEDSEC] Alterar Configurações de Proxy
color 0a
echo [DEDSEC] Alterando as configurações de proxy...

REM Configura o proxy no Internet Explorer
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "http=proxy.example.com:8080" /f

echo [DEDSEC] Configurações de proxy alteradas com sucesso.
pause
exit
