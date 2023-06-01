#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2023.06/Dockerfile -t cimg/android:2023.06.1 -t cimg/android:2023.06 --platform linux/amd64 .
docker build --file 2023.06/ndk/Dockerfile -t cimg/android:2023.06.1-ndk -t cimg/android:2023.06-ndk --platform linux/amd64 .
docker build --file 2023.06/node/Dockerfile -t cimg/android:2023.06.1-node -t cimg/android:2023.06-node --platform linux/amd64 .
docker build --file 2023.06/browsers/Dockerfile -t cimg/android:2023.06.1-browsers -t cimg/android:2023.06-browsers --platform linux/amd64 .
