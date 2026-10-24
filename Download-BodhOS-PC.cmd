@echo off
setlocal DisableDelayedExpansion
pushd "%~dp0" || exit /b 1
echo Bodh OS PC - automatic download and ISO preparation
echo Save this file in an empty folder. Keep this window open until SUCCESS.
if exist "BodhOS-PC-0.3.0-preview.38-amd64.iso" (
  certutil -hashfile "BodhOS-PC-0.3.0-preview.38-amd64.iso" SHA256 | findstr /i /x /c:"43ab0eb7326c9833aa0ec5e5ec595dfef63340ded1b59af33cf30e2bb148f5b7" >nul
  if not errorlevel 1 goto BODH_ASSEMBLE
)
call :BODH_FETCH "BodhOS-PC-0.3.0-preview.38-amd64.iso.part01" "c890722c37f2257a3ba71669db51f852b077a733e58c71df4631f2163e59be83"
if errorlevel 1 goto failed
call :BODH_FETCH "BodhOS-PC-0.3.0-preview.38-amd64.iso.part02" "e5a4d7c239e29f474015d0726e0649203cdf7ebf6b5d4a651bc8f3e97e59245c"
if errorlevel 1 goto failed
:BODH_ASSEMBLE
echo Checking the Bodh OS download. This can take several minutes.
if exist "BodhOS-PC-0.3.0-preview.38-amd64.iso" (
  for %%F in ("BodhOS-PC-0.3.0-preview.38-amd64.iso") do if %%~zF EQU 0 goto preserve_empty
  goto existing
)
:join_start
if exist "BodhOS-PC-0.3.0-preview.38-amd64.iso.partial" goto partial
if not exist "BodhOS-PC-0.3.0-preview.38-amd64.iso.part01" goto missing
certutil -hashfile "BodhOS-PC-0.3.0-preview.38-amd64.iso.part01" SHA256 | findstr /i /x /c:"c890722c37f2257a3ba71669db51f852b077a733e58c71df4631f2163e59be83" >nul
if errorlevel 1 goto badhash
if not exist "BodhOS-PC-0.3.0-preview.38-amd64.iso.part02" goto missing
certutil -hashfile "BodhOS-PC-0.3.0-preview.38-amd64.iso.part02" SHA256 | findstr /i /x /c:"e5a4d7c239e29f474015d0726e0649203cdf7ebf6b5d4a651bc8f3e97e59245c" >nul
if errorlevel 1 goto badhash
copy /b "BodhOS-PC-0.3.0-preview.38-amd64.iso.part01"+"BodhOS-PC-0.3.0-preview.38-amd64.iso.part02" "BodhOS-PC-0.3.0-preview.38-amd64.iso.partial" >nul
if errorlevel 1 goto failed
certutil -hashfile "BodhOS-PC-0.3.0-preview.38-amd64.iso.partial" SHA256 | findstr /i /x /c:"43ab0eb7326c9833aa0ec5e5ec595dfef63340ded1b59af33cf30e2bb148f5b7" >nul
if errorlevel 1 goto badhash
ren "BodhOS-PC-0.3.0-preview.38-amd64.iso.partial" "BodhOS-PC-0.3.0-preview.38-amd64.iso"
if errorlevel 1 goto failed
goto success
:existing
certutil -hashfile "BodhOS-PC-0.3.0-preview.38-amd64.iso" SHA256 | findstr /i /x /c:"43ab0eb7326c9833aa0ec5e5ec595dfef63340ded1b59af33cf30e2bb148f5b7" >nul
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
echo Verified ISO ready: %CD%\BodhOS-PC-0.3.0-preview.38-amd64.iso
if not defined BODH_JOIN_NO_PAUSE explorer.exe /select,"%CD%\BodhOS-PC-0.3.0-preview.38-amd64.iso"
popd
if not defined BODH_JOIN_NO_PAUSE pause
exit /b 0

:preserve_empty
set "BODH_EMPTY_BACKUP=BodhOS-PC-0.3.0-preview.38-amd64.iso.empty-preserved-%RANDOM%.txt"
if exist "%BODH_EMPTY_BACKUP%" goto preserve_empty
ren "BodhOS-PC-0.3.0-preview.38-amd64.iso" "%BODH_EMPTY_BACKUP%"
if errorlevel 1 goto failed
echo Preserved the earlier empty file as "%BODH_EMPTY_BACKUP%".
goto join_start

:BODH_FETCH
if exist "%~1" (
  certutil -hashfile "%~1" SHA256 | findstr /i /x /c:"%~2" >nul
  if not errorlevel 1 exit /b 0
  echo Existing download "%~1" failed verification. It was kept. Use a new empty folder.
  exit /b 1
)
if exist "%~1.downloading" (
  certutil -hashfile "%~1.downloading" SHA256 | findstr /i /x /c:"%~2" >nul
  if not errorlevel 1 goto BODH_PART_READY
)
where curl.exe >nul 2>&1
if errorlevel 1 (
  echo Windows curl is unavailable. Use the manual download links on the download page.
  exit /b 1
)
echo Downloading "%~1". An interrupted download can be resumed by opening this helper again.
curl.exe --fail --location --retry 3 --connect-timeout 30 --continue-at - --output "%~1.downloading" "https://github.com/AdityaJha2012/BodhOS-Downloads/releases/download/v0.3.0-preview.38/%~1"
if errorlevel 1 exit /b 1
certutil -hashfile "%~1.downloading" SHA256 | findstr /i /x /c:"%~2" >nul
if errorlevel 1 (
  echo Download verification failed. No ISO is ready. Keep the files and use a fresh folder to retry.
  exit /b 1
)
:BODH_PART_READY
ren "%~1.downloading" "%~1"
if errorlevel 1 exit /b 1
exit /b 0
