@echo off
schtasks /delete /tn "ScriptInicializacao" /f
if %ERRORLEVEL% NEQ 0 (
    echo Falha ao tirar o script.
    pause
)