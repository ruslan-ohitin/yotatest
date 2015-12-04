@echo off

:begin

 :: Get date and time in vars
 for /f "tokens=1-4 delims=/-. " %%G in ('date /t') do (set ADATE=%%I-%%H-%%G)
 for /f "tokens=1-4 delims=:" %%G in ('time /t') do (set ATIME=%%G:%%H)

 wget -O status.txt http://status.yota.ru/status

 findstr "3GPP.RSSI" status.txt > temp.txt
 for /F "tokens=1,2 delims==" %%i IN (temp.txt) do set rssi=%%j 

 findstr "3GPP.RSRP" status.txt > temp.txt
 for /F "tokens=1,2 delims==" %%i IN (temp.txt) do set rsrp=%%j 

 findstr "3GPP.RSRQ" status.txt > temp.txt
 for /F "tokens=1,2 delims==" %%i IN (temp.txt) do set rsrq=%%j 

 findstr "3GPP.SINR" status.txt > temp.txt
 for /F "tokens=1,2 delims==" %%i IN (temp.txt) do set sinr=%%j 

 echo %ADATE% %ATIME% %rssi% %rsrp% %rsrq% %sinr% >> report.txt

 sleep 2 

 goto begin
 