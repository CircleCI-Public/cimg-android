#!/usr/bin/env bash

docker build --file 2021.10/Dockerfile -t cimg/android:2021.10.1  -t cimg/android:2021.10 .
docker build --file 2021.10/ndk/Dockerfile -t cimg/android:2021.10.1-ndk  -t cimg/android:2021.10-ndk .
docker build --file 2021.10/node/Dockerfile -t cimg/android:2021.10.1-node  -t cimg/android:2021.10-node .
docker build --file 2021.10/browsers/Dockerfile -t cimg/android:2021.10.1-browsers  -t cimg/android:2021.10-browsers .
