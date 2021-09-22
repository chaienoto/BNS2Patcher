@echo off
:: Change Language option
echo "Language option"
for /f "delims=" %%b in ('powershell $env:LOCALAPPDATA') do set "json=%%b\B2\Saved\Option"
powershell -Command "& {$a = Get-Content "%json%\LocalOption.json" -raw | ConvertFrom-Json; $a.loginOption.language = 22; $a | ConvertTo-Json | Set-Content "%json%\LocalOption.json";}"
cd %json%
powershell ls *.json
echo "Language Change Succeeded!!"
pause