@echo off
title [DEDSEC] Simulação de Teclas Aleatórias
color 0a
echo [DEDSEC] Iniciando simulação de teclas aleatórias...

REM Loop para pressionar teclas aleatórias
:loop
REM Usar powershell para enviar teclas aleatórias
powershell -command "$wshell = New-Object -ComObject wscript.shell; $chars = 'abcdefghijklmnopqrstuvwxyz0123456789'; $key = $chars.Substring((Get-Random -Minimum 0 -Maximum $chars.Length),1); $wshell.SendKeys($key); Start-Sleep -Milliseconds (Get-Random -Minimum 300 -Maximum 1000)"
goto loop
