#!/usr/bin/env bash
set -euo pipefail

BUILDROOT_VERSION=${BUILDROOT_VERSION:-2025.05}

if [ -z "$BUILDROOT_VERSION" ]; then
    echo "[buildroot] BUILDROOT_VERSION is not set, skipping download."
    exit 0
fi

if [ -d "buildroot" ]; then
    echo "[buildroot] Buildroot $BUILDROOT_VERSION already exists, skipping download."
    exit 0
fi

git clone --recurse-submodules --shallow-submodules https://github.com/buildroot/buildroot.git --depth 1 --branch "$BUILDROOT_VERSION" "buildroot"
