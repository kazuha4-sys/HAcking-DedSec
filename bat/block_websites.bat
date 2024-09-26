@echo off
title [DEDSEC] Bloqueio de Sites
color 0a
echo [DEDSEC] Bloqueando sites selecionados...
setlocal

REM Definir o caminho do arquivo hosts
set hosts_file=%windir%\System32\drivers\etc\hosts

REM Adicionar sites a serem bloqueados
REM echo 127.0.0.1 www.facebook.com >> %hosts_file%
REM echo 127.0.0.1 www.youtube.com >> %hosts_file%
REM echo 127.0.0.1 www.twitter.com >> %hosts_file%

echo [DEDSEC] Sites bloqueados com sucesso.
pause
exit
