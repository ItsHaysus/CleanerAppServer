@echo off
::version 1.3.3

::Changelog
::1.3.3: fixed problem where emty folders were being backed up, added extentions to whitelist, syntax fixes
::1.2.1: Added Added countdown, fixed crash errors
::1.1.1: Changed time to delete from 365 to 730 days
::1.1.0: Added autodelete 
::1.0.1: Fixed error with backuo
echo Backing up computer
set dt=%date:~7,2%-%date:~4,2%-%date:~10,4%
timeout /t 5

::where zip is the conversion type and %username% is a wildcard
7za a -tzip C:\Users\%username%\Desktop\Backup_%dt%.zip -r0 C:\Users\%username%\*.txt C:\Users\%username%\*.pdf C:\Users\%username%\*.docx C:\Users\%username%\*.pptx C:\Users\%username%\*.ppt C:\Users\%username%\*.xlsx C:\Users\%username%\*.xls C:\Users\%username%\*.doc 
echo Backup done
echo deleting files older than 730 days
timeout /t 5
:: where 730 days is two years
echo Deleting PDF files
forfiles /P C:\Users\%username%\ /S /D -730 /M *.pdf /C "cmd /c del @path"
echo Deleting Word files
forfiles /P C:\Users\%username%\ /S /D -730 /M *.doc /C "cmd /c del @path"
forfiles /P C:\Users\%username%\ /S /D -730 /M *.docx /C "cmd /c del @path"
echo Deleting Powerpoint files
forfiles /P C:\Users\%username%\ /S /D -730 /M *.ppt /C "cmd /c del @path"
forfiles /P C:\Users\%username%\ /S /D -730 /M *.pptx /C "cmd /c del @path"

echo Deleting Excel files
forfiles /P C:\Users\%username%\ /S /D -730 /M *.xls /C "cmd /c del @path"
forfiles /P C:\Users\%username%\ /S /D -730 /M  *xlsx /C "cmd /c del @path"

echo Deleting Text files
forfiles /P C:\Users\%username%\ /S /D -730 /M *.txt /C "cmd /c del @path"

echo This window closes in 10 seconds
ping -n 2 127.0.0.1>nul
echo This window closes in 9 seconds
ping -n 2 127.0.0.1>nul
echo This window closes in 8 seconds
ping -n 2 127.0.0.1>nul
echo This window closes in 7 seconds
ping -n 2 127.0.0.1>nul
echo This window closes in 6 seconds
ping -n 2 127.0.0.1>nul
echo This window closes in 5 seconds
ping -n 2 127.0.0.1>nul
echo This window closes in 4 seconds
ping -n 2 127.0.0.1>nul
echo This window closes in 3 seconds
ping -n 2 127.0.0.1>nul
echo This window closes in 2 seconds
ping -n 2 127.0.0.1>nul
echo This window closes in 1 seconds
ping -n 2 127.0.0.1>nul

exit
