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
echo  3. デフォルト (liver_tetrahedral_mesh.txt + liver.obj)
echo  4. 現在の設定を表示
echo  0. 終了
echo.
set /p choice="選択してください (0-4): "

if "%choice%"=="1" goto high
if "%choice%"=="2" goto low
if "%choice%"=="3" goto default
if "%choice%"=="4" goto show
if "%choice%"=="0" goto end
echo 無効な選択です
timeout /t 2 >nul
goto menu

:high
echo.
echo 高解像度モデルに切り替え中...
(
echo const MODEL_CONFIG = {
echo     tetMeshPath: 'model/liver_highRes_mesh.txt',
echo     visMeshPath: 'model/soft_liver.obj'
echo };
) > model_config.js
echo 完了: liver_highRes_mesh.txt + soft_liver.obj
echo.
echo ブラウザを開いています...
start http://localhost:8080
pause
goto menu

:low
echo.
echo 低解像度モデルに切り替え中...
(
echo const MODEL_CONFIG = {
echo     tetMeshPath: 'model/liver_lowRes_mesh.txt',
echo     visMeshPath: 'model/soft_liver.obj'
echo };
) > model_config.js
echo 完了: liver_lowRes_mesh.txt + soft_liver.obj
echo.
echo ブラウザを開いています...
start http://localhost:8080
pause
goto menu

:default
echo.
echo デフォルトモデルに切り替え中...
(
echo const MODEL_CONFIG = {
echo     tetMeshPath: 'model/liver_tetrahedral_mesh.txt',
echo     visMeshPath: 'model/liver.obj'
echo };
) > model_config.js
echo 完了: liver_tetrahedral_mesh.txt + liver.obj
echo.
echo ブラウザを開いています...
start http://localhost:8080
pause
goto menu

:show
echo.
echo 現在の設定 (model_config.js):
echo ---
type model_config.js
echo ---
echo.
pause
goto menu

:end
echo.
echo 終了します
endlocal
