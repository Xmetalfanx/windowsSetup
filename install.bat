echo OFF

NET SESSION >nul 2>&1


:checkForAdmin

    echo Checking for Admin Rights first

    IF %ERRORLEVEL% EQU 0 (

    echo.

    ) ELSE (

    echo.-------------------------------------------------------------

    echo ERROR: YOU ARE NOT RUNNING THIS WITH ADMINISTRATOR PRIVILEGES.

    echo. -------------------------------------------------------------

    echo. If you're seeing this, it means you don't have admin privileges!

    pause

    echo.

    echo. You will need to restart this program with Administrator privileges by right-clicking and select "Run As Administrator"

    pause 

        echo.

    echo Press any key to leave this program. Make sure to Run As Administrator next time!

    pause

    EXIT /B 1

    )

EXIT /B 0

:installChocolately

    echo Installing Chocolately 
    powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

    choco feature enable -n=allowGlobalConfirmation

    echo Chocolatey is ready to begin installing packages!

    pause

EXIT /B 0


:installSingleApp
    echo Installing %~1
    cinst %~1 

    :: do a sleep type command to pause for a second or two ... maybe find a way to have the user have to hit enter and comment that out (so its off by default but if a user wants to be prompted, that is doable too )
    :: timeout /t 3

    :: clear the screen 
    clear 

EXIT /B 0

:installMultipleApps
    echo Installing %~1
    cisinst %~1 

EXIT /B 0
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

call :checkForAdmin
call :installChocolately

:: leaving this here to copy and paste 
:: call :installSoftware 


echo Installing Software


: this will uncheck many installer's bloatware that is included .. likely not needed via chocolately but a good thing to have 
call :installSoftware unchecky

:: Insternet Related Appps 
echo Installing Web Browsers

call :installSoftware googlechrome
call :installSoftware firefox

echo Installing Internet Related Apps
call :installSoftware thunderbird 

:: Dot Net Framework 
call :installSoftware netfx-4.7.2

:: SysInternals Apps 
echo Installing useful System Internal Apps by Microsoft
call :installSoftware sysinternals
call :installSoftware autoruns
call :installSoftware processxp

:: Office Suite
echo Installing Libre Office
:: choco install libreoffice-fresh
call :installSoftware libreoffice-still 


:: Misc System Apps 
echo Installing Misc System Tools Apps 
call :installSoftware bulkrenameutility
call :installSoftware ccleaner
call :installSoftware everything
call :installSoftware folder_size
call :installSoftware glaryutilities-free
:: call :installSoftware hwinfo
call :installSoftware imageburn
call :installSoftware open-shell
call :installSoftware patch-my-pc 
call :installSoftware patchcleaner 
call :installSoftware processhacker
call :installSoftware revo-uninstaller
call :installSoftware systemexplorer
call :installSoftware windowssystemcontrolcenter
call :installSoftware xyplorerfree 

:: Security
echo Installing Security Apps 
call :installSoftware emsisoft-emergency-kit
call :installSoftware kvrt

:: Graphics and Multimedia Apps
echo Installing Graphics and Multimedia Apps
call :installSoftware makemkv
call :installSoftware tagscanner
call :installSoftware xnviewmp

:: CD/DVD related 
call :installSoftware burnawarefree
call :installSoftware eac

:: misc apps 
:: call :installSoftware hexchat
call :installSoftware notepadplusplus
call :installSoftware speedyfox


:: call :installSoftware

:: Games
::echo Installing some games
::choco install chessx



echo Apps to install seperately: ChessTitan, UltraZip, older Auslogic Disk Defrag free, Kaspersky or Bit Defender AV 

echo Check if Games are installed by default (I forgot).  I mean Hearts, Solitare, etc 