# School security and hardware check, 26 October 2026

The current verified release remains **0.3.0-preview.39**. No image was relabeled or replaced for this audit.

## Security result

The PC ISO was verified by SHA256, extracted into a fresh disposable Linux factory root and checked against its signed Debian repositories. Full upgrade with package removals prohibited applied **zero** updates. No upgrades remained and `dpkg --audit` was clean.

The experimental Intel Mac ISO was checked using its exact dpkg status, fresh signed Debian indexes and isolated APT state. The read only full upgrade simulation proposed **zero** changes. This was an index and solver check, not a second full root upgrade. The separate community T2 repository signature and all five pinned package records match the authenticated index. A matching signed index does not establish absence of vulnerabilities in that kernel.

Available repository updates are not a guarantee that every known vulnerability has a fix. Existing installations still need their own update check and firewall check. A refreshed download page does not remotely update installed computers. The existing Preview 0.39 firewall correction remains important for older installations.

## Exact images

| Image | SHA256 |
| --- | --- |
| PC | `c8d1fb4e734c48a1f882985baba2910d359e9add6315df23a8969234653e80a5` |
| Experimental MacBookPro15,2 | `86bbad29a03d0676d7b40469785ab599d5794b44981df45f9ee391710b7d0236` |

The PC inventory and Mac candidate policy are included. Both ISO content checks passed against source based on `0066943`. The test run ran 233 unit tests, with 232 passing and one skipped and validated 217 packaged files. Fresh BIOS and UEFI PC live boots passed. The fresh PC BIOS installed suite passed four boots, saved projects, networking, coding apps, Classroom cleanup, quotas, project backup, Rescue diagnostics and GRUB repair, and real Timeshift restore preserving student work. See `results.json` and `pc-bios-installed-checks.txt`. Earlier full validation is retained under Preview 0.39.

## Drivers

The checked Debian candidates match the installed PC kernel, Mesa, firmware and NVIDIA detection package. This means current in the configured Debian stable/security repositories, not the newest version released by every vendor. No experimental driver repository, unsupported legacy binary, or vendor `.run` installer was added.

The image includes Intel graphics support, AMD amdgpu/radeon support, Nouveau, Mesa and firmware packages. Proprietary NVIDIA is optional and is not installed by default. It must match the exact card and may need module signing under Secure Boot. Do not install it across a whole mixed lab without testing.

There is no single driver set that supports every old and new device. Some PCs more than twenty years old cannot run this x86_64 image. A 32 bit Windows installation can still be running on a 64 bit CPU. Check the processor instead of assuming its architecture from Windows.

## School test

Use the PC image and start in live mode. Obtain permission before changing a school disk. Check each machine's model, PCI device IDs, screen, keyboard, mouse, sound, wired network and any required WiFi, printer or removable device. Run a coding starter and save sample work. Installation and reboot persistence require an approved disposable backed up target.

`Bodh-Hardware-Check.sh` prints local read only observations. Run it from a local desktop terminal with `bash Bodh-Hardware-Check.sh`. It does not install drivers or certify compatibility. Keep reports private because device details can identify the environment.

The existing Windows VirtualBox workaround remains one CPU, xAPIC, x2APIC off, I/O APIC enabled, VMSVGA and 3D disabled. VM results do not prove school hardware, physical graphics, Secure Boot or Mac support.

References: [Debian security](https://www.debian.org/security/), [Debian graphics guidance](https://wiki.debian.org/GraphicsCard), [NVIDIA guidance](https://wiki.debian.org/NvidiaGraphicsDrivers), [Debian 13 release issues](https://www.debian.org/releases/trixie/release-notes/issues.en.html).

## Issues found in the preparation tools

The new standalone hardware helper initially treated `lsusb` returning no devices as a failure. This can be normal in a VM with no USB controller. The helper now distinguishes an empty device list from a real command error. A fresh VM retest passed as the unprivileged live student, including PCI drivers, graphics renderer, screen and network observations. An independent administrator check confirmed the real firewall was active and denied incoming connections. No shipped OS executable changed for this helper correction.

The manual installation workflow contained duplicate checkout `with` keys. They were merged so the selected ref and disabled credential persistence both apply. The default source ref is now main. All four workflows parse with duplicate key rejection, remain manual only and keep checkout credentials disabled.

The first local boot harness attempt used an unavailable WSL drive mount. That environment failure was discarded. Fresh isolated BIOS and UEFI runs with the drive mounted succeeded. It did not indicate an ISO boot defect.

The final installed test used 4 GiB RAM, two virtual CPUs, standard emulated VGA with GL disabled, QEMU KVM and user NAT. Disposable disks and credentials were created only for this test. No test access was added to a release image. Existing UEFI installation evidence remains in the 24 October Preview 0.39 record.
