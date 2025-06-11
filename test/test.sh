#!/usr/bin/env bash
set -euo pipefail

BUILDROOT_DIR=${BUILDROOT_DIR:-"buildroot"}
BUILDROOT_VERSION=${BUILDROOT_VERSION:-"2025.05"}
BUILDROOT_TARGET_CONFIG=${BUILDROOT_TARGET_CONFIG:-"raspberrypi5_defconfig"}
BUILDROOT_TARGET_DIR=${BUILDROOT_TARGET_DIR:-"raspberrypi5_defconfig"}
BR2_JLEVEL=${BR2_JLEVEL:-"4"}

if [ -z "$BUILDROOT_VERSION" ]; then
    echo "[buildroot] BUILDROOT_VERSION is not set, skipping download."
    exit 0
fi

if [ ! -d "$BUILDROOT_DIR" ]; then
    git clone --recurse-submodules --shallow-submodules https://github.com/buildroot/buildroot.git --depth 1 --branch $BUILDROOT_VERSION $BUILDROOT_DIR
else
    echo "[buildroot] Buildroot $BUILDROOT_VERSION already exists, skipping download."
fi

make -C "$BUILDROOT_DIR" O=../"$BUILDROOT_TARGET_DIR" "$BUILDROOT_TARGET_CONFIG"

make -C "$BUILDROOT_TARGET_DIR" show-info

rm -f "$BUILDROOT_DIR" "$BUILDROOT_TARGET_DIR"

#make -C "$BUILDROOT_TARGET_DIR" BR2_JLEVEL="$BR2_JLEVEL" all

#make CCACHE_OPTIONS="--max-size=5G" ccache-options

#rsync --progress --human-readable --archive --verbose --compress --acls --xattrs --bwlimit=500000 --stats --delete-during