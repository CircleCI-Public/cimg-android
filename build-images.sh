#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker build --file 2023.12/Dockerfile -t cimg/android:2023.12.1 -t cimg/android:2023.12 --platform linux/amd64 .
docker build --file 2023.12/ndk/Dockerfile -t cimg/android:2023.12.1-ndk -t cimg/android:2023.12-ndk --platform linux/amd64 .
docker build --file 2023.12/node/Dockerfile -t cimg/android:2023.12.1-node -t cimg/android:2023.12-node --platform linux/amd64 .
docker build --file 2023.12/browsers/Dockerfile -t cimg/android:2023.12.1-browsers -t cimg/android:2023.12-browsers --platform linux/amd64 .
