@echo off
title DEDSEC Password WI-FI
color 0a

:: Definir o caminho da pasta e o arquivo de log
setlocal
set "local_folder=%~dp0"
set "logFile=%local_folder%wifi_passwords.txt"

REM Criar um arquivo temporário VBS para exibir a caixa de mensagem de aviso
echo Set objArgs = WScript.Arguments > "%temp%\msgbox.vbs"
echo Message = "Preparando para extrair a senha da rede Wi-Fi. Por favor, aguarde..." >> "%temp%\msgbox.vbs"
echo MsgBox Message, 64, "DEDSEC" >> "%temp%\msgbox.vbs"
start "" "%local_folder%dedsec.gif"

REM Executa o script VBS para exibir a caixa de mensagem
cscript //nologo "%temp%\msgbox.vbs"

REM Apaga o script temporário
del "%temp%\msgbox.vbs"

:: Listar perfis de Wi-Fi armazenados e exibir ao usuário
echo Listando redes Wi-Fi armazenadas...
netsh wlan show profiles | findstr /i "Todos os Perfis de Usuario"
echo.

:: Solicitar ao usuário o nome do perfil Wi-Fi
set /p "profile_name=Digite o nome do perfil Wi-Fi: "

echo ========================================================= >> "%logFile%"
echo [DEDSEC]: Extraindo senha para a rede Wi-Fi "!profile_name!"... >> "%logFile%"
echo ========================================================= >> "%logFile%"
echo. >> "%logFile%"

:: Extrair a senha da rede Wi-Fi especificada
for /f "tokens=2 delims=:" %%B in ('netsh wlan show profile name="%profile_name%" key=clear ^| findstr /i "Conteúdo da Chave"') do (
    echo Senha: %%B >> "%logFile%"
    echo Senha: %%B
)

echo ========================================================= >> "%logFile%"
echo [DEDSEC]: Operação concluída para o perfil "!profile_name!" >> "%logFile%"
echo. 
echo A senha foi salva no arquivo %logFile%.

pause
exit
