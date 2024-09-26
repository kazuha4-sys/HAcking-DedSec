@echo off
:: Abrir a imagem
start "" "%local_folder%dedsec (1).gif"
timeout /t 10 /nobreak >nul
:: Fechar o visualizador de imagens (exemplo: Microsoft Photos)
taskkill /IM PhotosApp.exe /F
