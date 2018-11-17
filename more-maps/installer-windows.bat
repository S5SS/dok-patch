@echo off
rem hack to check if run from within the zip
if not exist "Managed" (
	echo Please unzip the zip file first!
	echo Make sure to run the installer you just unzipped instead of the one inside the zip file
	echo Installation failed!
	pause
	exit
)

rem find steam path
for /F "Tokens=1,2*" %%A In ('Reg Query HKCU\SOFTWARE\Valve\Steam') Do (
    if "%%A" Equ "SteamPath" Set "steam_path=%%C")
if not defined steam_path (
	echo Steam installation directory not found
	echo Installation failed!
	pause
	exit
) else (
	echo The Steam folder path is "%steam_path%"
)

rem find the dok install location
set "dok_path=%steam_path%\steamapps\common\Deserts of Kharak"
if not exist "%dok_path%" (
	rem TODO: read from %steam_path%\config\config.vdf to get steamapps location
	:path_loop
	echo Unable to locate install directory!
	echo You may have steamapps installed in a different location
	set /p dok_path="Please paste your full path to your Deserts of Kharak folder: "
	
	rem hack to make sure the directory selected is the dok folder
	if not exist "%dok_path%/default.dokhotkeys" goto path_loop
)

echo The Deserts of Kharak path is "%dok_path%"
rem rename managed folder as backup
echo Creating backup...
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined mydate set mydate=%%x
move /Y "%dok_path%\Data\Managed" "%dok_path%\Data\Managed_%DATE:/=%-%TIME::=%" > nul
call :CHECK_FAIL

rem move mod files into right places
echo Installing mod...
xcopy /I /E /Y "Managed" "%dok_path%\Data\Managed" > nul
call :CHECK_FAIL

goto exit
:exit
echo Installation successful!
pause
exit

:CHECK_FAIL
if NOT ["%errorlevel%"]==["0"] (
	echo Installation failed!
    pause
    exit
)
