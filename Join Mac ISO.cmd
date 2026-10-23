@echo off
setlocal
pushd "%~dp0" || exit /b 1
echo Checking the Bodh OS download. This can take several minutes.
if exist "BodhOS-MacBookPro15-2-0.3.0-preview.36-experimental-amd64.iso" goto existing
if exist "BodhOS-MacBookPro15-2-0.3.0-preview.36-experimental-amd64.iso.partial" goto partial
if not exist "BodhOS-MacBookPro15-2-0.3.0-preview.36-experimental-amd64.iso.part01" goto missing
certutil -hashfile "BodhOS-MacBookPro15-2-0.3.0-preview.36-experimental-amd64.iso.part01" SHA256 | findstr /i /x /c:"0ba3120dc0039db0db897f2a044d2a6c2c01041fe02a9c49894f5c186854f8a1" >nul
if errorlevel 1 goto badhash
if not exist "BodhOS-MacBookPro15-2-0.3.0-preview.36-experimental-amd64.iso.part02" goto missing
certutil -hashfile "BodhOS-MacBookPro15-2-0.3.0-preview.36-experimental-amd64.iso.part02" SHA256 | findstr /i /x /c:"a39fe42fbb735f2ba47e5ba8db71a17501a1e91f0c074b31b2bb733a57c1a316" >nul
if errorlevel 1 goto badhash
copy /b "BodhOS-MacBookPro15-2-0.3.0-preview.36-experimental-amd64.iso.part01"+"BodhOS-MacBookPro15-2-0.3.0-preview.36-experimental-amd64.iso.part02" "BodhOS-MacBookPro15-2-0.3.0-preview.36-experimental-amd64.iso.partial" >nul
if errorlevel 1 goto failed
certutil -hashfile "BodhOS-MacBookPro15-2-0.3.0-preview.36-experimental-amd64.iso.partial" SHA256 | findstr /i /x /c:"e3133f35f6016d412484a4df931816fb30b8f51cf8e4ef6a8e9da93e96dcde4e" >nul
if errorlevel 1 goto badhash
ren "BodhOS-MacBookPro15-2-0.3.0-preview.36-experimental-amd64.iso.partial" "BodhOS-MacBookPro15-2-0.3.0-preview.36-experimental-amd64.iso"
if errorlevel 1 goto failed
goto success
:existing
certutil -hashfile "BodhOS-MacBookPro15-2-0.3.0-preview.36-experimental-amd64.iso" SHA256 | findstr /i /x /c:"e3133f35f6016d412484a4df931816fb30b8f51cf8e4ef6a8e9da93e96dcde4e" >nul
if errorlevel 1 goto existingbad
goto success
:missing
echo Missing a download part. Keep both parts beside this helper.
goto failed
:partial
echo A partial output already exists. Use a new folder or review it first.
goto failed
:existingbad
echo An ISO with a different checksum exists. Use a new folder.
goto failed
:badhash
echo Verification failed. Do not use the output. Download matching parts again.
:failed
echo ISO assembly did not complete. No disk was formatted.
popd
if not defined BODH_JOIN_NO_PAUSE pause
exit /b 1
:success
echo Verified ISO ready: BodhOS-MacBookPro15-2-0.3.0-preview.36-experimental-amd64.iso
popd
if not defined BODH_JOIN_NO_PAUSE pause
exit /b 0
