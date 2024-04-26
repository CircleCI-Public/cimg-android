#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker build --file 2024.04/Dockerfile -t cimg/android:2024.04.1 -t cimg/android:2024.04 --platform linux/amd64 --push .
docker build --file 2024.04/ndk/Dockerfile -t cimg/android:2024.04.1-ndk -t cimg/android:2024.04-ndk --platform linux/amd64 --push .
docker build --file 2024.04/node/Dockerfile -t cimg/android:2024.04.1-node -t cimg/android:2024.04-node --platform linux/amd64 --push .
docker build --file 2024.04/browsers/Dockerfile -t cimg/android:2024.04.1-browsers -t cimg/android:2024.04-browsers --platform linux/amd64 --push .
