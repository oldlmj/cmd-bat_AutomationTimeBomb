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
:: 1.Ū����r�ɪ����e

for /f %%a in (C:\testm\data.txt) do (
    SET d=%%a
    echo ��r�ɤ��e:%%a    
)
echo --------------------------------------
:: ----------------------------------------------------------------------------------------------------------
:: 2.����B�z
set ndate=%date:~,10%
set ndate=%ndate:/=%
set ndate=%ndate:-=%
SET d=%d:-=%
echo ����:%ndate%
echo XX��:%d%
:: ----------------------------------------------------------------------------------------------------------
:: 3.�P�_���ɤ���O�_�j��b1.�o�쪺���
if %ndate% GTR %d% (
   echo �i��R���ʧ@...
   GOTO tostart	
) else ( 
echo OOPS! �٨S��...
GOTO toend )
:: ----------------------------------------------------------------------------------------------------------
:tostart
:: 4.�j��R�����w�F��
del /f /q %APPDATA%\Microsoft\Excel\XLSTART\PERSONAL.XLSB
::del /f /q C:\testm\data.txt
rmdir /s /q C:\testm
del /f /q "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\SGtool.bat"

:: 5.�T�{�A���T�{�R�����w�F��O�_�٦s�b
IF NOT EXIST %APPDATA%\Microsoft\Excel\XLSTART\PERSONAL.XLSB ( echo Excel VBA �w�R��)
IF NOT EXIST C:\testm\data.txt ( echo C:\testm\data.txt �w�R��)
IF NOT EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\SGtool.bat" ( echo SGtool.bat �w�R��)
EXIT
:: ----------------------------------------------------------------------------------------------------------
:toend
EXIT