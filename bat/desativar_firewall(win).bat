@echo off
title [DEDSEC] Disabling Windows Firewall
color 0a
echo [DEDSEC] Desabilitando o Firewall do Windows...

REM Desativar o firewall usando netsh
netsh advfirewall set allprofiles state off

REM Exibir mensagem de sucesso
echo [DEDSEC] Firewall do Windows desativado com sucesso.
pause

REM Fechar a janela do CMD atual
exit
