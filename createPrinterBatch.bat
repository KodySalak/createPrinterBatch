@echo off
REM This makes a batch file for adding printers. Copyright Kody Salak of Northeast Community College.
TITLE Create Printer Batch File
color 8F
goto intro
:intro
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO Welcome! This will generate a batch file for adding a networked printer to that computer.
ECHO Press any key to continue, or press control+C to stop this batch file.
PAUSE > NUL
goto main

:main
cls
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
SET /P _serverName= Enter the Server/Machine the printer lives on:
SET /P _printerName= Enter the name of the printer:
SET /P c=The full network path for the printer looks like \\%_serverName%\%_printerName%, is this correct?[Y/N]
SET _networkedPrinter=\\%_serverName%\%_printerName%
IF /I "%c%" EQU "Y" goto createopt
IF /I "%c%" EQU "N" goto main

:createopt
cls
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
SET /P _batchName= Enter the name you want to use for the batch file (NO .bat AT THE END!):
SET /P "%d%" The name of the batch file will be %_batchName%.bat, is that correct?[Y/N]
IF /I "%d%" EQU "Y" goto create
IF /I "%d%" EQU "N" goto main

:create
cls
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO This will be placed on your desktop, please make sure you run THAT batch script as the current User!
ECHO Press any key to make the batch!
PAUSE > NUL
REM **THIS NEXT STEP MAKES THE FILE THAT WILL ADD THE PRINTER!**
(
ECHO @echo off
ECHO rundll32 printui.dll,PrintUIEntry /in /n %_networkedPrinter%
ECHO rundll32 printui.dll,PrintUIEntry /y /n %_networkedPrinter%
ECHO EXIT
)>"%USERPROFILE%\Desktop\%_batchName%.bat"
CLS
COLOR 2F
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO DONE!!! Check your desktop!
pause