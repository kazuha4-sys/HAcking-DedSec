@echo off
title Controle DedSec - Desligar PCs
color a
echo [C:\DEDSEC]: Iniciando controle remoto...
:: Lista de IPs dos dispositivos conectados à rede
set IP_LIST=192.168.1.101 192.168.1.102 192.168.1.103
for %%i in (%IP_LIST%) do (
    echo [C:\DEDSEC]: Desligando %%i...
    shutdown /m \\%%i /s /f /t 0
    timeout /t 1 >nul
)
echo [C:\DEDSEC]: Todos os dispositivos foram desligados.
pause
exit