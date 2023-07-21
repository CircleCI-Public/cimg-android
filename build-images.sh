#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker context create cimg
docker buildx create --use cimg
docker buildx build --platform=linux/amd64,linux/arm64 --file 2023.07/Dockerfile -t cimg/android:2023.07.1 -t cimg/android:2023.07 --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 2023.07/ndk/Dockerfile -t cimg/android:2023.07.1-ndk -t cimg/android:2023.07-ndk --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 2023.07/node/Dockerfile -t cimg/android:2023.07.1-node -t cimg/android:2023.07-node --push .
docker buildx build --platform=linux/amd64 --file 2023.07/browsers/Dockerfile -t cimg/android:2023.07.1-browsers -t cimg/android:2023.07-browsers --push .
