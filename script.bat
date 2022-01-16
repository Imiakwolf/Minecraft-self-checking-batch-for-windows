@echo off

set serverfile=paper-1.18.1-152.jar
set rammin=2
set rammax=4


::Ab hier nix ändern


COLOR 2
echo Willkommen beim Minecraft Self-Checking Startscript
timeout /t 2 >nul
echo by ImiakWolf
timeout /t 5 >nul

goto start

:start
cls
COLOR 2
echo.
echo Starte Server
echo.
timeout /t 2 >nul
start java -Xms%rammin%G -Xmx%rammax%G -jar %serverfile% --nogui
timeout /t 2 >nul
goto check


:check
tasklist /FI "IMAGENAME eq java.exe" 2>NUL | find /I /N "java.exe">NUL
if "%ERRORLEVEL%"=="0" goto loop
cls
COLOR 4
echo Server laeuft nicht, ich kuemmere mich drum...
timeout /t 5 >nul
goto start



:loop
FOR /L %%s IN (15,-1,0) DO (
    cls
    echo Server laueft. Checke wieder in %%s sekunden.. 
    timeout 1 >nul
)
goto check 
