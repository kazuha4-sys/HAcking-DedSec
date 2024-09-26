@echo off
title [DEDSEC] Desabilitar Gerenciador de Tarefas
color 0a
echo [DEDSEC] Desabilitando o Gerenciador de Tarefas...
setlocal

REM Modificar o registro para desativar o Gerenciador de Tarefas
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableTaskMgr" /t REG_DWORD /d "1" /f

echo [DEDSEC] Gerenciador de Tarefas desativado.
pause
exit
