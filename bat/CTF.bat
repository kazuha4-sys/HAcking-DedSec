@echo off
title DEDSEC
color 0a
echo [C:\DEDSEC]: Initializing system...
set local_flder=%~dp0

REM Definir o caminho da pasta atual (onde o arquivo .bat está)
set local_folder=%~dp0

REM Exibição da logo da dedsec
start "" "%local_folder%dedsec (1).gif"

REM Alteração do papel de parede
set wallpaper_path=%local_folder%dedsec_wallpaper.jpg

REM Menu interativo
:menu
cls
echo ====================================
echo           Ferramentas de Rede        
echo ====================================
echo 1. Ping em um IP especifico
echo 2. Verificar Conexoes com Netstat
echo 3. Verificar Porta com Telnet
echo 4. Escanear intervalo de IPs
echo 5. Coletar Informações do Sistema e Portas
echo 6. Ache seu alvo atraves do seu IP 
echo 7. programas executaveis de um IP 
echo 8. Analise de Portas abertas
echo 0. Sair
echo ====================================
set /p escolha="Escolha uma opcao: "

if %escolha%==1 goto ping
if %escolha%==2 goto netstat
if %escolha%==3 goto telnet
if %escolha%==4 goto scan_ips
if %escolha%==5 goto system_info
if %escolha%==6 goto GeoLocation
if %escolha%==7 goto Process_program_report
if %escolha%==8 goto PortScan
if %escolha%==0 goto fim

:ping
cls
set /p ip_ping="Digite o IP para o Ping: "
REM Criar um script VBS para exibir a mensagem
echo Set objShell = CreateObject("WScript.Shell") > "%temp%\timed_msg.vbs"
echo objShell.Popup "Aviso: Iniciando teste de conexao com o ip %ip_ping%", 10, "DEDSEC", 48 >> "%temp%\timed_msg.vbs"
cscript //nologo "%temp%\timed_msg.vbs"
del "%temp%\timed_msg.vbs"

echo [C:\DEDSEC]: ping %ip_ping%
ping %ip_ping%
goto aviso_ping

:aviso_ping
REM Criar um script VBS para exibir a mensagem
echo Set objShell = CreateObject("WScript.Shell") > "%temp%\timed_msg.vbs"
echo objShell.Popup "Aviso: Testado conexao com o ip %ip_ping%", 10, "DEDSEC", 48 >> "%temp%\timed_msg.vbs"
cscript //nologo "%temp%\timed_msg.vbs"
del "%temp%\timed_msg.vbs"
pause
goto menu

:netstat
cls
echo Listando as conexoes de rede ativas...
netstat -an >> '%local_folder%ctf.txt'
netstat -an 
pause
goto menu

:telnet
cls
set /p ip="[C:\DEDSEC]: Digite o IP para verificar com Telnet: "
set /p port="[C:\DEDSEC]: Digite a porta: "
echo [C:\DEDSEC]: Verificando porta %port% no IP %ip%...
telnet %ip% %port% >> '%local_folder%ctf.txt'
telnet %ip% %port%
pause
goto menu

:scan_ips
cls
echo Escaneando intervalo de IPs de 192.168.15.1 a 192.168.15.254...
for /L %%i in (1,1,254) do (
    echo Testando 192.168.15.%%i...
    ping -n 1 -w 100 192.168.15.%%i | find "TTL=" >nul
    if not errorlevel 1 echo 192.168.15.%%i esta ativo
)
pause
goto menu

:system_info
cls
REM Exibir mensagem de roubo de informações
echo Set objShell = CreateObject("WScript.Shell") > "%temp%\timed_msg.vbs"
echo objShell.Popup "Aviso: Iniciando o roubo de informações do sistema. Isso pode levar alguns minutos...", 10, "DEDSEC HACKING", 48 >> "%temp%\timed_msg.vbs"
cscript //nologo "%temp%\timed_msg.vbs"
del "%temp%\timed_msg.vbs"

