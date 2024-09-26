@echo off
title [DEDSEC] Simulação de Tela Azul da Morte
color 1f
mode 1000

echo.
echo ================================================================================
echo.
echo                    *** STOP: 0x0000001E (0x00000005, 0xBFFFFFFC, 0x00000000) ***
echo.
echo                   UNMOUNTABLE_BOOT_VOLUME
echo.
echo A problem has been detected and Windows has been shut down to prevent damage
echo to your computer.
echo.
echo If this is the first time you've seen this stop error screen,
echo restart your computer. If this screen appears again, follow
echo these steps:
echo.
echo Check to make sure any new hardware or software is properly installed.
echo If this is a new installation, ask your hardware or software manufacturer
echo for any Windows updates you might need.
echo.
echo If problems continue, disable or remove any newly installed hardware
echo or software. Disable BIOS memory options such as caching or shadowing.
echo If you need to use Safe Mode to remove or disable components, restart
echo your computer, press F8 to select Advanced Startup Options, and then
echo select Safe Mode.
echo.
echo Technical information:
echo.
echo *** STOP: 0x000000ED (0x80F9E5F8, 0xC0000006, 0x00000000, 0x00000000)
echo.
echo.
pause >nul
exit
