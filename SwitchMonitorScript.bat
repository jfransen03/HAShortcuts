@echo off
setlocal EnableDelayedExpansion

REM =========================
REM CONFIGURATION
REM =========================
REM Set MODE to LAPTOP or PC
set "MODE=PC"

REM =========================
REM LOCATE ControlMyMonitor
REM =========================
set "CMM=ControlMyMonitor.exe"

where "%CMM%" >nul 2>&1
if errorlevel 1 (
    if exist "%~dp0%CMM%" (
        set "CMM=%~dp0%CMM%"
    ) else (
        echo ERROR: ControlMyMonitor.exe not found in PATH or script directory.
        exit /b 1
    )
)

REM =========================
REM LOGIC
REM =========================
if /I "%MODE%"=="LAPTOP" (

    REM Laptop values
    "%CMM%" /SetValue "WAM3200" 60 5
    "%CMM%" /SetValue "VG258"   60 15

) else if /I "%MODE%"=="PC" (

    REM PC values
    "%CMM%" /SetValue "WAM3200" 60 6
    "%CMM%" /SetValue "VG258"   60 17

) else (
    echo ERROR: Invalid MODE "%MODE%"
    exit /b 1
)

endlocal
