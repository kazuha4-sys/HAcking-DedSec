@echo off
title DEDSEC Brute_Force
color 0a

:: Definir o alvo e variáveis
set target_password=senha123
set found=0
set charset=abcdefghijklmnopqrstuvwxyz0123456789
set max_length=8

echo [DEDSEC]: Iniciando ataque de força bruta...
echo Tentando quebrar senha de alvo... Espere.

:: Função para gerar combinações de senha
for %%a in (%charset%) do (
    for %%b in (%charset%) do (
        for %%c in (%charset%) do (
            for %%d in (%charset%) do (
                for %%e in (%charset%) do (
                    for %%f in (%charset%) do (
                        for %%g in (%charset%) do (
                            setlocal enabledelayedexpansion
                            set attempt=%%a%%b%%c%%d%%e%%f%%g
                            echo Tentando: !attempt!
                            
                            :: Verificar se a senha gerada corresponde à senha do alvo
                            if "!attempt!"=="%target_password%" (
                                echo [Sucesso]: Senha encontrada: !attempt!
                                set found=1
                                endlocal
                                goto :done
                            )
                            endlocal
                        )
                    )
                )
            )
        )
    )
)

:done
if "%found%"=="1" (
    echo [DEDSEC]: Senha quebrada: %target_password%
    echo [DEDSEC]: Acesso garantido.
) else (
    echo [DEDSEC]: Falha. Não foi possível quebrar a senha.
)

pause
exit
