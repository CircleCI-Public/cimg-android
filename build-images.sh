#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker build --file 2024.01/Dockerfile -t cimg/android:2024.01.1 -t cimg/android:2024.01 --platform linux/amd64 .
docker build --file 2024.01/ndk/Dockerfile -t cimg/android:2024.01.1-ndk -t cimg/android:2024.01-ndk --platform linux/amd64 .
docker build --file 2024.01/node/Dockerfile -t cimg/android:2024.01.1-node -t cimg/android:2024.01-node --platform linux/amd64 .
docker build --file 2024.01/browsers/Dockerfile -t cimg/android:2024.01.1-browsers -t cimg/android:2024.01-browsers --platform linux/amd64 .
