<div align="center">

# ⚡ Fetch OS

**A Modern, Blazing-Fast & Beautiful Rolling Linux Distribution based on Arch Linux & KDE Plasma 6**

[![Build Fetch OS ISO](https://github.com/IgorKaledin/FetchOS/actions/workflows/build-iso.yml/badge.svg)](https://github.com/IgorKaledin/FetchOS/actions/workflows/build-iso.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Arch Linux Base](https://img.shields.io/badge/Base-Arch%20Linux-1793D1?logo=archlinux&logoColor=white)](https://archlinux.org)
[![Desktop: KDE Plasma 6](https://img.shields.io/badge/Desktop-KDE%20Plasma%206-1D99F3?logo=kde&logoColor=white)](https://kde.org/plasma-desktop/)
[![Wayland Enabled](https://img.shields.io/badge/Display-Wayland-FFA500)](https://wayland.freedesktop.org/)

---

</div>

## ✨ Highlights & Features

- 🚀 **Next-Gen Desktop**: Built with **KDE Plasma 6** on native **Wayland** for smooth animations, HDR support, and fractional scaling.
- ⚡ **Pure Rolling Speed**: Always updated packages, latest Linux kernel, and bleeding-edge graphics drivers (Mesa / Vulkan).
- 🔊 **Modern Multimedia**: Full **PipeWire & WirePlumber** audio stack out of the box.
- 🛠️ **Developer Ready**: Preloaded with developer essentials (`neovim`, `btop`, `fastfetch`, `git`, `zsh`, `tmux`).
- 📦 **Automated CI/CD ISO Builds**: Zero-effort cloud builds powered by GitHub Actions.
- 💽 **Calamares Graphical Installer**: Clean, beginner-friendly permanent installation to NVMe/SSD/HDD.

---

## 🏗️ Architecture & Project Structure

```
FetchOS/
├── .github/workflows/          # 🤖 Automated CI/CD ISO Build Pipelines
│   └── build-iso.yml
│
├── fetch-os-profile/           # 📦 Fetch OS Distribution Profile
│   ├── profiledef.sh           # OS Metadata & build definitions
│   ├── packages.x86_64         # Full package list (Kernel, KDE, GPU, Audio, Apps)
│   ├── pacman.conf             # Package repositories configuration
│   ├── airootfs/               # Root filesystem overlay (configs, users, themes, services)
│   │   ├── etc/
│   │   │   ├── os-release      # Fetch OS distribution branding
│   │   │   ├── sddm.conf.d/    # Display manager autologin & styling
│   │   │   └── sudoers.d/      # User permission rules
│   │   └── home/fetch/Desktop/ # Live desktop shortcuts & installer
│   ├── efiboot/                # UEFI systemd-boot loader configuration
│   └── syslinux/               # BIOS syslinux loader configuration
│
└── build-iso.sh                # 🛠️ Local build script for Linux / WSL2 / Docker
```

---

## 🚀 Downloading & Building

### 1. Download Pre-built Live ISO
Whenever a commit or release is made, the automated build pipeline produces a ready-to-flash `.iso` file.
👉 Head to the **[Actions Tab](https://github.com/IgorKaledin/FetchOS/actions)** to download the latest **`fetch-os-x86_64.iso`** artifact.

### 2. Local Build (Linux / WSL2 / Docker)
If you are on an Arch Linux or containerized Linux system:
```bash
sudo ./build-iso.sh
```

---

## 👥 Authors & Community

- **Founder & Lead Developer**: [Igor Kaledin](https://github.com/IgorKaledin)
- **Project**: Fetch OS Linux Distribution
