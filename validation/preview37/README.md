# Preview 0.37 validation

24 October 2026. School desktop development preview.

## Images and provenance

Both the PC and experimental Intel MacBookPro15,2 images include the same offline feature list and direct PC installation guide. Each guide matches its ISO root, installed system, personal user template and Classroom template copy.

Runtime source commit: `9f11cd20806bb6bc4ca60e010db7af5f39f9fded`. The guide window test was corrected in `ea8f60f` to use packaged Wnck. This changed the private test CD, not the release runtime. See [build provenance](build-provenance.json), [image checks](image-results.json) and [full image and part hashes](release-files.json).

The first assembly attempt was rejected because native source tests had generated Python bytecode. The build now validates source before copying it. The replacement clean export disables bytecode generation. A first live test script used absent wmctrl. It was corrected to use the existing Wnck library. UEFI installation test attempts exposed a redundant test CD remount after recovery and early typing before the terminal prompt. Commits `56a4a7c` and `a0fea8c` correct those test steps while retaining the repair flag and reboot checks. Failed candidates and raw logs were kept privately and were never published.

## Passed checks

* 221 native source tests with no skips and 215 packaged source checks.
* Both exact packaged runtime audits, including the guide text copies and absence of factory test access.
* Internal MD5 and SHA256 manifests, 930 entries each on PC and 933 each on Mac.
* PC BIOS, PC UEFI and experimental Mac UEFI live boot.
* Ten guide checks per live configuration, including the actual Welcome buttons opening both files in the desktop editor.
* 29 Quick Help and Study Tools checks and 33 desktop checks per live configuration.
* The live guest runs 221 source tests with seven xorriso dependent fixtures skipped. 214 execute. All seven also run in the native suite.
* Three fresh installed suites with four boots each, edited Python persistence, network HTTPS, private school accounts, enforced quotas, verified project backup and restore, Coding Apps, Assistant to Thonny F5, JavaScript, Classroom logout cleanup, Rescue GRUB repair and Timeshift restore preserving projects.
* External full ISO copies and reassembled part streams match SHA256.
* Six real Windows cmd, curl and certutil fixture cases cover download, resume, join, empty output recovery and refusal to replace bad existing files. Both current real full images are accepted by the Windows helpers and recognized by VirtualBox as RAW optical media.
* Updated 20 slide presentation passed package, geometry, font and first party import checks. All slides were rendered and reviewed. Native PowerPoint execution was not tested.
* 21 local HTML links pass. Download, features and installation pages fit a 390 pixel browser viewport without horizontal overflow. Public network checks are recorded after publication.

See [live results](live-results.json), [installed results](installed-results.json), [source suite](source-tests.txt), [Windows fixtures](windows-download-fixtures.json), [full image checks](windows-full-image-checks.json) and [presentation checks](presentation.json).

## Test environment and limits

QEMU with KVM, 4096 MiB guest RAM, two virtual CPUs, standard virtual VGA, OpenGL disabled, virtual Ethernet and NAT. BIOS and OVMF UEFI are separate test configurations. The Mac live kernel is the pinned T2 kernel. Its installer still uses the stock Debian kernel and may require external input on physical T2 hardware.

No physical host disk was installed, formatted or repaired. Test accounts and access were confined to disposable private guest disks or a separate QA CD. No test credentials were included in either release image. Raw installer terminal screenshots are not public because they contain disposable credentials.

Physical PCs and Mac devices, Secure Boot, same drive dual boot, real WiFi, microphones, printers, USB peripherals and school deployment remain unverified. There is no fresh 0.37 performance measurement. Earlier 0.35 numbers remain historical. Separate Administrator and Classroom edition images are older candidates and were not rebuilt for this documentation release.

## Screenshots

[Current PC desktop](pc-bios-live/desktop.png) · [Welcome](pc-bios-live/welcome-guides.png) · [Quick Help](pc-bios-live/quick-help.png) · [Study Tools](pc-bios-live/study-tools.png)

The guides also remain accessible through the Start entry and `/usr/share/bodhos`, including for existing accounts whose desktop preferences are preserved.
