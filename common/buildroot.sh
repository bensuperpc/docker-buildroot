#!/usr/bin/env bash
set -euo pipefail

BUILDROOT_VERSION=${BUILDROOT_VERSION:-2025.05}

if [ -d "buildroot-$BUILDROOT_VERSION" ]; then
    echo "[buildroot] Buildroot $BUILDROOT_VERSION already exists, skipping download."
    exit 0
fi

git clone --recursive https://github.com/buildroot/buildroot.git --depth 1 --branch "$BUILDROOT_VERSION" "buildroot-$BUILDROOT_VERSION"
