@echo off
cls
@echo =======================================================
@echo 		    �ϥΤΧK�d�n��
@echo.
@echo - �@�̩I�~�ϥΪ̤��n�N���u��Ω�էQ�M/�ΫD�k�ت�
@echo - �@�̥礣�Ӿ�ϥΪ̱N���u��Ω�էQ�M/�ΫD�k�ت��������G�M/�Ϊk�߳d��
@echo - �Y�ϥΪ��~��ϥΦ��u��A�Y��ܨϥΪ̤w�\Ū�B�F�ѨæP�N���n���[�P�N�Ѫ�
@echo   �Ҧ����e�W�z�����A�B�ϥΪ��A�Ѧ��u��ϥΫ�A�����������D�P�@�̵L���C
@echo. 	
@echo =======================================================
echo.
@echo ===================== �ۧڷ��� ========================
echo.
@echo ============= �U�W��q�A�ҥH�n�ӷo�J�� ================
echo.
@echo --------------------  �`�N  ------------------------
@echo.
@echo       ��J����榡����A�|���ۧڷ����L�@��!!!!!
@echo ----------------------------------------------------

:start
echo.
SET disdata=0
:: -------- 1. �ШϥΪ̿�J���
@echo - �Ш̤U��d�ҿ�J���
@echo %date:~0,4%-%date:~5,2%-%date:~8,2%
echo.
@echo - �Y�J��2020/4/1�A�и� 0�A�V�U��d�Ҩ���
@echo 2020-04-01
echo.
@SET /P disdata=�b����J�����A���U Enter : 
echo.
@echo ___________________________________________________
echo.
@echo - �аݱz��J�� %disdata% �O���T����?
echo.
choice /C YN /M "�O�Ы� Y�A���O�Ы� N"
echo.
if errorlevel 2 goto doNo
if errorlevel 1 goto doYes

:doNo
echo ---- �A�����s��J
goto start

:doYes
@echo ___________________________________________________
echo.
echo --- �ϥΪ̤w�T�{�A�B�z��...
md C:\testm
:: -------- 2. �N�ϥΪ̿�J����إߦ�����ɨé�J�ҳ]�w��m
echo %disdata% > C:\testm\data.txt
@echo.
IF  EXIST C:\testm\data.txt ( echo ---##  data.txt �w�s�b )
:: -------- �[�J�ثe�ϥΪ̨õ����ɮ��v��
ICACLS  C:\testm\data.txt /GRANT %USERNAME%:F
goto doit

:doit
:: -------- 3. copy SGtool.bat ��Ұʸ�Ƨ�

@echo ___________________________________________________
echo.
echo --- �i��ƻs��....
@echo.
copy "%~dp0SGtool.bat" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\"
:: -------- �[�J�ثe�ϥΪ̨õ����ɮ��v��
ICACLS  "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\SGtool.bat" /GRANT %USERNAME%:(D,WDAC)
@echo.
IF  EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\SGtool.bat" ( echo ---##  SGtool.bat �w�s�b )
echo.
start C:\testm
start "" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\" /B /MIN

@echo ___________________________________________________
echo.
@echo - �аݭn���z�R���ɮ׶�?
@echo 	(���n�N�H�u��ʧR���Ӥw�A���v�T�U�c�p�u��B�@) 
echo.
choice /C YN /M "�n�Ы� Y�A���n�Ы� N"
echo.
if errorlevel 2 goto toCancel
if errorlevel 1 goto toDestroy


:: 4. �R�����a��Ҧ��F��
:toDestroy
del /f /q "%~dp0"
IF  NOT EXIST "%~dp0" (echo --- �w�P��...)
goto end

:toCancel
goto end

:end
@echo ___________________________________________________
echo.
echo --- �ۧڷ����w�ǳƴN��~ �����ɾ����{~ o_O+ ---
echo.

@echo __ ���ۧ@�Y�ĥ� �Х� CC �m�W�Х�-�D�ӷ~��-�T���@ 4.0 ��� ���v���ڱ��v. __
echo.
PAUSE
