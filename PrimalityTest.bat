@echo off
Color 02
echo * ----------------------------------------------------------- *
echo * Primality Test by Vision Paudel                             *
echo * https://github.com/Vision-Paudel/PrimalityTest_BatchScript  *
echo * ----------------------------------------------------------  * 

:NEWNUMBER
set /p number="Enter a positive integer number (0 to exit): "
echo %number%|findstr /r /c:"^[0-9][0-9]*"$ >nul
if errorlevel 1 (GOTO NotValidNumber)

REM First Five Cases
if %number%==0 GOTO EXIT
if %number%==1 GOTO NOTPRIME
if %number% gtr 1 if %number% leq 3 GOTO PRIME
if %number%==4 GOTO NOTPRIME
if %number%==5 GOTO PRIME

REM Check If Divisible by 2
set divisor=2
echo Divide by %divisor%
set /a mod= %number% %% %divisor%
if %mod%==0 GOTO NOTPRIME 
 
REM Set New Max to check up to
set /a newMax = %number% / %divisor% 

REM | * ------------------------------------------------------------------------- * |
REM | * Loop to check rest of the divisors starting at 3                           * |
REM | * and going up by 2 until divisor is approximately the square of the number * |
REM | * ------------------------------------------------------------------------- * |

set divisor=3

:LOOP

echo Divide by %divisor%
set /a mod= %number% %% %divisor%

if %mod%==0 GOTO NOTPRIME 
if %divisor% geq %newMax% GOTO PRIME

set /a newMax = %number% / %divisor% 
set /a divisor = %divisor% + 2

GOTO LOOP

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

:EXIT
Color
