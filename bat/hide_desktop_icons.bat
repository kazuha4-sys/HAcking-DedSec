@echo off
title [DEDSEC] Ocultar Arquivos da Área de Trabalho
color 0a
echo [DEDSEC] Ocultando arquivos da área de trabalho...

REM Definir caminho para a pasta da área de trabalho
set desktop_path=%USERPROFILE%\Desktop

REM Mudar atributos de todos os arquivos para ocultos
attrib +h "%desktop_path%\*.*" /s

echo [DEDSEC] Todos os arquivos da área de trabalho foram ocultados.
pause

REM Pressionar qualquer tecla para restaurar os arquivos
attrib -h "%desktop_path%\*.*" /s

echo [DEDSEC] Arquivos restaurados.
pause
exit
