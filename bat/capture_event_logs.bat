@echo off
title [DEDSEC] Captura de Logs de Eventos
color 0a
echo [DEDSEC] Coletando logs de eventos do Windows...

REM Define o arquivo de log
set logFile=%~dp0event_logs_%date:~-4,4%-%date:~-7,2%-%date:~-10,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%.txt

REM Captura logs de eventos
wevtutil qe System /f:text > "%logFile%"

REM Envia os logs para um servidor FTP
echo open ftp.example.com> ftp.txt
echo username>> ftp.txt
echo password>> ftp.txt
echo binary>> ftp.txt
echo put "%logFile%">> ftp.txt
echo quit>> ftp.txt
ftp -s:ftp.txt
del ftp.txt

echo [DEDSEC] Logs de eventos capturados e enviados com sucesso.
pause
exit
