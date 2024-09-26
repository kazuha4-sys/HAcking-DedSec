@echo off
title [C:\DEDSEC]: Captura de Processos e Rede em Tempo Real
color 0a
echo [C:\DEDSEC]: Captura de processos e conexoes de rede...
setlocal

REM Definir o caminho da pasta atual (onde o arquivo .bat está)
set local_folder=%~dp0

REM Gerar a data e hora atual para um nome de arquivo único
set data=%date:~-4,4%-%date:~-7,2%
set hora=%time:~0,2%-%time:~3,2%-%time:~6,2%
set hora=%hora: =0%

REM Definir o arquivo de log para salvar as informações
set logFile=%local_folder%network_process_log_%data%_%hora%.txt

:loop
REM Capturar a lista de processos e conexões de rede ativas
echo ============================== >> %logFile%
echo Processos em execucao - %date% %time% >> %logFile%
echo ============================== >> %logFile%
tasklist >> %logFile%
echo ============================== >> %logFile%
echo Conexoes de Rede Ativas - %date% %time% >> %logFile%
echo ============================== >> %logFile%
netstat -an >> %logFile%

REM Esperar 60 segundos antes de repetir
timeout /t 60 >nul
goto loop

REM Fechar a janela do CMD atual
exit
