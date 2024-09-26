@echo off
title [DEDSEC] Desativar Windows Defender
color 0a
echo [DEDSEC] Desativando o Windows Defender...

REM Desativa o Windows Defender
sc stop WinDefend
sc config WinDefend start= disabled

echo [DEDSEC] Windows Defender desativado com sucesso.
pause
exit
