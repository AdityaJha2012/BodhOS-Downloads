# macOS downloader package checks

Both helpers are unsigned developer previews. Neither was mounted or launched on real macOS. Native Apple silicon OS support is not added.

Linux packaging checks confirm UDIF v4 metadata, HFS+ contents, the Apple Partition Map, a byte identical decoded filesystem and all resource hashes. The HFS+ filesystem reports the app launcher as mode 100755. Bash syntax checks pass. AppleScript compilation, launch permissions, Gatekeeper handling and complete downloads need real Intel and Apple silicon macOS checks.

Build tool: planetbeing/libdmg-hfsplus, commit 7ac55ec64c96f7800d9818ce64c79670e7f02b67. Its binary is not bundled in the app.

The existing PC and experimental Intel Mac ISO bytes are unchanged. This package update does not change the earlier ISO verification results.
