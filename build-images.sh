#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker build --file 2026.11/Dockerfile -t cimg/android:2026.11.2 -t cimg/android:2026.11 --platform linux/amd64 --push .
docker build --file 2026.11/ndk/Dockerfile -t cimg/android:2026.11.2-ndk -t cimg/android:2026.11-ndk --platform linux/amd64 --push .
docker build --file 2026.11/node/Dockerfile -t cimg/android:2026.11.2-node -t cimg/android:2026.11-node --platform linux/amd64 --push .
docker build --file 2026.11/browsers/Dockerfile -t cimg/android:2026.11.2-browsers -t cimg/android:2026.11-browsers --platform linux/amd64 --push .
