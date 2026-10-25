#!/usr/bin/env bash
# Read-only local observations. No scans, installs, repair, or privilege escalation.
set -u
export LC_ALL=C
section() {
    printf '\n== %s ==\n' "$1"; shift
    if ! command -v "$1" >/dev/null 2>&1; then
        printf 'Not available: %s\n' "$1"; return
    fi
    timeout 15s "$@" 2>&1 || printf 'This check could not complete. Ask the administrator to review the output.\n'
}
printf 'Bodh OS school hardware observations\n'
printf 'This is an inventory, not a certification. Keep the output private.\n'
section 'Kernel' uname -r
section 'Processor architecture' uname -m
section 'Memory' free -m
section 'PCI devices and kernel drivers' lspci -nnk
printf '\n== USB device types ==\n'
if command -v lsusb >/dev/null 2>&1; then
    usb_output=$(timeout 15s lsusb 2>&1)
    usb_status=$?
    if [[ $usb_status -eq 0 ]]; then
        printf '%s\n' "$usb_output"
    elif [[ $usb_status -eq 1 && -z $usb_output ]]; then
        printf 'No USB devices were reported. This can be normal in a VM.\n'
    else
        printf '%s\nThis check could not complete. Ask the administrator to review the output.\n' "$usb_output"
    fi
else
    printf 'Not available: lsusb\n'
fi
if [[ -n ${DISPLAY:-} ]]; then
    section 'Graphics renderer' glxinfo -B
    section 'Connected screens' xrandr --listmonitors
else
    printf '\nGraphics display checks need a local desktop terminal.\n'
fi
section 'Network connection state' nmcli -t -f DEVICE,TYPE,STATE device status
section 'Firewall service state' systemctl is-active ufw
printf '\nAn active service alone does not prove the firewall rules.\n'
printf 'An administrator can review: sudo ufw status verbose\n'
printf 'Also test keyboard, mouse, sound, networking, suspend and student save/reboot in person.\n'
printf 'Do not upload raw hardware reports or student data publicly.\n'
