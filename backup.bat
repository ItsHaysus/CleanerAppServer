@echo off
echo Backing up computer
set dt=%date:~7,2%-%date:~4,2%-%date:~10,4%
timeout /t 5
C:\CleanerUTRGV\Dependencies\7za a -tzip C:\Users\%username%\Desktop\Backup_%dt%.zip -r0 C:\Users\%username%\Downloads\*.txt C:\Users\%username%\Downloads\*.pdf C:\Users\%username%\Downloads\*.docx C:\Users\%username%\Downloads\*.pptx C:\Users\%username%\Downloads\*.ppt C:\Users\%username%\Downloads\*.xlsx C:\Users\%username%\Downloads\*.xls C:\Users\%username%\Downloads\*.doc C:\Users\%username%\Desktop\*.txt C:\Users\%username%\Desktop\*.pdf C:\Users\%username%\Desktop\*.docx C:\Users\%username%\Desktop\*.pptx C:\Users\%username%\Desktop\*.ppt C:\Users\%username%\Desktop\*.xlsx C:\Users\%username%\Desktop\*.xls C:\Users\%username%\Desktop\*.doc C:\Users\%username%\Documents\*.txt C:\Users\%username%\Documents\*.pdf C:\Users\%username%\Documents\*.docx C:\Users\%username%\Documents\*.pptx C:\Users\%username%\Documents\*.ppt C:\Users\%username%\Documents\*.xlsx C:\Users\%username%\Documents\*.xls C:\Users\%username%\Documents\*.doc 

echo Backup done

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
