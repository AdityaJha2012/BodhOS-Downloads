# Download Bodh OS

[Open the download page and readable guides](https://adityajha2012.github.io/BodhOS-Downloads/)

A school desktop for learning and coding. Preview 0.37.

## Windows PC or VirtualBox

### [Download Bodh OS for Windows](https://github.com/AdityaJha2012/BodhOS-Downloads/releases/download/v0.3.0-preview.37/Download-BodhOS-PC.cmd)

1. Save **Download-BodhOS-PC.cmd** in a new folder, such as Downloads → Bodh OS.
2. Double click it. It downloads the required files, joins them and verifies the finished ISO. No administrator access or extra installer is needed. Allow about 6 GB of free space.
3. Wait for **SUCCESS - VERIFIED ISO READY**. The folder opens with your ISO selected.

Your finished file is **BodhOS-PC-0.3.0-preview.37-amd64.iso**. Select this file in VirtualBox. Do not select a `.part01`, `.part02` or `.downloading` file.

If the connection drops, open the helper again to resume. An earlier empty ISO is preserved and repaired. A nonempty file with the wrong checksum is kept and reported, not overwritten.

## Use it on a real PC

Read the **[USB and real PC installation guide](https://adityajha2012.github.io/BodhOS-Downloads/install-on-pc.html)** or [plain text guide](BodhOS-Install-on-PC.txt). Write the complete verified PC ISO to an empty USB with Rufus. Try the live desktop first. Back up and identify the target drive before installation. USB writing and installation can erase the selected device.

The PC guide covers Intel or AMD x86_64 machines. Physical hardware, Secure Boot and same drive dual boot remain unverified. Intel T2 Macs need the separate Mac notes.

## What is included?

Read the **[full feature and software list](https://adityajha2012.github.io/BodhOS-Downloads/features.html)** or [TXT version](BodhOS-Features.txt). The two TXT guides are built into the ISO and installed system. Open Welcome or search Start for Bodh OS Features and Guides.

[Updated presentation](https://github.com/AdityaJha2012/BodhOS-Downloads/releases/download/v0.3.0-preview.37/BodhOS-0.3.0-preview.37.pptx) · [Guides ZIP](https://github.com/AdityaJha2012/BodhOS-Downloads/releases/download/v0.3.0-preview.37/BodhOS-0.3.0-preview.37-Guides.zip)

## Start it in VirtualBox

1. Open VirtualBox and click **New**. Name the VM **Bodh OS**.
2. Select the finished ISO. Choose **Linux → Debian 64 bit** and **Skip Unattended Installation**.
3. Use **4096 MB RAM**, **2 CPUs** and a **new 32 GB virtual disk**. These are test settings, not hardware minimums.
4. In Settings, use **VMSVGA**, **128 MB video memory**, **3D off** and **USB Tablet** pointing. Keep NAT networking.
5. Start the VM and choose **Try Bodh OS**.

Try opens a temporary live desktop. To keep projects after shutdown, install to the new virtual disk and create your own account. Read the included [installation guide](https://adityajha2012.github.io/BodhOS-Downloads/installation.html) before installing.

<details>
<summary><strong>Manual PC download, if you do not want the automatic helper</strong></summary>

Download these three files:

1. [PC part 1](https://github.com/AdityaJha2012/BodhOS-Downloads/releases/download/v0.3.0-preview.37/BodhOS-PC-0.3.0-preview.37-amd64.iso.part01)
2. [PC part 2](https://github.com/AdityaJha2012/BodhOS-Downloads/releases/download/v0.3.0-preview.37/BodhOS-PC-0.3.0-preview.37-amd64.iso.part02)
3. [Guides ZIP](https://github.com/AdityaJha2012/BodhOS-Downloads/releases/download/v0.3.0-preview.37/BodhOS-0.3.0-preview.37-Guides.zip)

Extract the ZIP. Move both parts into the folder containing **Join PC ISO.cmd**, then double click that helper. Wait for **SUCCESS - VERIFIED ISO READY**. It checks and combines the files into one ISO.

GitHub limits each uploaded release file to under 2 GiB. Our PC ISO is 2.46 GiB, so it is split for transfer. Both parts are needed. The automatic helper handles this for you.

</details>

<details>
<summary><strong>Experimental 2018 Intel MacBook Pro download</strong></summary>

Only for **MacBookPro15,2**. This is Linux, not macOS. It does not support Apple silicon. Physical Mac hardware and dual boot remain unverified.

[Mac part 1](https://github.com/AdityaJha2012/BodhOS-Downloads/releases/download/v0.3.0-preview.37/BodhOS-MacBookPro15-2-0.3.0-preview.37-experimental-amd64.iso.part01) · [Mac part 2](https://github.com/AdityaJha2012/BodhOS-Downloads/releases/download/v0.3.0-preview.37/BodhOS-MacBookPro15-2-0.3.0-preview.37-experimental-amd64.iso.part02) · [Guides ZIP](https://github.com/AdityaJha2012/BodhOS-Downloads/releases/download/v0.3.0-preview.37/BodhOS-0.3.0-preview.37-Guides.zip)

Download both Mac parts and the Guides ZIP. Read **Mac-hardware-notes.txt** before physical testing. Windows users can prepare this image with **Join Mac ISO.cmd**. macOS and Linux joining commands are in START-HERE.html under the separate advanced section.

</details>

## What are the other Assets files?

- **Guides ZIP:** optional instructions and manual joining tools. The automatic Windows helper does not need it.
- **SHA256SUMS:** integrity fingerprints. The Windows helper checks the correct hashes automatically.
- **Source code ZIP / tar.gz:** GitHub automatically adds these. They contain this download repository, not the OS. You do not need them to run Bodh OS.

## If something goes wrong

- **VirtualBox says VERR_NOT_SUPPORTED:** check that you selected the final verified ISO. A zero byte file is not an ISO. Run the current helper and wait for SUCCESS.
- **No bootable device:** attach the verified ISO under Settings → Storage → optical drive, then start again.
- **No SUCCESS message:** the ISO is not ready. Keep the window's error message and retry from a new folder if verification fails.

## What was tested

221 source tests, 215 packaged checks, media checksums and fresh PC BIOS, PC UEFI and Mac UEFI installation suites passed. New apps, saved projects, Classroom cleanup, Rescue and snapshot rollback were checked. [Results and screenshots](validation/preview37/README.md).

This remains a development preview. Physical hardware and school deployment need their own checks. Both images include the new offline guides. Download instructions and Windows helpers were improved on 24 October 2026. The development repository remains private.
