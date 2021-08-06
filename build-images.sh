#!/usr/bin/env bash

docker build --file 2021.08/Dockerfile -t cimg/android:2021.08.1  -t cimg/android:2021.08 .
docker build --file 2021.08/ndk/Dockerfile -t cimg/android:2021.08.1-ndk  -t cimg/android:2021.08-ndk .
