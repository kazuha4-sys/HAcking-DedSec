@echo off
title [DEDSEC] Coletar Informações de Firewall e Segurança
color 0a
echo [DEDSEC] Coletando informações de firewall e programas de segurança...

REM Criar arquivo de log
set logFile=%~dp0firewall_security_info_%date:~-4,4%-%date:~-7,2%-%date:~-10,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%.txt

REM Verificar o firewall do Windows
echo ============================== >> %logFile%
echo [Firewall Status] >> %logFile%
echo ============================== >> %logFile%
netsh advfirewall show allprofiles state >> %logFile%

REM Verificar programas de antivírus instalados (ex. Avast)
echo ============================== >> %logFile%
echo [Antivirus Status] >> %logFile%
echo ============================== >> %logFile%
wmic /namespace:\\root\SecurityCenter2 path AntiVirusProduct get displayName,productState >> %logFile%

REM Informações detalhadas sobre o firewall do sistema
echo ============================== >> %logFile%
echo [Firewall Details] >> %logFile%
echo ============================== >> %logFile%
netsh advfirewall firewall show rule name=all >> %logFile%

REM Verificar o status do Windows Defender
echo ============================== >> %logFile%
echo [Windows Defender Status] >> %logFile%
echo ============================== >> %logFile%
sc query WinDefend | findstr /I "STATE" >> %logFile%

echo [DEDSEC] Informações de firewall e segurança coletadas com sucesso.
echo Veja o arquivo de log em %logFile%.
pause
exit
