#!/usr/bin/env bash
# ==============================================================================
# Fetch OS CI/CD Build Script (Executed inside Arch Linux container)
# ==============================================================================
set -euo pipefail

echo "========================================================"
echo "==> Step 1: Configuring Official High-Speed Mirrors..."
echo "========================================================"
mkdir -p /etc/pacman.d
cat << 'EOF' > /etc/pacman.d/mirrorlist
Server = https://geo.mirror.pkgbuild.com/$repo/os/$arch
Server = https://mirror.rackspace.com/archlinux/$repo/os/$arch
Server = https://mirrors.kernel.org/archlinux/$repo/os/$arch
EOF

echo "========================================================"
echo "==> Step 2: Initializing Pacman Keyrings..."
echo "========================================================"
pacman-key --init
pacman-key --populate archlinux

echo "========================================================"
echo "==> Step 3: Upgrading Keyring & Base Database..."
echo "========================================================"
pacman -Sy --noconfirm archlinux-keyring

echo "========================================================"
echo "==> Step 4: Installing Build Tools (archiso, squashfs, etc.)..."
echo "========================================================"
pacman -Syu --noconfirm archiso squashfs-tools dosfstools e2fsprogs libisoburn util-linux

echo "========================================================"
echo "==> Step 5: Building Fetch OS Live ISO Image..."
echo "========================================================"
mkdir -p /workspace/out
mkarchiso -v -w /tmp/archiso-work -o /workspace/out /workspace/fetch-os-profile

echo "========================================================"
echo "==> Step 6: Generating SHA256 Checksums..."
echo "========================================================"
cd /workspace/out
sha256sum *.iso > fetch-os-checksums.sha256
ls -lh /workspace/out

echo "========================================================"
echo "==> [SUCCESS] Fetch OS ISO Generated Successfully!"
echo "========================================================"
