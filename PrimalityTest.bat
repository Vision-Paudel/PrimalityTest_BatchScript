@echo off
REM Primality Test by Vision Paudel
echo Primality Test by Vision Paudel

Color 02

:NEWNUMBER
set /p number="Enter an integer number: "
echo %number%|findstr /r /c:"^[0-9][0-9]*"$ >nul
if errorlevel 1 (GOTO NotValidNumber)

if %number%==1 GOTO NOTPRIME
if %number% gtr 1 if %number% leq 3 GOTO PRIME
if %number%==4 GOTO NOTPRIME
if %number%==5 GOTO PRIME

set divisor=2
echo Divide by %divisor%
set /a mod= %number% %% %divisor%
if %mod%==0 GOTO NOTPRIME 
 
set /a newMax = %number% / %divisor% 
set divisor=3

:LOOP2

echo Divide by %divisor%
set /a mod= %number% %% %divisor%
if %mod%==0 GOTO NOTPRIME 
if %divisor% geq %newMax% GOTO NOTPRIME
echo newMax is %newMax%
set /a divisor = %divisor% + 2

GOTO LOOP2

Color
pause
exit

:PRIME
echo %number% is a prime number!
pause
goto NEWNUMBER

:NOTPRIME
echo %number% is not a prime number.
pause
goto NEWNUMBER

:NotValidNumber
echo %number% is not a valid positive integer number
goto NEWNUMBER