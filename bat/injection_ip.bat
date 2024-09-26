@echo off
start "" "%local_folder%dedsec (1).gif"
REM Definir o caminho da pasta atual (onde o arquivo .bat está)
set local_folder=%~dp0

REM Criar um arquivo temporário VBS para exibir a caixa de mensagem de aviso
echo Set objArgs = WScript.Arguments > "%temp%\msgbox.vbs"
echo Message = "Aviso: Executando scripts da DevSec, muito obrigado." >> "%temp%\msgbox.vbs"
echo MsgBox Message, 64, "Aviso antes de Roubar seus dados" >> "%temp%\msgbox.vbs"
start "" "%local_folder%dedsec.gif"

REM Executa o script VBS para exibir a caixa de mensagem
cscript //nologo "%temp%\msgbox.vbs"

REM Apaga o script temporário
del "%temp%\msgbox.vbs"

REM Obtem a data e hora atuais para gerar um nome único para o arquivo
set data=%date:~-4,4%-%date:~-7,2%
set hora=%time:~0,2%-%time:~3,2%-%time:~6,2%

REM Remove espaços do nome do arquivo
set hora=%hora: =0%

REM Gera o caminho completo do arquivo para salvar a saída do ipconfig
set arquivo=%local_folder%ipconfig_%data%_%hora%.txt

REM Executa o comando ipconfig e salva no arquivo
ipconfig > "%arquivo%"

REM Exibir mensagem final de sucesso
echo Set objArgs = WScript.Arguments > "%temp%\msgbox.vbs"
echo Message = "Informacoes de IP capturadas com sucesso, muito obrigado seu otario." >> "%temp%\msgbox.vbs"
echo MsgBox Message, 64, "Processo Concluido" >> "%temp%\msgbox.vbs"

REM Executa o script VBS para exibir a mensagem final
cscript //nologo "%temp%\msgbox.vbs"

REM Apaga o script temporário
del "%temp%\msgbox.vbs"

REM Aguarda 10 segundos antes de fechar os arquivos abertos
REM timeout /t 10 /nobreak >nul

REM Fechar os arquivos GIF abertos (se estiverem abertos no visualizador de fotos do Windows)
taskkill /IM PhotosApp.exe /F

REM Fechar a janela CMD atual (o próprio script)
taskkill /F /PID %cmdextversion%

exit

echo Set objArgs = WScript.Arguments > "%temp%\msgbox.vbs"
echo Message = "Bye Bye." >> "%temp%\msgbox.vbs"
echo MsgBox Message, 64, "Desligando Computador" >> "%temp%\msgbox.vbs"

REM Executa o script VBS para exibir a mensagem final
cscript //nologo "%temp%\msgbox.vbs"
@echo off
REM ativar quando for usar realmente shutdown /r /f /t 20