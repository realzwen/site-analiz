@echo off & setlocal enabledelayedexpansion
chcp 65001 >nul 2>&1
set "P=%PATH%;C:\Program Files\Go\bin;C:\Go\bin;%USERPROFILE%\go\bin"
set "PATH=%P%"
set "CGO_ENABLED=0"
echo.
echo +==========================================+
echo ^|     zwen HTML Tracker Analyzer v3.0    ^|
echo +==========================================+
echo.
where go >nul 2>&1
if !ERRORLEVEL! NEQ 0 (echo [ERR] Go not found & pause & exit /b 1)
echo [1/2] Moduller...
go mod tidy >nul 2>&1
echo [2/2] Derleniyor...
go build -ldflags="-s -w -H windowsgui" -o "zwen_analyzer.exe" .
if !ERRORLEVEL! EQU 0 (
echo.
echo Basarili! zwen_analyzer.exe hazir.
echo Calistir: start zwen_analyzer.exe
) else (
echo HATA! Derleme basarisiz.
pause & exit /b 1
)
echo GUID tabanli rapor ID entegre edildi.
pause
