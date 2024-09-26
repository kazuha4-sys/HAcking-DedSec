@echo off
title [DEDSEC] Registro de Aplicativos Executados
color 0a
echo [DEDSEC] Monitoramento de aplicativos iniciando...
setlocal

REM Definir o caminho da pasta atual (onde o arquivo .bat está)
set local_folder=%~dp0

REM Gerar a data e hora atual para um nome de arquivo único
set data=%date:~-4,4%-%date:~-7,2%
set hora=%time:~0,2%-%time:~3,2%-%time:~6,2%
set hora=%hora: =0%

REM Definir o arquivo de log para salvar as informações
set logFile=%local_folder%app_execution_log_%data%_%hora%.txt

REM Loop para monitorar a execução de novos programas
:monitor_loop
REM Capturar a lista de programas em execução e seu caminho
echo ============================== >> %logFile%
echo Aplicativos Executados - %date% %time% >> %logFile%
echo ============================== >> %logFile%
wmic process get description, executablepath >> %logFile%

REM Esperar 60 segundos antes de capturar novamente
timeout /t 60 >nul
goto monitor_loop

REM Fechar a janela do CMD atual
exit
