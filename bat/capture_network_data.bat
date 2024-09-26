@echo off
title [DEDSEC] Capturar Dados de Rede
color 0a
echo [DEDSEC] Coletando dados de rede...

REM Define o arquivo de log
set networkFile=%~dp0network_data_%date:~-4,4%-%date:~-7,2%-%date:~-10,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%.txt

REM Coleta informações de rede
ipconfig /all > "%networkFile%"
netstat -ano >> "%networkFile%"

echo [DEDSEC] Dados de rede coletados com sucesso.
pause
exit
