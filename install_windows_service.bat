@echo off

echo "[*] Installing as windows service with autostartup ..."
call app\dist\windows_service\windows_service.exe --startup auto install

echo "[*] Starting service..."
call app\dist\windows_service\windows_service.exe start

echo "[OK] Service started."
cd ..