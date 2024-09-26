@echo off
setlocal
title DEDSEC 
color a
start "" "%local_folder%dedsec (1).gif"
timeout /t 2
cls

REM Solicitar IP do usuário
echo [C:\DEDSEC]: Para começar a caca, digite o IP:
set /p ip=IP: 

REM Definir pasta local
set local_folder=%~dp0

REM Criar um arquivo temporário VBS para exibir a caixa de mensagem de aviso inicial
echo Set objArgs = WScript.Arguments > "%temp%\msgbox_start.vbs"
echo Message = "Enquanto procuramos ele, esculte uma musiquinha." >> "%temp%\msgbox_start.vbs"
echo MsgBox Message, 64, "DEDSEC" >> "%temp%\msgbox_start.vbs"
start "" "%local_folder%dedsec.gif"

start https://www.youtube.com/watch?v=JGNqvH9ykfA

REM Executar o script VBS para exibir a caixa de mensagem de aviso
cscript //nologo "%temp%\msgbox_start.vbs"

REM Apagar o script temporário
del "%temp%\msgbox_start.vbs"

REM Exibir o IP que está sendo rastreado
echo [C:\DEDSEC]: Rastreando o IP: %ip%

REM Rastrear IP e salvar informações em um arquivo .txt
echo [C:\DEDSEC]: Achamos ele, esta aqui: > "%local_folder%localizacao_ip.txt"
curl "http://ipinfo.io/%ip%/json" >> "%local_folder%localizacao_ip.txt"

REM Exibir informações salvas
type "%local_folder%localizacao_ip.txt"

REM Criar um arquivo temporário VBS para exibir a caixa de mensagem de sucesso
echo Set objArgs = WScript.Arguments > "%temp%\msgbox_success.vbs"
echo Message = "IP localizado com sucesso." >> "%temp%\msgbox_success.vbs"
echo MsgBox Message, 64, "Processo Concluído :)" >> "%temp%\msgbox_success.vbs"

REM Executar o script VBS para exibir a caixa de mensagem de sucesso
cscript //nologo "%temp%\msgbox_success.vbs"

REM Apagar o script temporário
del "%temp%\msgbox_success.vbs"

pause
exit
