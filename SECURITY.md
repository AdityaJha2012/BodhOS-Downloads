# Security

Use the current verified Preview 0.39 release linked in the README. It fixes firewall configuration line endings and retains Preview 0.38 signed package security updates. Old images and school edition candidates are historical.

On existing installations, check firewall activation. Debian package updates alone do not apply this Bodh configuration correction. Follow [the current security guide](https://adityajha2012.github.io/BodhOS-Downloads/security-updates.html), which preserves your rules and makes a backup.

This development preview has no guarantee of being free from vulnerabilities. Physical hardware and school deployment remain unverified. Report issues privately to the project maintainer.

Fresh audit on 26 October 2026 found no additional Debian package upgrades for the current PC image or the experimental Mac package set. Pinned T2 metadata was authenticated separately. See [the fresh evidence](validation/school-2026-10-26/README.md). ISO checksums remain unchanged. This does not establish that every vulnerability is fixed.
