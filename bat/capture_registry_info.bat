@echo off
title [DEDSEC] Captura de Informações do Registro
color 0a
echo [DEDSEC] Coletando informações do registro do Windows...

REM Define o arquivo de log
set regFile=%~dp0registry_info_%date:~-4,4%-%date:~-7,2%-%date:~-10,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%.txt

REM Exporta o registro
reg export HKEY_LOCAL_MACHINE "%regFile%" /y

echo [DEDSEC] Informações do registro coletadas e salvas com sucesso.
pause
exit
