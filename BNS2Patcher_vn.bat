@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
mode con:cols=80 lines=50
for /f "delims=" %%b in ('powershell $env:LOCALAPPDATA') do set "basePath=%%b"
for /f "delims=" %%a in ('powershell Get-ItemPropertyValue -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\MKR_B2_PURPLE" -Name InstallLocation') do set "pakPath=%%a\B2\Content\Paks\"
set lang=%basePath%\B2\Saved\Option
set cache=%basePath%\BNS2Patcher\
set patchInfoUrl="https://raw.githubusercontent.com/chaienoto/BNS2Patcher/main/patcherInfo.json"
set kr=1
::---------------------------------------------------------------------------------
if not exist "%cache%" (
    goto firstInstall
) else (
    call:getCurrentVersion
    goto menu
)
::---------------------------------------------------------------------------------
:firstInstall
call:printLogo
ECHO Ban chua su dung BNS2 English Patcher by Chaienoto
SET /P M= An Y (y) sau do ENTER de dong y: 
IF %M%==Y goto getRecourse
IF %M%==y goto getRecourse
EXIT
::---------------------------------------------------------------------------------
:getRecourse
mkdir %cache%
echo ------------------------------------------------------------------------------
echo --------------------------- LAY THONG TIN BAN MOD ----------------------------
echo ------------------------------------------------------------------------------
curl %patchInfoUrl% > %cache%patcherInfo.json
echo ------------------------------------------------------------------------------
echo ------------------------- CHI TIET THONG TIN BAN MOD -------------------------
echo ------------------------------------------------------------------------------
powershell -Command "&{"^
 cd %cache%;^
 "$j = Get-Content "%cache%patcherInfo.json" -raw | ConvertFrom-Json; $j;"^
 Invoke-WebRequest $j.modFileUrl -Outfile $j.modFileName;^
 }"
call:getCurrentVersion
goto movingModFile
exit
::---------------------------------------------------------------------------------
:movingModFile
echo ------------------------------------------------------------------------------
echo ------------------------ COPY MOD VAO THU MUC BNS2 ---------------------------
echo ------------------------------------------------------------------------------
xcopy "%cache%*.pak" "%pakPath%" /y /f 
call:changeToEN
goto:eof
::---------------------------------------------------------------------------------
:menu
call:printLogo
echo Ban mod EngLish hien tai : %currentVersion%         
set M=0
ECHO  1 - Chuyen sang tieng anh
ECHO  2 - Chuyen sang tieng han 
ECHO  3 - Kiem tra cap nhat English Mod BNS2
ECHO  4 or ENTER de Thoat
ECHO.
SET /P M= Chon chuc nang ban muon sau do ENTER: 
IF %M%==1 call:changeToEN
IF %M%==2 call:changeToKR
IF %M%==3 call:checkUpdate
IF %M%==4 EXIT
exit
::---------------------------------------------------------------------------------
:checkUpdate
for /f "delims=" %%e in (
    'powershell -Command "&{[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $j = Invoke-RestMethod %patchInfoUrl%; $j.versionInfo;}"'
    ) do set "lastedVersion=%%e"
call:getCurrentVersion 
if "%lastedVersion%" == "%currentVersion%" (
    echo Phien ban hien tai la moi nhat
) else (
    call:getApproveToUpdate
)
echo.&pause&call:menu
::---------------------------------------------------------------------------------
:getApproveToUpdate
echo  Phien ban hien tai : %currentVersion%
echo  Phien ban moi nhat : %lastedVersion%
echo  Ban co muon cap nhat khong?
SET /P N=  An y (hoac Y) sau do ENTER de dong y: 
IF %N%==y call:goUptodate
IF %N%==Y call:goUptodate
goto:eof
::---------------------------------------------------------------------------------
:goUptodate
echo ------------------------------------------------------------------------------
echo ----------------------- TIEN HANH CAP NHAT BNS2 PATCHER ----------------------
echo ------------------------------------------------------------------------------
echo.
goto getRecourse
goto:eof
::---------------------------------------------------------------------------------
:getCurrentVersion
for /f "delims=" %%c in (
    'powershell -Command "&{ $j = Get-Content "%cache%patcherInfo.json" -raw | ConvertFrom-Json; $j.versionInfo;}"'
    ) do set "currentVersion=%%c"
goto:eof
::---------------------------------------------------------------------------------
:changeToKR
call:changeLanguage %kr% HAN
goto:eof
::---------------------------------------------------------------------------------
:changeToEN
call:get_en_USCode 
call:changeLanguage %en% ANH
goto:eof
::---------------------------------------------------------------------------------
:get_en_USCode
for /f "delims=" %%d in (
    'powershell -Command "&{ $j = Get-Content "%cache%patcherInfo.json" -raw | ConvertFrom-Json; $j.en_USCode;}"'
    ) do set "en=%%d"
goto:eof
::---------------------------------------------------------------------------------
:changeLanguage
echo ------------------------------------------------------------------------------
echo ---------------------- THAY DOI NGON NGU SANG TIENG %~2 ----------------------
echo ------------------------------------------------------------------------------
powershell -Command "&{"^
 "$a = Get-Content "%lang%\LocalOption.json" -raw | ConvertFrom-Json;"^
 "$a.loginOption.language = %~1;"^
 "$a | ConvertTo-Json | Set-Content "%lang%\LocalOption.json";"^
 }"
echo OK
echo An phim bat ki de ve menu chinh
echo.&pause&call:menu
::---------------------------------------------------------------------------------
:printLogo
cls
echo "------------------------------------------------------------------------------"
echo "    ____  _           _                        _                   _   ___    "
echo "   |  _ \| |         | |                      | |                 | | |__ \   "
echo "   | |_) | | __ _  __| | ___    __ _ _ __   __| |  ___  ___  _   _| |    ) |  "
echo "   |  _ <| |/ _` |/ _` |/ _ \  / _` | '_ \ / _` | / __|/ _ \| | | | |   / /   "
echo "   | |_) | | (_| | (_| |  __/ | (_| | | | | (_| | \__ \ (_) | |_| | |  / /_   "
echo "   |____/|_|\__,_|\__,_|\___|  \__,_|_| |_|\__,_| |___/\___/ \__,_|_| |____|  "
echo "                      _____      _       _                                    "
echo "                     |  __ \    | |     | |                                   "
echo "                     | |__) |_ _| |_ ___| |__   ___ _ __                      "
echo "                     |  ___/ _` | __/ __| '_ \ / _ \ '__|                     "
echo "                     | |  | (_| | || (__| | | |  __/ |                        "
echo "                     |_|   \__,_|\__\___|_| |_|\___|_|                        "
echo "                                                                              "
echo "------------------------------------------------------------------------------"
echo "--------------------- BnS2 English Mod made by Holastor ----------------------"
echo "-------------------- Install Script written by Chaienoto ---------------------"
echo "------------------------------------------------------------------------------"
echo.
goto:eof