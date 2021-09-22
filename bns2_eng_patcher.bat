@echo off
mode con:cols=80 lines=50
echo "       ____  _           _                        _                   _      "
echo "      |  _ \| |         | |                      | |                 | |     "
echo "      | |_) | | __ _  __| | ___    __ _ _ __   __| |  ___  ___  _   _| |     "
echo "      |  _ <| |/ _` |/ _` |/ _ \  / _` | '_ \ / _` | / __|/ _ \| | | | |     "
echo "      | |_) | | (_| | (_| |  __/ | (_| | | | | (_| | \__ \ (_) | |_| | |     "
echo "      |____/|_|\__,_|\__,_|\___|  \__,_|_| |_|\__,_| |___/\___/ \__,_|_|     "
echo "                        _ _     _                   _       _                "
echo "                       | (_)   | |                 | |     | |               "
echo "        ___ _ __   __ _| |_ ___| |__    _ __   __ _| |_ ___| |__             "
echo "       / _ \ '_ \ / _` | | / __| '_ \  | '_ \ / _` | __/ __| '_ \            "
echo "      |  __/ | | | (_| | | \__ \ | | | | |_) | (_| | || (__| | | |           "
echo "       \___|_| |_|\__, |_|_|___/_| |_| | .__/ \__,_|\__\___|_| |_|           "
echo "                   __/ |               | |                                   "
echo "                  |___/                |_|                                   "
echo "-----------------------------------------------------------------------------"
echo "Get bns2 install location" 
for /f "delims=" %%a in ('powershell Get-ItemPropertyValue -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\MKR_B2_PURPLE" -Name InstallLocation') do set "pak=%%a\B2\Content\Paks\"
cd %pak%
:: get pak file
echo "Getting lastest .PAK file from https://github.com/Holastor/Blade-and-Soul-2-Localization"
powershell -Command "Invoke-WebRequest https://github.com/Holastor/Blade-and-Soul-2-Localization/releases/download/0.5.0/B2_Data_00002.pak -Outfile B2_Data_00002.pak"
echo "Download English Mod done!"
echo "-----------------------------------------------------------------------------"
powershell ls *.pak
echo "Install Succeeded!!"
echo "-----------------------------------------------------------------------------"
:: Change Language option
echo "Language option"
for /f "delims=" %%b in ('powershell $env:LOCALAPPDATA') do set "json=%%b\B2\Saved\Option"
powershell -Command "& {$a = Get-Content "%json%\LocalOption.json" -raw | ConvertFrom-Json; $a.loginOption.language = 22; $a | ConvertTo-Json | Set-Content "%json%\LocalOption.json";}"
cd %json%
powershell ls *.json
echo "Language Change Succeeded!!"
echo "*****************************************************************************"
echo "Successed Pacthing English for BNS2"
echo "-----------------------------------------------------------------------------"
echo "-------------------- BnS2 English Mod made by Holastor ----------------------"
echo "------------------ Install Script written by ToXuanCuong --------------------"
echo "----------------------------Good luck have fun-------------------------------"
echo "---------------------------------THANK YOU-----------------------------------"
echo "-----------------------------------------------------------------------------"
pause
cls
echo _______________________________________________________________________________
echo -------------------------------------------------------------------------------
echo _______________________________________________________________________________
echo -------------------------------------------------------------------------------
echo _______________________________________________________________________________
echo -------------------------------------------------------------------------------
echo UUUUUUUU     UUUUUUUU                                     UUUUUUUU     UUUUUUUU
echo U::::::U     U::::::U                                     U::::::U     U::::::U
echo U::::::U     U::::::U                                     U::::::U     U::::::U
echo UU:::::U     U:::::UU                                     UU:::::U     U:::::UU
echo  U:::::U     U:::::wwwwwww           wwwww           wwwwwwU:::::U     U:::::U 
echo  U:::::D     D:::::Uw:::::w         w:::::w         w:::::wU:::::D     D:::::U 
echo  U:::::D     D:::::U w:::::w       w:::::::w       w:::::w U:::::D     D:::::U 
echo  U:::::D     D:::::U  w:::::w     w:::::::::w     w:::::w  U:::::D     D:::::U 
echo  U:::::D     D:::::U   w:::::w   w:::::w:::::w   w:::::w   U:::::D     D:::::U 
echo  U:::::D     D:::::U    w:::::w w:::::w w:::::w w:::::w    U:::::D     D:::::U 
echo  U:::::D     D:::::U     w:::::w:::::w   w:::::w:::::w     U:::::D     D:::::U 
echo  U::::::U   U::::::U      w:::::::::w     w:::::::::w      U::::::U   U::::::U 
echo  U:::::::UUU:::::::U       w:::::::w       w:::::::w       U:::::::UUU:::::::U 
echo   UU:::::::::::::UU         w:::::w         w:::::w         UU:::::::::::::UU  
echo     UU:::::::::UU            w:::w           w:::w            UU:::::::::UU    
echo       UUUUUUUUU               www             www               UUUUUUUUU      
echo _______________________________________________________________________________
echo -------------------------------------------------------------------------------
echo _______________________________________________________________________________
echo ------------------------this text can make a sound UwU ------------------------
echo _______________________________________________________________________________
echo _______________________________________________________________________________
pause
