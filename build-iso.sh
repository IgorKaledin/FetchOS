#!/usr/bin/env bash
# ==============================================================================
# Fetch OS ISO Build Script
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROFILE_DIR="${SCRIPT_DIR}/fetch-os-profile"
WORK_DIR="${SCRIPT_DIR}/work"
OUT_DIR="${SCRIPT_DIR}/out"

echo "========================================================"
echo "           🚀 FETCH OS ISO BUILD SYSTEM               "
echo "========================================================"
echo "Profile directory: ${PROFILE_DIR}"
echo "Work directory:    ${WORK_DIR}"
echo "Output directory:  ${OUT_DIR}"
echo "========================================================"

# Check root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "[-] Error: This script must be run as root (sudo)."
    exit 1
fi

# Ensure mkarchiso is available
if ! command -v mkarchiso &> /dev/null; then
    echo "[!] mkarchiso not found. Attempting to use upstream archiso tool..."
    export PATH="${SCRIPT_DIR}/upstream/archiso/archiso:${PATH}"
fi

# Prepare output directory
mkdir -p "${OUT_DIR}"
mkdir -p "${WORK_DIR}"

echo "[*] Starting ISO generation with mkarchiso..."
mkarchiso -v -w "${WORK_DIR}" -o "${OUT_DIR}" "${PROFILE_DIR}"

echo ""
echo "========================================================"
echo " [SUCCESS] Fetch OS ISO build complete!"
echo " Image generated in: ${OUT_DIR}"
echo "========================================================"
