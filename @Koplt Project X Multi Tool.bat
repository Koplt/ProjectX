@echo off
cls
mode 87,24
title roots [%RANDOM%] ~ Project X By Koplt
echo off
cls
set /p user=[96;40m[[92;40mKoplt[96;40m@[91;40mUsername[96;40m] [92;40m~# [97;40m
set /p pass=[96;40m[[92;40m%user%[96;40m@[91;40mPassword[96;40m] [92;40m~# [30;40m
if %user% == root if %pass% == root goto good
if %user% == Koplt if %pass% == Koplt goto good
goto again
:again
cls
echo off
cls
echo [92;40m*!Username / Password Wrong!!! 
set /p user=[96;40m[[92;40mFrizose[96;40m@[91;40mUsername[96;40m] [92;40m~# [97;40m
set /p pass=[96;40m[[92;40m%user%[96;40m@[91;40mPassword[96;40m] [92;40m~# [30;40m
if %user% == root if %pass% == root goto good
if %user% == Koplt if %pass% == Koplt goto good
goto again
:good
cls
type LoadingTheme.py
echo [96;40m[[92;40mLogging [96;40m%user% [91;40mIn [92;40m.  [96;40m]
ping localhost -n 2 >nul
cls
type LoadingTheme.py
echo [96;40m[[92;40mLogging [96;40m%user% [91;40mIn [92;40m.. [96;40m]
ping localhost -n 2 >nul
cls
type LoadingTheme.py
echo [96;40m[[92;40mLogging [96;40m%user% [91;40mIn [92;40m...[96;40m]
ping localhost -n 2 >nul
goto clear
:clear
cls
title roots [%RANDOM%] ~ Project X By Koplt User Connected [%user%]
mode 87,24
type tool.py
goto top
:top
set/p menu=[96;40m[[92;40m%user%[96;40m@[91;40mFrizose[96;40m] [92;40m~# [97;40m
if '%menu%' =='help' goto help
if '%menu%' =='tcp' goto Pinger
if '%menu%' =='lookup' goto Lookup
if '%menu%' =='ph' goto nudes
if '%menu%' =='putty' goto puTTy
if '%menu%' =='1' goto IpPinger1
if '%menu%' =='2' goto IpPinger2
if '%menu%' =='3' goto IpPinger3
if '%menu%' =='4' goto IpPinger4
if '%menu%' =='5' goto IpPinger5
if '%menu%' =='6' goto IpPinger6
if '%menu%' =='7' goto IpPinger7
if '%menu%' =='8' goto IpPinger8
if '%menu%' =='sms' goto sms
if '%menu%' =='pscan' goto port
if '%menu%' =='ports' goto openports
if '%menu%' =='booter' goto booter
if '%menu%' =='ipsave' goto IPsaver
if '%menu%' =='credits' goto credits
if '%menu%' =='logout' goto logout
if '%menu%' =='vedbex' goto vedbex
if '%menu%' =='host' goto host
if '%menu%' =='ascii' goto ascii
if '%menu%' =='clear' goto clear
if '%menu%' =='pingers' goto pingers
goto top 
:help
type menu.py
goto top
:pingers
type pingers.py
goto top
:Pinger 
:tcp
set /p tcpip=[96;40m[[92;40m%user%[96;40m@[91;40mTCP Ip[96;40m] [92;40m~# [97;40m
if %tcpip% == 1 goto 
set /p tcpport=[96;40m[[92;40m%user%[96;40m@[91;40mPort[96;40m] [92;40m~# [97;40m
if %tcpport% == 1 goto 
start paping.exe %tcpip% -p %tcpport%
goto top
:tcport
start tcpport.py
:Lookup
@echo off
color 09
mode 87,24
setlocal ENABLEDELAYEDEXPANSION
set webclient=webclient
del "%temp%\%webclient%.vbs" /f /q /s >nul
del "%temp%\response.txt" /f /q /s >nul
:menu
title roots [%RANDOM%] ~ Project X By Koplt User Connected [%user%]
:iplookup
color 09
cls
echo.
set ip=127.0.0.1
echo.
set /p ip=[96;40m[[92;40m%user%[96;40m@[91;40mIp[96;40m] [92;40m~# [97;40m
echo sUrl = "http://ipinfo.io/%ip%/json" > %temp%\%webclient%.vbs
:localip
cls
echo set oHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0") >> %temp%\%webclient%.vbs
echo oHTTP.open "GET", sUrl,false >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Type", "application/x-www-form-urlencoded" >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Length", Len(sRequest) >> %temp%\%webclient%.vbs
echo oHTTP.send sRequest >> %temp%\%webclient%.vbs
echo HTTPGET = oHTTP.responseText >> %temp%\%webclient%.vbs
echo strDirectory = "%temp%\response.txt" >> %temp%\%webclient%.vbs
echo set objFSO = CreateObject("Scripting.FileSystemObject") >> %temp%\%webclient%.vbs
echo set objFile = objFSO.CreateTextFile(strDirectory) >> %temp%\%webclient%.vbs
echo objFile.Write(HTTPGET) >> %temp%\%webclient%.vbs
echo objFile.Close >> %temp%\%webclient%.vbs
rem echo Msgbox HTTPGET,vbSystemModal+vbOKOnly+vbInformation, "IP Info" >> %temp%\%webclient%.vbs
echo Wscript.Quit >> %temp%\%webclient%.vbs
start %temp%\%webclient%.vbs
set /a requests=0
echo.
rem echo Waiting for API response. . .
echo  Looking up IP Address. . .
:checkresponseexists
set /a requests=%requests% + 1
if %requests% gtr 7 goto failed
IF EXIST "%temp%\response.txt" (
goto response_exist
) ELSE (
ping 127.0.0.1 -n 2 -w 1000 >nul
goto checkresponseexists
)
:failed
taskkill /f /im wscript.exe >nul
del "%temp%\%webclient%.vbs" /f /q /s >nul
echo.
echo Did not receive a response from the API.
echo.
pause
goto menu
:response_exist
cls
echo.
for /f "delims= 	" %%i in ('findstr /i "ip hostname city region country loc org postal" %temp%\response.txt') do (
	set data=%%i
	set data=!data:,=!
	set data=!data:""=[92;40mNot Listed!
	set data=!data:"=!
	set data=!data:ip:=[91;40mIP:		!
	set data=!data:hostname:=[96;40mHostname:	!
	set data=!data:city:=[92;40mCity:	!
	set data=!data:region:=[91;40mState:	!
	set data=!data:country:=[96;40mCountry:	!
	set data=!data:loc:=[92;40mLocation:	!
	set data=!data:org:=[96;40mSP:		!
	set data=!data:postal:=[91;40mPostal:	!
	echo [96;40m !data!
)
echo.
del "%temp%\%webclient%.vbs" /f /q /s >nul
del "%temp%\response.txt" /f /q /s >nul
pause
if '%ip%'=='' goto menu
goto clear
:logout
echo [92;40mLoging Out On %DATE%
ping localhost -n 2 >nul
echo [91;40mLoging %user% Out
ping localhost -n 2 >nul
echo [92;40mLoading...
ping localhost -n 2 >nul 
echo [91;40mThanks For Using My Multi Tool %USERNAME%! Bye Bye 
ping localhost -n 3 >nul
exit
:ascii
start http://patorjk.com/software/taag
echo  [96;40m Ascii Text Has Opened!
goto top
:sms
start smsniff.exe
echo  [96;40m SmartSniff Ip Sniffer Has Opened!
goto top
:openports
type portopen.py
goto top
:PuTTy @echo & cls
start PuTTY.exe
echo  [96;40m Putty Has Opened!
goto top
:IpPinger1 @echo & cls
start KopltPinger.bat
echo  [96;40m Frizose Ip Pinger Has Opened!
goto top
:IpPinger2 @echo & cls
start IPPingerV1byRavelCros_Cro.bat
echo  [96;40m Ip Pinger Has Opened!
goto top
:IpPinger3 @echo & cls
start IPPingerV2byRavelCros_Cro.bat
echo  [96;40m Ip Pinger Has Opened!
goto top
:IpPinger4 @echo & cls
start IPPingerV3byRavelCros_Cro.bat
echo  [96;40m Ip Pinger Has Opened!
goto top
:IpPinger5 @echo & cls
start IPPingerV4byRavelCros_Cro.bat
echo  [96;40m Ip Pinger Has Opened!
goto top
:IpPinger6 @echo & cls
start IPPingerV5byRavelCros_Cro.bat
echo  [96;40m Ip Pinger Has Opened!
goto top
:IpPinger7 @echo & cls
start IPPingerV6byRavelCros_Cro.bat
echo  [96;40m Ip Pinger Has Opened!
goto top
:IpPinger8 @echo & cls
start IPPingerV7byRavelCros_Cro.bat
echo  [96;40m Ip Pinger Has Opened!
goto top
:host @echo & cls
start https://check-host.net/?lang=en
echo  [96;40m Check Host Has Opened!
goto top
:port @echo & cls
start pScan.exe
echo  [96;40m Pscan Has Opened!
goto top
:vedbex @echo & cls
start https://www.vedbex.com/tools/home
echo  [96;40m Vedbex Has Opened!
goto top
:nudes @echo & cls
start www.pornub.com
echo  [96;40m Pornhub Has Opened!
goto top
:IPsaver
@echo off
title roots [%RANDOM%] ~ Project X By Koplt User Connected [%user%]
mode 87,24
:reset
cls
color 02
type logs.py
set /p name=[96;40m[[92;40m%user%[96;40m@[91;40mFrizose[96;40m] [92;40m~# [97;40m
echo.
if %name% == 1 goto open
set /p IP=ENTER %name%'s IP:
echo -  %name%  //  %IP%  -  %date% %time%>> IPLogs.txt
echo.
echo %name%'s Info Saved in Your Database 
echo Press Any Key to Restart IP Logs 
pause >nul
goto reset
:open
cls
start IPLogs.txt
goto clear
:booter @echo & cls
start www.stressthem.to
echo  [96;40m Stressthem Has Opened!
goto top
:credits @echo & cls
echo.
echo [92;40mMaker Of The Source/Multi Tool : [96;40mKoplt
echo [92;40mDiscord : Koplt#9485
echo [92;40mInstagram : Koplttt
echo [92;40mYouTube : Koplt
echo [92;40mNow Give Me A Blowjob For My Hard Work ;)[96;40m
pause
if '%credits%'=='' goto clear


