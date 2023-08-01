#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2023.08/Dockerfile -t cimg/android:2023.08.1 -t cimg/android:2023.08 --platform linux/amd64 .
docker build --file 2023.08/ndk/Dockerfile -t cimg/android:2023.08.1-ndk -t cimg/android:2023.08-ndk --platform linux/amd64 .
docker build --file 2023.08/node/Dockerfile -t cimg/android:2023.08.1-node -t cimg/android:2023.08-node --platform linux/amd64 .
docker build --file 2023.08/browsers/Dockerfile -t cimg/android:2023.08.1-browsers -t cimg/android:2023.08-browsers --platform linux/amd64 .
