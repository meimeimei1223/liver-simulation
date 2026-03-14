@echo off
chcp 65001 >nul

:menu
cls
echo =============================
echo  Liver Model Switcher
echo =============================
echo.
echo  1. Model 1 (Default)
echo  2. Model 2 (High-Res)
echo  3. Model 3 (Low-Res)
echo  0. Exit
echo.
set /p choice="Select (0-3): "

if "%choice%"=="1" goto model1
if "%choice%"=="2" goto model2
if "%choice%"=="3" goto model3
if "%choice%"=="0" goto end
goto menu

:model1
copy /Y model\model1\liver_tetrahedral_mesh.txt model\liver_tetrahedral_mesh.txt
copy /Y model\model1\liver.obj model\liver.obj
echo Done: Switched to Model 1
start http://localhost:8080
pause
goto menu

:model2
copy /Y model\model2\liver_tetrahedral_mesh.txt model\liver_tetrahedral_mesh.txt
copy /Y model\model2\liver.obj model\liver.obj
echo Done: Switched to Model 2
start http://localhost:8080
pause
goto menu

:model3
copy /Y model\model3\liver_tetrahedral_mesh.txt model\liver_tetrahedral_mesh.txt
copy /Y model\model3\liver.obj model\liver.obj
echo Done: Switched to Model 3
start http://localhost:8080
pause
goto menu

:end
exit
