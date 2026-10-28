@echo off
setlocal DisableDelayedExpansion
pushd "%~dp0" || exit /b 1
echo Checking the Bodh OS download. This can take several minutes.
if exist "BodhOS-PC-0.3.0-desktop3-amd64.iso" (
  for %%F in ("BodhOS-PC-0.3.0-desktop3-amd64.iso") do if %%~zF EQU 0 goto preserve_empty
  goto existing
)
:join_start
if exist "BodhOS-PC-0.3.0-desktop3-amd64.iso.partial" goto partial
if not exist "BodhOS-PC-0.3.0-desktop3-amd64.iso.part01" goto missing
certutil -hashfile "BodhOS-PC-0.3.0-desktop3-amd64.iso.part01" SHA256 | findstr /i /x /c:"1d95a7ab79868534035c36b2b3d7895cb31dd39053f3f40164d705b62436f10b" >nul
if errorlevel 1 goto badhash
if not exist "BodhOS-PC-0.3.0-desktop3-amd64.iso.part02" goto missing
certutil -hashfile "BodhOS-PC-0.3.0-desktop3-amd64.iso.part02" SHA256 | findstr /i /x /c:"2e3c3a8aac6bce5538ed44956934380e43be606518c34f3d29dddb83a208c699" >nul
if errorlevel 1 goto badhash
copy /b "BodhOS-PC-0.3.0-desktop3-amd64.iso.part01"+"BodhOS-PC-0.3.0-desktop3-amd64.iso.part02" "BodhOS-PC-0.3.0-desktop3-amd64.iso.partial" >nul
if errorlevel 1 goto failed
certutil -hashfile "BodhOS-PC-0.3.0-desktop3-amd64.iso.partial" SHA256 | findstr /i /x /c:"2cb9c8d99a926ed0848f02a00677a9a94f738e01c0c2e6ce334a62b5a335c57a" >nul
if errorlevel 1 goto badhash
ren "BodhOS-PC-0.3.0-desktop3-amd64.iso.partial" "BodhOS-PC-0.3.0-desktop3-amd64.iso"
if errorlevel 1 goto failed
goto success
:existing
certutil -hashfile "BodhOS-PC-0.3.0-desktop3-amd64.iso" SHA256 | findstr /i /x /c:"2cb9c8d99a926ed0848f02a00677a9a94f738e01c0c2e6ce334a62b5a335c57a" >nul
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
echo Verified ISO ready: %CD%\BodhOS-PC-0.3.0-desktop3-amd64.iso
if not defined BODH_JOIN_NO_PAUSE explorer.exe /select,"%CD%\BodhOS-PC-0.3.0-desktop3-amd64.iso"
popd
if not defined BODH_JOIN_NO_PAUSE pause
exit /b 0

:preserve_empty
set "BODH_EMPTY_BACKUP=BodhOS-PC-0.3.0-desktop3-amd64.iso.empty-preserved-%RANDOM%.txt"
if exist "%BODH_EMPTY_BACKUP%" goto preserve_empty
ren "BodhOS-PC-0.3.0-desktop3-amd64.iso" "%BODH_EMPTY_BACKUP%"
if errorlevel 1 goto failed
echo Preserved the earlier empty file as "%BODH_EMPTY_BACKUP%".
goto join_start
