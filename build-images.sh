#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker build --file 2026.02/Dockerfile -t cimg/android:2026.02.1 -t cimg/android:2026.02 --platform linux/amd64 --push .
docker build --file 2026.02/ndk/Dockerfile -t cimg/android:2026.02.1-ndk -t cimg/android:2026.02-ndk --platform linux/amd64 --push .
docker build --file 2026.02/node/Dockerfile -t cimg/android:2026.02.1-node -t cimg/android:2026.02-node --platform linux/amd64 --push .
docker build --file 2026.02/browsers/Dockerfile -t cimg/android:2026.02.1-browsers -t cimg/android:2026.02-browsers --platform linux/amd64 --push .
