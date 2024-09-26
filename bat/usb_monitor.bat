@echo off
title [DEDSEC] Coleta de Informações do Dispositivo
color 0a
echo [DEDSEC] Coletando informações do dispositivo via ADB...
setlocal

REM Definir o caminho para o adb.exe
set adb_path=C:\caminho\para\adb\platform-tools\adb.exe

REM Verificar se o dispositivo está conectado
echo Verificando se o dispositivo está conectado...
%adb_path% devices
echo.

REM Criar ou limpar o arquivo de log
set logFile=%~dp0device_info_log.txt
echo ============================== > %logFile%
echo Informações do Dispositivo >> %logFile%
echo ============================== >> %logFile%

REM Coletar informações gerais do sistema
echo Coletando informações gerais do sistema...
echo Informações Gerais do Sistema >> %logFile%
%adb_path% shell getprop >> %logFile%
echo.

REM Coletar informações da rede
echo Coletando informações da rede...
echo Informações de Rede >> %logFile%
%adb_path% shell ip -f inet addr show >> %logFile%
echo.

REM Coletar informações sobre o status da bateria
echo Coletando status da bateria...
echo Status da Bateria >> %logFile%
%adb_path% shell dumpsys battery >> %logFile%
echo.

REM Coletar informações sobre o armazenamento
echo Coletando informações sobre o armazenamento...
echo Informações de Armazenamento >> %logFile%
%adb_path% shell df -h >> %logFile%
echo.

REM Coletar informações sobre o estado do dispositivo
echo Coletando estado do dispositivo...
echo Estado do Dispositivo >> %logFile%
%adb_path% shell dumpsys >> %logFile%
echo.

REM Mostrar o log gerado
echo As informações foram salvas em %logFile%.
pause
exit
