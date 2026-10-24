# Preview 0.38 security refresh

24 October 2026. These are disposable VM and package checks, not physical hardware certification.

## Images

| Image | SHA256 |
| --- | --- |
| PC | `43ab0eb7326c9833aa0ec5e5ec595dfef63340ded1b59af33cf30e2bb148f5b7` |
| Experimental Intel MacBookPro15,2 | `094b84e45e729798a4a186c4816eb6e854d94fce7d04bd14e720a8231b6fae16` |

Both full images and the reassembled download parts were checked from native Linux and Windows. VirtualBox recognizes both full images as RAW optical media. That inspection is not a Windows VirtualBox boot test.

## Package refresh

Signed Debian repository upgrades applied ten package changes to PC and nine to Mac. This includes timezone data. Both update Brotli, HEIF and WebKitGTK/JavaScriptCore. PC also updates Firefox ESR. Mac already had that Firefox version. No available simulated full upgrades, held packages or incomplete package configuration remained at the recorded check. Exact versions are in the two security JSON files and package inventories.

The current T2 index signature and five pinned package records were verified. Its index lock changed, while kernel and package versions remained unchanged. The community repository remains disabled for unattended updates.

## Checks

* 221 native source tests and 216 packaged source checks pass.
* Both content audits and complete internal media checksum manifests pass.
* PC BIOS, PC UEFI and experimental Mac UEFI live checks pass. Each checks the actual packaged security versions, 29 learning tool checks, ten guide checks, desktop behavior and guest unit tests.
* Fresh installations in all three configurations pass four boots, project persistence, HTTPS, accounts and quotas, verified project backup/restore, coding tools, Assistant to Thonny F5 execution, JavaScript, Classroom cleanup, Rescue GRUB repair and real snapshot restoration preserving student projects.
* Six real Windows download fixture cases pass, covering download, verified join, existing images, empty output recovery, resumption and corruption refusal.
* The existing editable 20 slide presentation is updated and its changed slides rendered. Package, layout and font checks pass. No native PowerPoint execution is claimed.

## Source and automation

Runtime source: `0793be5eb430e7d9f7e4887091ea60133b0a7b0c`. Current native QA source: `58b2f64a5b3fba01db3ac0c46f99505e25a8daff`. Final installed harness: `60310d902cdb06712f80d85b128343be246532b7`. Their packaged runtime trees are byte identical. Later changes synchronize documentation and correct test automation.

Earlier runs caught stale downloadable guide copies, an incorrect fixed update count, dropped virtual keyboard characters in the repair proof and terminal focus after Thonny. Final checks use exact package manifests and a short proof command. The proof still requires administrator access, the disposable install marker and the actual repaired-disk flag. Earlier raw attempts remain private because they contain disposable test credentials. No failed repair is treated as success.

## Limits

No physical Mac, PC peripherals, Secure Boot, same drive dual boot, microphone, school pilot or Apple silicon certification. ARM64 and older Administrator/Classroom edition candidates were not rebuilt. There is no new performance benchmark. Applying available repository updates does not guarantee that every vulnerability has a fix. Bodh application code is not automatically delivered through Debian APT.
