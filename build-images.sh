#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2023.05/Dockerfile -t cimg/android:2023.05.1 -t cimg/android:2023.05 --platform linux/amd64 .
docker build --file 2023.05/ndk/Dockerfile -t cimg/android:2023.05.1-ndk -t cimg/android:2023.05-ndk --platform linux/amd64 .
docker build --file 2023.05/node/Dockerfile -t cimg/android:2023.05.1-node -t cimg/android:2023.05-node --platform linux/amd64 .
docker build --file 2023.05/browsers/Dockerfile -t cimg/android:2023.05.1-browsers -t cimg/android:2023.05-browsers --platform linux/amd64 .
