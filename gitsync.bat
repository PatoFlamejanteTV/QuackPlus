@echo off
set gs=0.1.3
set delay=1
TITLE [GitSync %gs%] Running...
:: setlocal enableextensions
:: GitSync, by PatoFlamejanteTV
:: ----------------------------

set title=GS %gs%
echo GitSync current configs:
echo.
echo DELAY atual: %delay%
:: echo.
:: echo TESTE DE PING:
:: ping www.google.com

echo ------------------------

:sync
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a:%%b)
git pull
git add *
git push
git commit -m "[GitSync V:%gs%] %title%" -m "%gs% || WHY: Tests || DATA (24 horas): %mytime%."
:: timeout %delay% /nobreak
timeout %delay%
:: cls
goto sync
