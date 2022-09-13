#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2022.09/Dockerfile -t cimg/android:2022.09.1 -t cimg/android:2022.09 .
docker build --file 2022.09/ndk/Dockerfile -t cimg/android:2022.09.1-ndk -t cimg/android:2022.09-ndk .
docker build --file 2022.09/node/Dockerfile -t cimg/android:2022.09.1-node -t cimg/android:2022.09-node .
docker build --file 2022.09/browsers/Dockerfile -t cimg/android:2022.09.1-browsers -t cimg/android:2022.09-browsers .
