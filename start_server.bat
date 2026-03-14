@echo off
echo =============================
echo  Liver Simulation Server
echo =============================
echo.

:: Python確認
python --version >nul 2>&1
if %errorlevel% == 0 (
    echo Starting Python server on http://localhost:8080
    start http://localhost:8080
    python -m http.server 8080
) else (
    :: Node.js確認
    npx --version >nul 2>&1
    if %errorlevel% == 0 (
        echo Starting Node server on http://localhost:8080
        start http://localhost:8080
        npx serve -p 8080
    ) else (
        echo ERROR: Python も Node.js もインストールされていません
        echo https://www.python.org からPythonをインストールしてください
        pause
    )
)
