@echo off
title [DEDSEC] Desativar Serviços de Segurança
color 0a
echo [DEDSEC] Desativando serviços de segurança...

REM Parar e desativar o Windows Defender
sc stop WinDefend
sc config WinDefend start= disabled

REM Parar e desativar o Windows Firewall
netsh advfirewall set allprofiles state off

echo [DEDSEC] Serviços de segurança desativados com sucesso.
pause
exit
