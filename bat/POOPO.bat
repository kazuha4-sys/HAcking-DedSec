@echo off
REM DedSec - Coletando informações do sistema e varredura de portas
title [C:\DEDSEC]: Hack In Progress
color 0a
echo [C:\DEDSEC]: Initializing...
setlocal

REM Definir o caminho da pasta atual (onde o arquivo .bat está)
set local_folder=%~dp0

REM Exibição da logo da dedsec
start "" "%local_folder%dedsec (1).gif"

REM Alteração do papel de parede
set wallpaper_path=%local_folder%dedsec_wallpaper.jpg

REM Criar um script VBS para exibir a mensagem e fechar após 10 segundos
echo Set objShell = CreateObject("WScript.Shell") > "%temp%\timed_msg.vbs"
echo objShell.Popup "Aviso: Iniciando o roubo de informações do sistema. Isso pode levar alguns minutos...", 10, "DEDSEC HACKING", 48 >> "%temp%\timed_msg.vbs"

REM Executa o script VBS para exibir a mensagem temporizada
cscript //nologo "%temp%\timed_msg.vbs"

REM Apaga o script temporário
del "%temp%\timed_msg.vbs"

REM Obter informações do sistema
set PCName=%COMPUTERNAME%
set UserName=%USERNAME%
set OSName=
set OSVersion=

REM Identificar o sistema operacional
echo ver | findstr /i "5.1" >nul && set OSName=Windows XP
echo ver | findstr /i "5.2" >nul && set OSName=Windows Server 2003
echo ver | findstr /i "6.0" >nul && set OSName=Windows Vista
echo ver | findstr /i "6.1" >nul && set OSName=Windows 7
echo ver | findstr /i "6.2" >nul && set OSName=Windows 8
echo ver | findstr /i "6.3" >nul && set OSName=Windows 8.1
echo ver | findstr /i "10.0" >nul && set OSName=Windows 10
echo ver | findstr /i "10.1" >nul && set OSName=Windows 11

REM Obter a versão do sistema operacional
for /f "tokens=2 delims=:" %%a in ('systeminfo ^| findstr /i "OS Version"') do set OSVersion=%%a

REM Gerar a data e hora atual para um nome de arquivo único
set data=%date:~-4,4%-%date:~-7,2%
set hora=%time:~0,2%-%time:~3,2%-%time:~6,2%
set hora=%hora: =0%

REM Definir o arquivo de log para salvar as informações
set logFile=%local_folder%ports_log_%data%_%hora%.txt

REM Salvar as informações no arquivo de log
echo [C:\DEDSEC]: Hack Log >> %logFile%
echo ============================== >> %logFile%
echo PC Name: %PCName% >> %logFile%
echo User Name: %UserName% >> %logFile%
echo OS Name: %OSName% >> %logFile%
echo OS Version: %OSVersion% >> %logFile%
echo ============================== >> %logFile%

REM Coletar informações sobre portas abertas
echo [C:\DEDSEC]: Coletando informações sobre portas abertas... >> %logFile%
netstat -an >> %logFile%

REM Coletar informações sobre processos em execução
echo [C:\DEDSEC]: Coletando informações sobre processos em execução... >> %logFile%
tasklist >> %logFile%

REM Alterar o papel de parede
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%wallpaper_path%" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

REM Exibir mensagem final de sucesso com temporizador de 10 segundos
echo Set objShell = CreateObject("WScript.Shell") > "%temp%\timed_msg.vbs"
echo objShell.Popup "Informações coletadas com sucesso. O sistema está sob nosso controle.", 10, "Processo Concluído", 64 >> "%temp%\timed_msg.vbs"

REM Executa o script VBS para exibir a mensagem temporizada
cscript //nologo "%temp%\timed_msg.vbs"

REM Apaga o script temporário
del "%temp%\timed_msg.vbs"

REM Tentar fechar a animação (GIF) caso esteja rodando
taskkill /IM dllhost.exe /F 2>nul

echo [C:\DEDSEC]: Operação finalizada com sucesso. Informações salvas em %logFile%.
pause

REM Exibir mensagem final de sucesso com temporizador de 10 segundos
echo Set objShell = CreateObject("WScript.Shell") > "%temp%\timed_msg.vbs"
echo objShell.Popup "Informações coletadas com sucesso. Saindo do sistema.", 10, "Processo Concluído", 64 >> "%temp%\timed_msg.vbs"

REM Apagar o script temporário
del "%temp%\timed_msg.vbs"

REM Fechar a janela do CMD atual
exit
