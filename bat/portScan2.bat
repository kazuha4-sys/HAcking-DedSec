@echo off
title DEDSEC: Nmap Port Scanner
color 0a
set local_flder=%~dp0

echo ===================================
echo [DEDSEC]: Nmap Port Scanner
echo ===================================

:: Solicitar o IP ou nome de host do alvo
set /p alvo="Digite o IP ou nome do host que deseja escanear: "
:: Testar conexao com o alvo atraves de bytes
ping %alvo% >> '%local_folder%portScan.txt'
ping %alvo%

:: Solicitar o intervalo de portas para escanear
set /p portas="Digite o intervalo de portas para escanear (ex: 1-1000): "

echo ===================================
echo [DEDSEC]: Escaneando o alvo %alvo% nas portas %portas%
echo ===================================

:: Executar o Nmap para escanear as portas especificadas
nmap -p %portas% %alvo% >> '%local_folder%'portScan.txt

echo ===================================
echo [DEDSEC]: Escaneamento concluído.
pause
exit
