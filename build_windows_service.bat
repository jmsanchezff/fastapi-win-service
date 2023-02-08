@echo off

set EXPECTED_PYTHON_VERSION=Python 3.7.9

echo "[*] Checking python version..."
for /f "tokens=*" %%g in ('python --version') do (SET PYTHON_VERSION=%%g)

if not "x%PYTHON_VERSION:Python 3.7.9=%"=="x%PYTHON_VERSION%" (
    echo "[OK] %PYTHON_VERSION% found"
) else (
    echo "[ERROR] Unexpected python version found (%PYTHON_VERSION%). Expected %EXPECTED_PYTHON_VERSION%.X"
    pause
    exit 1
)

if not exist "./venv/Scripts/activate.bat" (
    echo "[*] Creating python virtual environment..."
    call python -m venv venv
)

echo "[*] Activating virtual environment..."
call venv/Scripts/activate.bat

echo "[*] Installing requirements.txt..."
pip install -r requirements.txt

cd app

echo "[*] Building uvicorn server executable folder..."
call pyinstaller server.spec --noconfirm

echo "[*] Building windows_service executable folder..."
call pyinstaller windows_service.spec --noconfirm

echo "[OK] Windows service successfully built"

cd ..

echo "[*] Creating package zip file ..."
tar -acf fastapi_win_service.zip "app/dist" "install_windows_service.bat" "uninstall_windows_service.ps1" && (
    echo "[OK] Package zip file created fastapi_win_service.zip"
) || (
    echo "[ERROR] Failed to create zip package"
)



