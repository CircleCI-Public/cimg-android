#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2022.07/Dockerfile -t cimg/android:2022.07.1 -t cimg/android:2022.07 .
docker build --file 2022.07/ndk/Dockerfile -t cimg/android:2022.07.1-ndk -t cimg/android:2022.07-ndk .
docker build --file 2022.07/node/Dockerfile -t cimg/android:2022.07.1-node -t cimg/android:2022.07-node .
docker build --file 2022.07/browsers/Dockerfile -t cimg/android:2022.07.1-browsers -t cimg/android:2022.07-browsers .
