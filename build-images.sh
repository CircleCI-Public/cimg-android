#!/usr/bin/env bash

docker build --file 2021.09/Dockerfile -t cimg/android:2021.09.2  -t cimg/android:2021.09 .
docker build --file 2021.09/ndk/Dockerfile -t cimg/android:2021.09.2-ndk  -t cimg/android:2021.09-ndk .
docker build --file 2021.09/node/Dockerfile -t cimg/android:2021.09.2-node  -t cimg/android:2021.09-node .
docker build --file 2021.09/browsers/Dockerfile -t cimg/android:2021.09.2-browsers  -t cimg/android:2021.09-browsers .
