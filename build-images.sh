#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker build --file 2025.09/Dockerfile -t cimg/android:2025.09.1 -t cimg/android:2025.09 --platform linux/amd64 --push .
docker build --file 2025.09/ndk/Dockerfile -t cimg/android:2025.09.1-ndk -t cimg/android:2025.09-ndk --platform linux/amd64 --push .
docker build --file 2025.09/node/Dockerfile -t cimg/android:2025.09.1-node -t cimg/android:2025.09-node --platform linux/amd64 --push .
docker build --file 2025.09/browsers/Dockerfile -t cimg/android:2025.09.1-browsers -t cimg/android:2025.09-browsers --platform linux/amd64 --push .
