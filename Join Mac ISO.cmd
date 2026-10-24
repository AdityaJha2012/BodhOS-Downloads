@echo off
setlocal DisableDelayedExpansion
pushd "%~dp0" || exit /b 1
echo Checking the Bodh OS download. This can take several minutes.
if exist "BodhOS-MacBookPro15-2-0.3.0-preview.39-experimental-amd64.iso" (
  for %%F in ("BodhOS-MacBookPro15-2-0.3.0-preview.39-experimental-amd64.iso") do if %%~zF EQU 0 goto preserve_empty
  goto existing
)
:join_start
if exist "BodhOS-MacBookPro15-2-0.3.0-preview.39-experimental-amd64.iso.partial" goto partial
if not exist "BodhOS-MacBookPro15-2-0.3.0-preview.39-experimental-amd64.iso.part01" goto missing
certutil -hashfile "BodhOS-MacBookPro15-2-0.3.0-preview.39-experimental-amd64.iso.part01" SHA256 | findstr /i /x /c:"4d9f3a82a682ef04ab14cc8824419cc339dc42cf3f044fa083d2fb64d379bb35" >nul
if errorlevel 1 goto badhash
if not exist "BodhOS-MacBookPro15-2-0.3.0-preview.39-experimental-amd64.iso.part02" goto missing
certutil -hashfile "BodhOS-MacBookPro15-2-0.3.0-preview.39-experimental-amd64.iso.part02" SHA256 | findstr /i /x /c:"44c2499dc429897bd597c833af94bc03899bf9feecdc15c1dc64c78ae81e8f98" >nul
if errorlevel 1 goto badhash
copy /b "BodhOS-MacBookPro15-2-0.3.0-preview.39-experimental-amd64.iso.part01"+"BodhOS-MacBookPro15-2-0.3.0-preview.39-experimental-amd64.iso.part02" "BodhOS-MacBookPro15-2-0.3.0-preview.39-experimental-amd64.iso.partial" >nul
if errorlevel 1 goto failed
certutil -hashfile "BodhOS-MacBookPro15-2-0.3.0-preview.39-experimental-amd64.iso.partial" SHA256 | findstr /i /x /c:"86bbad29a03d0676d7b40469785ab599d5794b44981df45f9ee391710b7d0236" >nul
if errorlevel 1 goto badhash
ren "BodhOS-MacBookPro15-2-0.3.0-preview.39-experimental-amd64.iso.partial" "BodhOS-MacBookPro15-2-0.3.0-preview.39-experimental-amd64.iso"
if errorlevel 1 goto failed
goto success
:existing
certutil -hashfile "BodhOS-MacBookPro15-2-0.3.0-preview.39-experimental-amd64.iso" SHA256 | findstr /i /x /c:"86bbad29a03d0676d7b40469785ab599d5794b44981df45f9ee391710b7d0236" >nul
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
echo Verified ISO ready: %CD%\BodhOS-MacBookPro15-2-0.3.0-preview.39-experimental-amd64.iso
if not defined BODH_JOIN_NO_PAUSE explorer.exe /select,"%CD%\BodhOS-MacBookPro15-2-0.3.0-preview.39-experimental-amd64.iso"
popd
if not defined BODH_JOIN_NO_PAUSE pause
exit /b 0

:preserve_empty
set "BODH_EMPTY_BACKUP=BodhOS-MacBookPro15-2-0.3.0-preview.39-experimental-amd64.iso.empty-preserved-%RANDOM%.txt"
if exist "%BODH_EMPTY_BACKUP%" goto preserve_empty
ren "BodhOS-MacBookPro15-2-0.3.0-preview.39-experimental-amd64.iso" "%BODH_EMPTY_BACKUP%"
if errorlevel 1 goto failed
echo Preserved the earlier empty file as "%BODH_EMPTY_BACKUP%".
goto join_start
