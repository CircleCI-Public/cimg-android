#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker build --file 2026.05/Dockerfile -t cimg/android:2026.05.1 -t cimg/android:2026.05 --platform linux/amd64 --push .
docker build --file 2026.05/ndk/Dockerfile -t cimg/android:2026.05.1-ndk -t cimg/android:2026.05-ndk --platform linux/amd64 --push .
docker build --file 2026.05/node/Dockerfile -t cimg/android:2026.05.1-node -t cimg/android:2026.05-node --platform linux/amd64 --push .
docker build --file 2026.05/browsers/Dockerfile -t cimg/android:2026.05.1-browsers -t cimg/android:2026.05-browsers --platform linux/amd64 --push .
