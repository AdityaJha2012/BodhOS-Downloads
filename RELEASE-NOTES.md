# Bodh OS Preview 0.36

Two new Linux images with the latest Bodh desktop tools:

- **PC amd64** for evaluation in a new PC virtual machine.
- **Experimental Intel MacBookPro15,2 amd64** for the 2018 Intel MacBook Pro profile. This is not macOS, not an Apple silicon image and not a claim of full Mac hardware support.

## Download and start

Download both matching `.iso.part01` and `.iso.part02` files for your chosen image, plus **BodhOS-0.3.0-preview.36-Guides.zip**. You only need one image. Extract the guide ZIP beside the parts and open **START-HERE.html**.

On Windows, open **Join PC ISO.cmd** or **Join Mac ISO.cmd**. The helper checks each part, assembles the ISO and checks its complete SHA256. It does not format disks, install an OS or change PowerShell settings. macOS and Linux joining commands are in the guide. Keep different releases and profiles in separate folders.

Use a new disposable VM first. Installed accounts retain projects. Live sessions and the separate Classroom account are temporary. Installation asks you to choose your own account and password. No test access is included.

## Included

- Native Quick Help with ten searchable offline guides.
- Native Study Tools with focus and break timers, pause, resume, reset and a logout checklist.
- Student Files with eight templates, safe new project folders, verified assignment copies, receipts and backup reminders.
- Assistant local coding guidance and optional administrator configured school AI conversation. Student opt in is required. No AI model or server is bundled.
- Terminal only Nmap, Lynis, TShark, tcpdump, dig and OpenSSL, with a synthetic sample. No Kali repository or automatic scanner is added.
- Existing Debian 13 and XFCE desktop, coding tools, education apps, school setup, persistent student accounts, temporary Classroom sessions, backups, Rescue and protected updates.
- Standard and Reduced appearance modes. Glass remains removed.

## Verified on these exact images

- All 216 Linux source tests and 208 packaged source checks pass.
- Both runtime audits and internal media checksum manifests pass.
- PC BIOS, PC UEFI and Mac UEFI live tests pass, including 29 packaged Quick Help and Study Tools checks and 33 desktop checks per configuration.
- All three fresh installation suites pass four installed boots. Checks cover retained projects, HTTPS, accounts, enforced quotas, verified backups, Assistant opening and running Python in Thonny, JavaScript in Geany, Classroom logout cleanup, Rescue GRUB repair and snapshot rollback keeping projects.
- Student Files and Assistant pass ten additional packaged GUI checks per image. Assistant conversation uses a local fake HTTP server, not a real AI model.
- Download parts reassemble to the exact local ISOs. All six uploaded GitHub asset SHA256 digests and byte lengths match the verified local files.

[Read the test record and screenshots](https://github.com/AdityaJha2012/BodhOS-Downloads/tree/v0.3.0-preview.36/validation).

## Limits

This is a development preview. Physical Macs and PCs, real drivers, WiFi, microphones, printers and a school pilot remain unverified. No fresh performance measurements were taken for this version. Preview 0.35 results are historical. Separate Administrator and Classroom edition candidates remain earlier images.

The Mac image retains T2 kernel `6.18.58-1-t2-trixie` and a stock Debian fallback. Its community kernel packages are pinned and require reviewed updates. WiFi and Bluetooth need owner supplied model specific firmware. The stock installer may need external input devices. Read the included Mac hardware notes before trying physical hardware. Mac dual boot and recovery have not been validated. Apple silicon and Raspberry Pi are outside this release.

## Full ISO SHA256

PC: `89af8be90566a6d33b9b6c6bf56f3586b9e2a33049190d3c4c0cd4c1999c7b4c`

MacBookPro15,2: `e3133f35f6016d412484a4df931816fb30b8f51cf8e4ef6a8e9da93e96dcde4e`

These are the exact verified Preview 0.36 ISO bytes. Only the download guide links were updated for this public download repository. The release tag here identifies the download documentation, not an operating system source tree. The development repository remains private. Runtime source commit recorded inside both images: `8667af4a72e7b7005c9903a2c231d0d410fb503b`.
