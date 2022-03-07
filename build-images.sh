#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2022.03/Dockerfile -t cimg/android:2022.03.1  -t cimg/android:2022.03 .
docker build --file 2022.03/ndk/Dockerfile -t cimg/android:2022.03.1-ndk  -t cimg/android:2022.03-ndk .
docker build --file 2022.03/node/Dockerfile -t cimg/android:2022.03.1-node  -t cimg/android:2022.03-node .
docker build --file 2022.03/browsers/Dockerfile -t cimg/android:2022.03.1-browsers  -t cimg/android:2022.03-browsers .
