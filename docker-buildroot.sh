#!/usr/bin/env bash
set -euo pipefail

REGISTRY="docker.io"
IMAGE="bensuperpc/buildroot"
TAG="debian-12"

DOCKER_IMAGE="buildroot-$(uuidgen)"

CPUS="$(nproc --all)"
CPU_SHARES="1024"
RES_RAM="4GB"
MAX_RAM="16GB"
TMPFS_SIZE="4g"

PUID="$(id -u)"
PGID="$(id -g)"
USERNAME="$(id -un)"

# --read-only
docker run --rm \
        --security-opt no-new-privileges --cap-drop SYS_ADMIN -e PUID="$PUID" -e PGID="$PGID" -e USERNAME="$USERNAME" \
        --mount type=bind,source=$(pwd),target=/work --workdir /work \
        --tmpfs /tmp:exec,size=$(TMPFS_SIZE),mode=1777 \
        --platform linux/amd64 \
        --cpus "$CPUS" --cpu-shares "$CPU_SHARES" --memory-reservation "$RES_RAM" --memory "$MAX_RAM" \
        --name "$DOCKER_IMAGE" \
        "$REGISTRY/$IMAGE:$TAG" \
        "$@"
