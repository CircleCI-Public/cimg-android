#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker build --file 2026.01/Dockerfile -t cimg/android:2026.01.1 -t cimg/android:2026.01 --platform linux/amd64 --push .
docker build --file 2026.01/ndk/Dockerfile -t cimg/android:2026.01.1-ndk -t cimg/android:2026.01-ndk --platform linux/amd64 --push .
docker build --file 2026.01/node/Dockerfile -t cimg/android:2026.01.1-node -t cimg/android:2026.01-node --platform linux/amd64 --push .
docker build --file 2026.01/browsers/Dockerfile -t cimg/android:2026.01.1-browsers -t cimg/android:2026.01-browsers --platform linux/amd64 --push .
