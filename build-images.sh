#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2022.10/Dockerfile -t cimg/android:2022.10.1 -t cimg/android:2022.10 .
docker build --file 2022.10/ndk/Dockerfile -t cimg/android:2022.10.1-ndk -t cimg/android:2022.10-ndk .
docker build --file 2022.10/node/Dockerfile -t cimg/android:2022.10.1-node -t cimg/android:2022.10-node .
docker build --file 2022.10/browsers/Dockerfile -t cimg/android:2022.10.1-browsers -t cimg/android:2022.10-browsers .
