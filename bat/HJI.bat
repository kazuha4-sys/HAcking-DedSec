@echo off
title DEDSEC
color 0a
setlocal
set local_folder=%~dp0

echo [C:\DEDSEC]: Inicializando script 
cls 
echo [C:\DEDSEC]: Script inicializado

:input_ip
set /p ip="[C:\DEDSEC]: Digite o IP: "
echo [C:\DEDSEC]: Testando Conexão via Ping

ping -n 1 %ip% >nul

if errorlevel 1 (
    echo [C:\DEDSEC]: Falha na conexão com %ip%. Verifique o endereço e tente novamente.
    pause
    goto input_ip
)

echo [C:\DEDSEC]: Conexão via ping bem-sucedida. Iniciando varredura Nmap...
nmap -sS %ip% -oN "%local_folder%nmap-ss.txt"

echo [C:\DEDSEC]: Varredura Nmap concluída. Resultados salvos em nmap-ss.txt
pause
exit /b
