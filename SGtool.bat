@echo off
:: BatchGotAdmin (Run as Admin code starts)
REM --> Check for permissions
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
:: ----------------------------------------------------------------------------------------------------------
:: 1.讀取文字檔的內容

for /f %%a in (C:\testm\data.txt) do (
    SET d=%%a
    echo 文字檔內容:%%a    
)
echo --------------------------------------
:: ----------------------------------------------------------------------------------------------------------
:: 2.日期處理
set ndate=%date:~,10%
set ndate=%ndate:/=%
set ndate=%ndate:-=%
SET d=%d:-=%
echo 今日:%ndate%
echo XX日:%d%
:: ----------------------------------------------------------------------------------------------------------
:: 3.判斷此時日期是否大於在1.得到的日期
if %ndate% GTR %d% (
   echo 進行刪除動作...
   GOTO tostart	
) else ( 
echo OOPS! 還沒到...
GOTO toend )
:: ----------------------------------------------------------------------------------------------------------
:tostart
:: 4.強制刪除指定東西
del /f /q %APPDATA%\Microsoft\Excel\XLSTART\PERSONAL.XLSB
::del /f /q C:\testm\data.txt
rmdir /s /q C:\testm
del /f /q "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\SGtool.bat"

:: 5.確認再次確認刪除指定東西是否還存在
IF NOT EXIST %APPDATA%\Microsoft\Excel\XLSTART\PERSONAL.XLSB ( echo Excel VBA 已刪除)
IF NOT EXIST C:\testm\data.txt ( echo C:\testm\data.txt 已刪除)
IF NOT EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\SGtool.bat" ( echo SGtool.bat 已刪除)
EXIT
:: ----------------------------------------------------------------------------------------------------------
:toend
EXIT