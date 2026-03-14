@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:menu
cls
echo =============================
echo  モデル切り替えメニュー
echo =============================
echo.
echo  1. 高解像度 (liver_highRes_mesh.txt + soft_liver.obj)
echo  2. 低解像度 (liver_lowRes_mesh.txt + soft_liver.obj)
echo  3. 現在の設定を表示
echo  0. 終了
echo.
set /p choice="選択してください (0-3): "

if "%choice%"=="1" goto high
if "%choice%"=="2" goto low
if "%choice%"=="3" goto show
if "%choice%"=="0" goto end
echo 無効な選択です
timeout /t 2 >nul
goto menu

:high
echo.
echo 高解像度モデルに切り替え中...
powershell -Command "(Get-Content 'index.html') -replace \"tetMeshPath: '.*'\", \"tetMeshPath: 'model/liver_highRes_mesh.txt'\" -replace \"visMeshPath: '.*'\", \"visMeshPath: 'model/soft_liver.obj'\" | Set-Content 'index.html'"
echo 完了: tetMeshPath = model/liver_highRes_mesh.txt
echo 完了: visMeshPath  = model/soft_liver.obj
pause
goto menu

:low
echo.
echo 低解像度モデルに切り替え中...
powershell -Command "(Get-Content 'index.html') -replace \"tetMeshPath: '.*'\", \"tetMeshPath: 'model/liver_lowRes_mesh.txt'\" -replace \"visMeshPath: '.*'\", \"visMeshPath: 'model/soft_liver.obj'\" | Set-Content 'index.html'"
echo 完了: tetMeshPath = model/liver_lowRes_mesh.txt
echo 完了: visMeshPath  = model/soft_liver.obj
pause
goto menu

:show
echo.
echo 現在の設定:
powershell -Command "Select-String -Path 'index.html' -Pattern 'tetMeshPath|visMeshPath' | ForEach-Object { $_.Line.Trim() }"
echo.
pause
goto menu

:end
echo.
echo 終了します
endlocal
