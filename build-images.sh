#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker context create cimg
docker buildx create --use cimg
docker buildx build --platform=linux/amd64,linux/arm64 --file 2025.09/Dockerfile -t cimg/android:2025.09.1 -t cimg/android:2025.09 --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 2025.09/ndk/Dockerfile -t cimg/android:2025.09.1-ndk -t cimg/android:2025.09-ndk --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 2025.09/node/Dockerfile -t cimg/android:2025.09.1-node -t cimg/android:2025.09-node --push .
docker buildx build --platform=linux/amd64 --file 2025.09/browsers/Dockerfile -t cimg/android:2025.09.1-browsers -t cimg/android:2025.09-browsers --push .
