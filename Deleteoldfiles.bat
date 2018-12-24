@echo off
echo Initiating Deletion
timeout /t 5
echo Deleting PDF files
forfiles /P C:\Users\%username%\Desktop\ /S /D -730 /M *.pdf /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Documents\ /S /D -730 /M *.pdf /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Downloads\ /S /D -730 /M *.pdf /C "cmd /c del @path"

echo Deleting Word files
forfiles /P C:\Users\%username%\Desktop\ /S /D -365 /M *.doc /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Desktop\ /S /D -730 /M *.docx /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Documents\ /S /D -365 /M *.doc /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Documents\ /S /D -730 /M *.docx /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Downloads\ /S /D -365 /M *.doc /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Downloads\ /S /D -730 /M *.docx /C "cmd /c del @path"

echo Deleting Powerpoint files
forfiles /P C:\Users\%username%\Desktop\ /S /D -730 /M *.ppt /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Desktop\ /S /D -730 /M *.pptx /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Downloads\ /S /D -730 /M *.ppt /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Downloads\ /S /D -730 /M *.pptx /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Documents\ /S /D -730 /M *.ppt /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Documents\ /S /D -730 /M *.pptx /C "cmd /c del @path"

echo Deleting Excel files
forfiles /P C:\Users\%username%\Desktop\ /S /D -730 /M *.xls /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Desktop\ /S /D -730 /M  *xlsx /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Documents\ /S /D -730 /M *.xls /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Documents\ /S /D -730 /M  *xlsx /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Desktop\ /S /D -730 /M *.xls /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Desktop\ /S /D -730 /M  *xlsx /C "cmd /c del @path"

echo Deleting Text files
forfiles /P C:\Users\%username%\Desktop\ /S /D -730 /M *.txt /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Downloads\ /S /D -730 /M *.txt /C "cmd /c del @path"
forfiles /P C:\Users\%username%\Documents\ /S /D -730 /M *.txt /C "cmd /c del @path"

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