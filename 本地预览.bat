@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo   虎式 I 型 · 131  —  本地预览
echo   ------------------------------------
echo   地址: http://127.0.0.1:8777
echo   关闭本窗口即停止服务
echo.

start "" http://127.0.0.1:8777/index.html

set "PY=C:\Users\Administrator\AppData\Local\Programs\Python\Python312\python.exe"
if not exist "%PY%" set "PY=python"

"%PY%" -m http.server 8777 --bind 127.0.0.1
pause
