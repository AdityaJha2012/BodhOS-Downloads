# Bodh OS downloads

Official ISO downloads, checksums, installation guides and VM test results.

## Get Preview 0.36

[Open the download page](https://github.com/AdityaJha2012/BodhOS-Downloads/releases/tag/v0.3.0-preview.36).

1. Choose **PC** or **experimental Intel MacBookPro15,2**.
2. Download both matching **.iso.part01** and **.iso.part02** files and **BodhOS-0.3.0-preview.36-Guides.zip**.
3. Extract the ZIP beside the two parts. Open **START-HERE.html**.
4. On Windows, open **Join PC ISO.cmd** or **Join Mac ISO.cmd**. It verifies each part and the assembled image. macOS and Linux commands are in the guide.
5. Try the verified ISO in a fresh virtual machine first.

No GitHub account or access to the development repository is required.

## What is included

Debian 13, XFCE, native Bodh desktop tools, coding apps, persistent student accounts, temporary Classroom sessions, backups, Rescue, offline Quick Help and Study Tools. Assistant has local guidance and an optional school AI connection. No AI model or server is bundled. Standard and Reduced effects remain. Glass is removed.

## What was tested

216 source tests and 208 packaged source checks pass. Both ISO audits and media checksum manifests pass. PC BIOS, PC UEFI and Mac UEFI pass live and fresh installation suites through four installed boots, including saved projects, networking, Classroom cleanup, Rescue repair and snapshot rollback. New apps pass actual packaged GUI checks. See [test results](validation/README.md).

This is a development preview. Physical hardware and school deployment remain unverified. The Mac image is experimental Linux for **MacBookPro15,2**, not macOS and not Apple silicon. Read the included hardware notes before physical testing. There are no new Preview 0.36 performance measurements.

This repository contains downloads, guides and reviewed test results. It does not contain the private development repository or its history.
