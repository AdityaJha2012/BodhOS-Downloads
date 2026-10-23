# Current release evidence

[Preview 0.37 results and screenshots](preview37/README.md).

The following record is historical Preview 0.36 evidence.

# Preview 0.36 release validation

Status: source, image, live, fresh installation, packaged feature and download asset checks pass. Both images qualify as development previews. Physical hardware remains unverified.

## Images and provenance

Both images were built from runtime source `8667af4a72e7b7005c9903a2c231d0d410fb503b`. Later commits change QA and release packaging only. The runtime is overlaid onto checksum pinned factory images. The original installer and boot payloads are retained, Debian terminal packages are installed, and internal media hashes are regenerated. This is a documented remaster rather than a full factory rebuild. See [build provenance](build-provenance.json).

| Image | Bytes | SHA256 |
|---|---:|---|
| PC amd64 | 2638479360 | `89af8be90566a6d33b9b6c6bf56f3586b9e2a33049190d3c4c0cd4c1999c7b4c` |
| MacBookPro15,2 experimental amd64 | 3128033280 | `e3133f35f6016d412484a4df931816fb30b8f51cf8e4ef6a8e9da93e96dcde4e` |

PC has 928 entries in each internal checksum manifest. Mac has 931. MD5 and SHA256 both pass. Both packaged runtime audits match the clean source, including executable launcher permissions. No disposable validation accounts, SSH keys, configured AI server, Picom or graphical Wireshark are added to the images.

## Native source and application checks

The final Linux source suite passes 216 tests. Clean packaged source validation checks 208 files. Quick Help and Study Tools pass 29 real GTK checks under Xvfb, including all ten help articles, search, no results, keyboard focus, repeated activation, timer presets, pause, resume, reset, real expiry and safe closing. The expiry test uses a one second duration with the real monotonic clock and GLib callback.

The initial GTK fixture tried to register two Application objects sequentially in one process. It now uses separate processes, matching desktop launches. The countdown assertion allows GLib seconds timer coalescing. Neither issue required a product change.

## Live image checks

Fresh PC BIOS, PC UEFI and Mac UEFI live guests pass. Each runs the actual packaged `/usr/local/bin` Quick Help and Study Tools through all 29 checks, plus 33 desktop checks. The desktop checks include wallpaper, coding taskbar launchers, Settings, keyboard focus, Standard and Reduced, preview confirmation and automatic reversion, legacy Glass fallback and Rescue diagnostics.

The 211 test guest source suite reports success with six ISO helper tests skipped because xorriso is absent. That is 205 executed tests, not 211 executed tests. All run in the native Linux suite. HTTPS and the terminal security sample also pass. The QA payload is a separate private CD, never part of the release ISO.

The actual live kernels are `6.12.113+deb13-amd64` on PC and `6.18.58-1-t2-trixie` on Mac. See [live results](live-results.json) and the per guest app screenshots.

## Fresh installation checks

All three fresh installation suites pass. Results are recorded in [installed results](installed-results.json). PC BIOS, PC UEFI and Mac UEFI use new disposable 32 GB QEMU disks, a separate snapshot disk, two CPUs, 4 GB RAM and random test credentials. Four installed boots verify saved project contents, HTTPS, school accounts and quotas, backup and restore, desktop tools, the Assistant to Thonny F5 path, JavaScript in Geany, Classroom cleanup, GRUB repair and snapshot rollback. Test credentials never enter the factory images or public logs.

### Initial failures and corrections

- The first BIOS login was rejected. Repeating a new installation of the same ISO passed. The harness now clears and retries a rejected greeter submission with slower typing. No product password was changed.
- An initial UEFI restore used a transient `/dev/sdb` test disk name. Enumeration changed after reboot and the OS correctly refused a restore from the running root disk. The harness now assigns fixed virtual disk serials and resolves the snapshot device by ID. The root disk safety guard is retained.
- OCR read `hello.py` as `helio py` in a correctly opened file chooser. The harness now checks the chooser title, selects the exact path and requires real F5 execution to write the expected output. It does not use filename OCR as proof of execution.

Earlier failed runs remain private diagnostic history. Only fully completed reruns count as passing.

## Packaged Student Files and Assistant checks

Both additional packaged app suites pass. Results are recorded in [extra app results](extra-app-results.json). These load `/usr/share/bodhos` from the actual image. Student Files creates a real project from packaged templates in a temporary QA home and cancels hand in safely. Assistant verifies opt in, local actions, bounded follow up history, transcript review and clear chat using a local fake HTTP server. This verifies client behavior, not actual AI answer quality or microphone accuracy.

## Download packaging

Full external ISO copies and reassembled part streams match their native ISO SHA256 hashes. The Windows join helper passes real Windows tests for valid parts, an existing valid ISO, an existing mismatched ISO, a corrupt part, a missing part and a preserved partial output. It neither overwrites mismatched output nor changes script policy. All six GitHub asset SHA256 digests and byte lengths match local verified files before publication. The public asset record is saved separately.

## Unverified work

No fresh performance measurements were taken for Preview 0.36. Preview 0.35 measurements remain historical. Physical Macs and PCs, hardware drivers, WiFi, microphones, printers, removable devices and a school pilot remain unverified. Mac stock Debian fallback is packaged but is not a claim of tested Mac recovery. T2 kernel packages are pinned and require reviewed updates. Apple silicon and Raspberry Pi are outside this release. Separate Administrator and Classroom edition candidates remain earlier images.

## Download instructions update, 24 October 2026

The verified ISO bytes are unchanged. The public page now leads with one Windows download helper. It fetches the two parts, resumes interrupted transfers, joins and verifies the ISO. An earlier empty ISO is preserved and repaired. Six real Windows cmd/curl/certutil fixture cases pass. The helper and revised Guides ZIP were downloaded without authentication and their hashes verified. All seven release asset digests match the expected bytes. See [delivery tool checks](download-helper-20261024.json) and [publication](publication.json).
