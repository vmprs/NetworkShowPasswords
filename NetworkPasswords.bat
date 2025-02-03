@echo off
title Wi-Fi Networks and Passwords
color 0a
echo =============================================
echo    Saved Wi-Fi Networks and Passwords
echo =============================================
echo.

:: Get the list of saved Wi-Fi profiles
for /f "tokens=2 delims=:" %%a in ('netsh wlan show profiles ^| findstr "All User Profile"') do (
    set "profile=%%a"
    setlocal enabledelayedexpansion
    set "profile=!profile:~1!"
    
    :: Get the password for each profile
    for /f "tokens=2 delims=:" %%b in ('netsh wlan show profile name^="!profile!" key^=clear ^| findstr "Key Content"') do (
        set "password=%%b"
        setlocal enabledelayedexpansion
        set "password=!password:~1!"
        
        :: Display the network name and password
        echo Network Name: !profile!
        echo Password: !password!
        echo ------------------------------
    )
    endlocal
)

echo.
echo =============================================
echo    End of List
echo =============================================
pause