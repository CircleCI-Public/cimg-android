#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2022.06/Dockerfile -t cimg/android:2022.06.1  -t cimg/android:2022.06 .
docker build --file 2022.06/ndk/Dockerfile -t cimg/android:2022.06.1-ndk  -t cimg/android:2022.06-ndk .
docker build --file 2022.06/node/Dockerfile -t cimg/android:2022.06.1-node  -t cimg/android:2022.06-node .
docker build --file 2022.06/browsers/Dockerfile -t cimg/android:2022.06.1-browsers  -t cimg/android:2022.06-browsers .
