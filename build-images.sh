#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker context create cimg
docker buildx create --use cimg
docker buildx build --platform=linux/amd64,linux/arm64 --file 2023.10/Dockerfile -t cimg/android:2023.10 -t cimg/android:2023.10 --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 2023.10/ndk/Dockerfile -t cimg/android:2023.10-ndk -t cimg/android:2023.10-ndk --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 2023.10/node/Dockerfile -t cimg/android:2023.10-node -t cimg/android:2023.10-node --push .
docker buildx build --platform=linux/amd64 --file 2023.10/browsers/Dockerfile -t cimg/android:2023.10-browsers -t cimg/android:2023.10-browsers --push .
