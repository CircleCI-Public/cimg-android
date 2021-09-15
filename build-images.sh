#!/usr/bin/env bash

docker build --file 2021.09/Dockerfile -t cimg/android:2021.09.1  -t cimg/android:2021.09 .
docker build --file 2021.09/ndk/Dockerfile -t cimg/android:2021.09.1-ndk  -t cimg/android:2021.09-ndk .
