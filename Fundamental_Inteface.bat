@echo off
title Fundamental User Interface System
color 0A

:: Initial fuel level
set fuel=100

:main_menu
cls
echo ==================================================
echo               Welcome to INS
echo         Fundamental User Interface System
echo ==================================================
echo 1. Login
echo 2. Exit
echo ==================================================
set /p choice="Please choose an option (1-2): "

if "%choice%"=="1" goto login
if "%choice%"=="2" goto exit
echo Invalid choice. Please try again.
pause
goto main_menu

:login
cls
set /p user="Enter Username: "
set /p pass="Enter Password: "
echo Authenticating...
:: Simulating a database check for username and password
if "%user%"=="captain" if "%pass%"=="password" (
    echo Authentication successful!
    pause
    goto User Interface_menu
) else (
    echo Invalid username or password. Please try again.
    pause
    goto main_menu
)

:User Interface_menu
cls
echo ==================================================
echo               User Interface Menu
echo ==================================================
echo 1. Observe Star
echo 2. Move to Star
echo 3. Check fuel Level
echo 4. Log Out
echo ==================================================
set /p nav_choice="Please choose an option (1-4): "

if "%nav_choice%"=="1" goto observe_Star
if "%nav_choice%"=="2" goto move_to_star
if "%nav_choice%"=="3" goto check_fuel
if "%nav_choice%"=="4" goto main_menu
echo Invalid choice. Please try again.
pause
goto User Interface_menu

:observe_Star
cls
echo Observing Star in the vicinity...
echo ==================================================
echo 1. Alpha Centauri - 4.37 light years away
echo 2. Betelgeuse - 642.5 light years away
echo 3. Sirius - 8.6 light years away
echo ==================================================
pause
goto User Interface_menu

:move_to_star
cls
set /p destination="Enter the number of the star you want to move to (1-3): "
if "%destination%"=="1" (
    set /a fuel=%fuel%-5
    echo Moving to Alpha Centauri...
    echo You have traveled 4.37 light years.
) else if "%destination%"=="2" (
    set /a fuel=%fuel%-50
    echo Moving to Betelgeuse...
    echo You have traveled 642.5 light years.
) else if "%destination%"=="3" (
    set /a fuel=%fuel%-10
    echo Moving to Sirius...
    echo You have traveled 8.6 light years.
) else (
    echo Invalid choice. Please try again.
    pause
    goto move_to_star
)
echo Your remaining fuel is: %fuel%
if %fuel% leq 0 (
    echo You have run out of fuel!
    pause
    goto exit
)
pause
goto User Interface_menu

:check_fuel
cls
echo Your current fuel level is: %fuel%
pause
goto User Interface_menu

:exit
cls
echo Thank you for using INS. Goodbye!
pause
exit
