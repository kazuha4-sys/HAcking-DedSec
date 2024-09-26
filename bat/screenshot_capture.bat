@echo off
title [C:\DEDSEC] Captura de Tela em Intervalos
color 0a
echo [C:\DEDSEC] Captura de tela inicializada..
setlocal
start "" "%local_folder%dedsex.gif"

REM Definir o caminho da pasta atual (onde o arquivo .bat está)
set local_folder=%~dp0screenshots
if not exist "%local_folder%" mkdir "%local_folder%"

REM Loop de captura de tela a cada 30 segundos
:screenshot_loop
REM Gerar a data e hora atual para um nome de arquivo único
set data=%date:~-4,4%-%date:~-7,2%
set hora=%time:~0,2%-%time:~3,2%-%time:~6,2%
set hora=%hora: =0%

REM Nome do arquivo de captura de tela
set screenshotFile=%local_folder%\screenshot_%data%_%hora%.png

REM Usar PowerShell para capturar a tela
powershell.exe -Command "Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $bmp = New-Object Drawing.Bitmap([System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width, [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height); $graphics = [System.Drawing.Graphics]::FromImage($bmp); $graphics.CopyFromScreen(0, 0, 0, 0, $bmp.Size); $bmp.Save('%screenshotFile%'); $graphics.Dispose(); $bmp.Dispose();"

REM Esperar 30 segundos antes de capturar novamente
timeout /t 30 >nul
goto screenshot_loop

REM Fechar a janela do CMD atual

exit
