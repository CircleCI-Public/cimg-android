#!/usr/bin/env bash

docker build --file 2021.12/Dockerfile -t cimg/android:2021.12.2  -t cimg/android:2021.12 .
docker build --file 2021.12/ndk/Dockerfile -t cimg/android:2021.12.2-ndk  -t cimg/android:2021.12-ndk .
docker build --file 2021.12/node/Dockerfile -t cimg/android:2021.12.2-node  -t cimg/android:2021.12-node .
docker build --file 2021.12/browsers/Dockerfile -t cimg/android:2021.12.2-browsers  -t cimg/android:2021.12-browsers .
