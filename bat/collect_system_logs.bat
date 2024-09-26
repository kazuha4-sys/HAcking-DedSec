@echo off
title [DEDSEC] Coletar Arquivos de Log do Sistema
color 0a
echo [DEDSEC] Coletando arquivos de log do sistema...

REM Define o diretório para salvar os logs
set logDir=%~dp0system_logs
if not exist "%logDir%" mkdir "%logDir%"

REM Coleta arquivos de log de diretórios comuns
xcopy "C:\Windows\Logs\*" "%logDir%\" /s /y
xcopy "C:\ProgramData\Microsoft\Windows\WER\ReportArchive\*" "%logDir%\" /s /y

echo [DEDSEC] Arquivos de log coletados com sucesso.
pause
exit
