#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker build --file 2025.08/Dockerfile -t cimg/android:2025.08.1 -t cimg/android:2025.08 --platform linux/amd64 --push .
docker build --file 2025.08/ndk/Dockerfile -t cimg/android:2025.08.1-ndk -t cimg/android:2025.08-ndk --platform linux/amd64 --push .
docker build --file 2025.08/node/Dockerfile -t cimg/android:2025.08.1-node -t cimg/android:2025.08-node --platform linux/amd64 --push .
docker build --file 2025.08/browsers/Dockerfile -t cimg/android:2025.08.1-browsers -t cimg/android:2025.08-browsers --platform linux/amd64 --push .
