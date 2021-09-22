::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWGLUoxhjcUEGHkSyEVb6b5YO7env5uSA4mglcYI=
::fBE1pAF6MU+EWGLUoxhjcUEGHkSyEVb6b5MV5O317ueC+A0+Dt4Ka4rJyYiNNe8d7XnAcIUmwnVKpOUJG1tecR6vax1llU1Kt2qCMoeIvE/ERE+F71g4VWBsggM=
::fBE1pAF6MU+EWGLUoxhjcUEGHkSyEVb6b5MT+uX6+7DH9BlddusrOJOb7b2AJO8E+QWsXJg732lTmscJRXs=
::fBE1pAF6MU+EWGLUoxhjcUEGH0SyEVb6b5QY7OH16KqOoUITDqIcIrPryLuJMuEeqmPteZM+ljJCwJ1FMDV7TT2NWjMW+1JLtWuLec6fvEGvBAimzSs=
::fBE1pAF6MU+EWGLUoxhjcUEGH0SyEVb6b5QY7OH16KqVp14SQfA8fZyVlPrOD8tz
::fBE1pAF6MU+EWGLUoxhjcUEGH0SyEVb6b4UO5+v+/PnHpEQTXfE3fYu7
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGmW+0UiKRYUag2OOXj6Tq1EvqHHwcm0jWspaMBtRIbY1brAKeMcig==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBhBQwqFAE+/Fb4I5/jHwe+Q4ksSWOY6at7n+byPLucWqlHrNb0ixH9blosgDRVfaxOsa28=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
:: Change Language option
echo "Language option"
for /f "delims=" %%b in ('powershell $env:LOCALAPPDATA') do set "json=%%b\B2\Saved\Option"
powershell -Command "& {$a = Get-Content "%json%\LocalOption.json" -raw | ConvertFrom-Json; $a.loginOption.language = 1; $a | ConvertTo-Json | Set-Content "%json%\LocalOption.json";}"
cd %json%
powershell ls *.json
echo "Language Change Succeeded!!"
pause