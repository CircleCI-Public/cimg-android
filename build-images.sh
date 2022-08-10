#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2022.08/Dockerfile -t cimg/android:2022.08.1 -t cimg/android:2022.08 .
docker build --file 2022.08/ndk/Dockerfile -t cimg/android:2022.08.1-ndk -t cimg/android:2022.08-ndk .
docker build --file 2022.08/node/Dockerfile -t cimg/android:2022.08.1-node -t cimg/android:2022.08-node .
docker build --file 2022.08/browsers/Dockerfile -t cimg/android:2022.08.1-browsers -t cimg/android:2022.08-browsers .