REM Obter informações do sistema
set PCName=%COMPUTERNAME%
set UserName=%USERNAME%
set OSName=
set OSVersion=

REM Identificar o sistema operacional

REM Obter a versão do sistema operacional
for /f "tokens=2 delims=:" %%a in ('systeminfo ^| findstr /i "OS Version"') do set OSVersion=%%a

REM Gerar a data e hora atual para um nome de arquivo único
set data=%date:~-4,4%-%date:~-7,2%
set hora=%time:~0,2%-%time:~3,2%-%time:~6,2%
set hora=%hora: =0%

REM Definir o arquivo de log para salvar as informações
set logFile=%local_folder%ports_log_%data%_%hora%.txt

REM Salvar as informações no arquivo de log
echo [C:\DEDSEC]: Hack Log >> %logFile%
echo ============================== >> %logFile%
echo PC Name: %PCName% >> %logFile%
echo User Name: %UserName% >> %logFile%
echo OS Name: %OSName% >> %logFile%
echo OS Version: %OSVersion% >> %logFile%
echo ============================== >> %logFile%

REM Coletar informações sobre portas abertas usando netstat
echo [C:\DEDSEC]: Coletando informações sobre portas abertas... >> %logFile%
netstat -an >> %logFile%

REM Coletar informações sobre processos em execução
echo [C:\DEDSEC]: Coletando informações sobre processos em execução... >> %logFile%
tasklist >> %logFile%

REM Realizar uma varredura de portas no IP 192.182.15.5 usando PowerShell e salvar no log
echo [C:\DEDSEC]: Iniciando a varredura de portas no IP 192.182.15.5... >> %logFile%
powershell -Command "
$target = '192.182.15.5';
$ports = 1..1024;
foreach ($port in $ports) {
    try {
        $connection = New-Object System.Net.Sockets.TcpClient($target, $port);
        if ($connection.Connected) {
            Add-Content '%logFile%' 'Port $port is OPEN on $target';
        }
        $connection.Close();
    } catch {
        Add-Content '%logFile%' 'Port $port is CLOSED on $target';
    }
}"

REM Alterar o papel de parede
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%wallpaper_path%" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

REM Exibir mensagem final de sucesso com temporizador de 10 segundos
echo Set objShell = CreateObject("WScript.Shell") > "%temp%\timed_msg.vbs"
echo objShell.Popup "Informações coletadas com sucesso. O sistema está sob nosso controle.", 10, "Processo Concluído", 64 >> "%temp%\timed_msg.vbs"
cscript //nologo "%temp%\timed_msg.vbs"
del "%temp%\timed_msg.vbs"

:GeoLocation
cls
set /p ip=IP do usuario: 
echo [C:\DEDSEC]: Iniciando procura do IP: %ip%
echo [C:\DEDSEC]: Achamos ele, essa e sua localizacao: > %local_folder%ctf.txt
curl "https://ipinfo.io/%ip%/json" >> "%local_folder%ctf.txt"
type "%local_folder%ctf.txt"
pause 
goto menu

:process_program_report
cls
set /p ip=[C:\DEDSEC]: Digite o Ip do usuario:
echo [C:\DEDSEC]: Capturando programas executaveis do ip %ip%

:PortScan
cls 
set /p ip=[C:\DEDSEC]: Digite o Ip do usuario:
echo [C:\DEDSEC]: Testado conexao com Ping
ping %ip%

set /p portas="[C:\DEDSEC]: Digite o intervalo de Portas para escanear(ex.:1-1000)" 

:: Executar o namp para escanear as portas especificas
nmap -p %portas% %ip%
goto menu 

REM Tentar fechar a animação (GIF) caso esteja rodando
taskkill /IM dllhost.exe /F 2>nul

echo [C:\DEDSEC]: Operação finalizada com sucesso. Informações salvas em %logFile%.
pause
goto menu

:fim
exit
