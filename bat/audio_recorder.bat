@echo off
title [DEDSEC] Gravador de Áudio
color 0a
echo [DEDSEC] Gravando áudio do microfone...
setlocal

REM Definir o caminho da pasta atual (onde o arquivo .bat está)
set local_folder=%~dp0audio_logs
if not exist "%local_folder%" mkdir "%local_folder%"

REM Loop para gravar áudio por 60 segundos
:record_audio
REM Gerar a data e hora atual para um nome de arquivo único
set data=%date:~-4,4%-%date:~-7,2%
set hora=%time:~0,2%-%time:~3,2%-%time:~6,2%
set hora=%hora: =0%

REM Nome do arquivo de áudio
set audioFile=%local_folder%\audio_log_%data%_%hora%.wav

REM Usar o comando PowerShell para gravar áudio por 60 segundos
powershell.exe -Command "Add-Typemkdir "%local_folder%""

REM Esperar 60 segundos antes de gravar novamente
timeout /t 60 >nul
goto record_audio

REM Fechar a janela do CMD atual
exit
