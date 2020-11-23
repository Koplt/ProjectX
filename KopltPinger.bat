@echo off
title Koplt Ip Pinger
echo off & cls
mode 87,24
type Dontopen.py
set /p IP=[96;40m[[92;40mKoplt[96;40m@[91;40mPinger[96;40m] [92;40m~# [97;40m
:top
PING -n 1 %IP% | FIND "TTL=">nul
IF ERRORLEVEL 1 goto succes
IF NOT ERRORLEVEL 1 goto wait
:succes
echo   [92;40m%IP% Has Been Timed Out [91;107m [91;40m By Koplt
ping localhost -n 2 >nul
goto top
:wait
echo   [92;40m%IP% Is Connected [91;107m [96;40m Targtet Online
ping localhost -n 2 >nul
goto top
