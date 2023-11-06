#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker buildx build --platform=linux/amd64,linux/arm64 --file 2023.12/Dockerfile -t cimg/android:2023.12.1 -t cimg/android:2023.12 --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 2023.12/ndk/Dockerfile -t cimg/android:2023.12.1-ndk -t cimg/android:2023.12-ndk --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 2023.12/node/Dockerfile -t cimg/android:2023.12.1-node -t cimg/android:2023.12-node --push .
docker buildx build --platform=linux/amd64 --file 2023.12/browsers/Dockerfile -t cimg/android:2023.12.1-browsers -t cimg/android:2023.12-browsers --push .
