#!/usr/bin/env bash
set -euo pipefail

#rm -rf build-pi5

#make -C buildroot-2025.05 O=../build-pi5 raspberrypi5_defconfig

#make -C build-pi5 show-info

make CCACHE_OPTIONS="--max-size=5G" ccache-options

#make -C build-pi5 all