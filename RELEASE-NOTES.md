# Bodh OS Preview 0.39

## Download

[Start here](https://adityajha2012.github.io/BodhOS-Downloads/). On Windows, download **Download-BodhOS-PC.cmd**, open it in a new empty folder and wait for **SUCCESS - VERIFIED ISO READY**. It creates one verified ISO automatically. Allow 7 GB free.

## Install

Choose **Install Bodh OS (simple setup)**. Select language, region, keyboard, your account and the destination. Network, domain, mirror, extra software and separate root password questions are skipped. Disk writes still require confirmation. Connect from the installed desktop.

For VirtualBox evaluation use a new Debian 64 bit VM, skip unattended installation, 4 GB RAM, **1 CPU**, a new empty 32 GB disk, VMSVGA with 3D off, USB Tablet and NAT. Keep I/O APIC enabled. Two virtual CPUs froze at partitioning on the available Windows VirtualBox host. The scoped kernel compatibility settings alone did not resolve that configuration.

## Changes

- Simpler offline installation with explicit account and disk choices.
- Unique default hostnames, using Debian Installer's question registration API.
- VirtualBox detection and scoped interrupt and RCU compatibility arguments.
- Correct console version banners and safer factory mount cleanup.
- Simpler download page and updated verified download helpers.
- Fix Windows line endings in packaged firewall defaults and rules. Verify the actual firewall service and incoming deny policy on the rebuilt images.

The signed package refresh found no additional upgrades. Preview 0.38 security fixes are retained. There are no preset administrator test credentials in the release.

Both matching parts are needed for manual download because GitHub limits asset size. Use the included join helper. GitHub's Source code ZIP is not the OS image.

The MacBookPro15,2 image remains experimental. Physical hardware, dual boot and school deployment are unverified. Mac DMG helpers are unsigned and have not been launched on a physical Mac. Apple silicon offers x86_64 emulation only. No native ARM release is included.

## Verification

233 source tests and 217 packaged file checks passed. Both final image audits and PC BIOS, PC UEFI and Mac UEFI live boots passed, including the active firewall and incoming deny policy. The final PC UEFI suite passed saved projects across reboot, networking, coding tools, Assistant, Classroom logout cleanup, project backups and storage quotas, Rescue diagnostics and boot repair, and real snapshot restoration across reboot.

The final PC image reached its live desktop in a fresh Windows VirtualBox VM and passed actual firewall checks. The simple interactive installer completed on the preceding candidate, which reached the installed desktop with its ISO ejected. That candidate exposed the firewall line ending bug and was withheld. Both final images were rebuilt after the correction. The full final installed suite ran in QEMU UEFI. Two CPUs with x2APIC remained problematic on this Windows host. Follow the installation guide for the tested one CPU, xAPIC and I/O APIC configuration.

Earlier test failures and unverified areas are recorded in [the test results](https://github.com/AdityaJha2012/BodhOS-Downloads/tree/main/validation/preview39). Final complete BIOS and Mac installation suites were not rerun on this media. Physical hardware support is not established by these VM checks.

## School audit, 26 October 2026

The verified Preview 0.39 ISO bytes and checksums are unchanged. Both package sets have no additional Debian upgrades available at the recorded signed repository check. The separate pinned T2 metadata also matches its authenticated repository. This is not a claim that every vulnerability is fixed.

Fresh PC BIOS and UEFI live boots passed. The final PC BIOS four boot installation suite passed student persistence, networking, coding, Classroom cleanup, quotas, backups, Rescue GRUB repair and real snapshot restore retaining projects. A fresh UEFI live check confirmed active incoming deny firewall rules and the read only hardware helper running as the student. These are VM results, not physical driver certification.

The current kernel, Mesa and firmware match configured Debian candidates. Proprietary NVIDIA remains optional. Universal support for twenty year old or newly released hardware is not claimed. See [the driver guide](https://adityajha2012.github.io/BodhOS-Downloads/hardware-support.html).

The updated [presentation and school test pack](https://adityajha2012.github.io/BodhOS-Downloads/school-security.html) include the full study guide. [Fresh evidence](https://github.com/AdityaJha2012/BodhOS-Downloads/tree/main/validation/school-2026-10-26) records the scope. Mac full installs, physical GPUs, school peripherals, Secure Boot and school deployment remain unverified.
