#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2022.01/Dockerfile -t cimg/android:2022.01.1  -t cimg/android:2022.01 .
docker build --file 2022.01/ndk/Dockerfile -t cimg/android:2022.01.1-ndk  -t cimg/android:2022.01-ndk .
docker build --file 2022.01/node/Dockerfile -t cimg/android:2022.01.1-node  -t cimg/android:2022.01-node .
docker build --file 2022.01/browsers/Dockerfile -t cimg/android:2022.01.1-browsers  -t cimg/android:2022.01-browsers .
