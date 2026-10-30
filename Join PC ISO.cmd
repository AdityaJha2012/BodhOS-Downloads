@echo off
setlocal DisableDelayedExpansion
pushd "%~dp0" || exit /b 1
echo Checking the Bodh OS download. This can take several minutes.
if exist "BodhOS-PC-0.3.1-amd64.iso" (
  for %%F in ("BodhOS-PC-0.3.1-amd64.iso") do if %%~zF EQU 0 goto preserve_empty
  goto existing
)
:join_start
if exist "BodhOS-PC-0.3.1-amd64.iso.partial" goto partial
if not exist "BodhOS-PC-0.3.1-amd64.iso.part01" goto missing
certutil -hashfile "BodhOS-PC-0.3.1-amd64.iso.part01" SHA256 | findstr /i /x /c:"0e13df177836bdb3c220e19f4691be58990a7ba3af84d5f0308bedd667d1c9c8" >nul
if errorlevel 1 goto badhash
if not exist "BodhOS-PC-0.3.1-amd64.iso.part02" goto missing
certutil -hashfile "BodhOS-PC-0.3.1-amd64.iso.part02" SHA256 | findstr /i /x /c:"a2c73ae62da777a92bbe949c83848d999ab95caa9cf42c2e4ec71bb4554cd386" >nul
if errorlevel 1 goto badhash
copy /b "BodhOS-PC-0.3.1-amd64.iso.part01"+"BodhOS-PC-0.3.1-amd64.iso.part02" "BodhOS-PC-0.3.1-amd64.iso.partial" >nul
if errorlevel 1 goto failed
certutil -hashfile "BodhOS-PC-0.3.1-amd64.iso.partial" SHA256 | findstr /i /x /c:"5bb7ec9b1b61e80149885f4e40689abd8255fc048514a1f5cd02a72a7c0da62e" >nul
if errorlevel 1 goto badhash
ren "BodhOS-PC-0.3.1-amd64.iso.partial" "BodhOS-PC-0.3.1-amd64.iso"
if errorlevel 1 goto failed
goto success
:existing
certutil -hashfile "BodhOS-PC-0.3.1-amd64.iso" SHA256 | findstr /i /x /c:"5bb7ec9b1b61e80149885f4e40689abd8255fc048514a1f5cd02a72a7c0da62e" >nul
if errorlevel 1 goto existingbad
goto success
:missing
echo Missing a download part. Keep both parts beside this helper.
goto failed
:partial
echo A partial output already exists. Use a new folder or review it first.
goto failed
:existingbad
echo NOT READY: an existing ISO has the wrong checksum. It was kept. Use a new empty folder.
goto failed
:badhash
echo Verification failed. Do not use the output. Download matching parts again.
:failed
echo NOT READY: ISO assembly did not complete. Do not select an empty or partial file in VirtualBox.
popd
if not defined BODH_JOIN_NO_PAUSE pause
exit /b 1
:success
echo SUCCESS - VERIFIED ISO READY
echo Verified ISO ready: %CD%\BodhOS-PC-0.3.1-amd64.iso
if not defined BODH_JOIN_NO_PAUSE explorer.exe /select,"%CD%\BodhOS-PC-0.3.1-amd64.iso"
popd
if not defined BODH_JOIN_NO_PAUSE pause
exit /b 0

:preserve_empty
set "BODH_EMPTY_BACKUP=BodhOS-PC-0.3.1-amd64.iso.empty-preserved-%RANDOM%.txt"
if exist "%BODH_EMPTY_BACKUP%" goto preserve_empty
ren "BodhOS-PC-0.3.1-amd64.iso" "%BODH_EMPTY_BACKUP%"
if errorlevel 1 goto failed
echo Preserved the earlier empty file as "%BODH_EMPTY_BACKUP%".
goto join_start
