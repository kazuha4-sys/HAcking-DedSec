@echo off
title [DEDSEC] Relatório de Processos e Programas
color 0a
echo [DEDSEC] Coletando informações sobre processos ativos e programas instalados...
setlocal

REM Definir o caminho da pasta atual (onde o arquivo .bat está)
set local_folder=%~dp0

REM Gerar a data e hora atual para um nome de arquivo único
set data=%date:~-4,4%-%date:~-7,2%
set hora=%time:~0,2%-%time:~3,2%-%time:~6,2%
set hora=%hora: =0%

REM Definir o arquivo de log para salvar as informações
set logFile=%local_folder%process_program_log_%data%_%hora%.txt

REM Relatório de processos ativos
echo ============================== >> %logFile%
echo Processos Ativos >> %logFile%
echo ============================== >> %logFile%
tasklist >> %logFile%

REM Relatório de programas instalados
echo ============================== >> %logFile%
echo Programas Instalados >> %logFile%
echo ============================== >> %logFile%
powershell "Get-WmiObject -Query 'SELECT * FROM Win32_Product' | Select-Object Name, Version, InstallDate" >> %logFile%

echo [DEDSEC] Relatório gerado com sucesso. Informações salvas em %logFile%.
pause
exit
