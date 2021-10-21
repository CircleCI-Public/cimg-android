#!/usr/bin/env bash

docker build --file 2021.10/Dockerfile -t cimg/android:2021.10.2  -t cimg/android:2021.10 .
docker build --file 2021.10/ndk/Dockerfile -t cimg/android:2021.10.2-ndk  -t cimg/android:2021.10-ndk .
docker build --file 2021.10/node/Dockerfile -t cimg/android:2021.10.2-node  -t cimg/android:2021.10-node .
docker build --file 2021.10/browsers/Dockerfile -t cimg/android:2021.10.2-browsers  -t cimg/android:2021.10-browsers .
