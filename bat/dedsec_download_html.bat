@echo off
title [DEDSEC] Coletar Código Fonte de Página Web
color 0a

REM Solicitar ao usuário a URL da página
set /p URL="Digite a URL da página da qual deseja capturar o código fonte: "

REM Definir o arquivo onde será salvo o código-fonte
set output_file=source_code.txt

echo [DEDSEC] Iniciando captura do código fonte da URL: %URL%...

REM Usar curl para baixar o código-fonte da página
curl %URL% -o %output_file%

REM Verificar se o download foi bem-sucedido
if %errorlevel%==0 (
    echo [DEDSEC] Código fonte capturado com sucesso e salvo em %output_file%.
) else (
    echo [DEDSEC] Erro ao capturar o código fonte da página.
)

pause
exit
