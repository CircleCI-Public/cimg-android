#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker buildx build --platform=linux/amd64,linux/arm64 --file 2023.11/Dockerfile -t cimg/android:2023.11 -t cimg/android:2023.11 --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 2023.11/ndk/Dockerfile -t cimg/android:2023.11-ndk -t cimg/android:2023.11-ndk --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 2023.11/node/Dockerfile -t cimg/android:2023.11-node -t cimg/android:2023.11-node --push .
docker buildx build --platform=linux/amd64 --file 2023.11/browsers/Dockerfile -t cimg/android:2023.11-browsers -t cimg/android:2023.11-browsers --push .
