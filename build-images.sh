#!/usr/bin/env bash

docker build --file 27.0/Dockerfile -t cimg/android:27.0 .
docker build --file 27.0/ndk/Dockerfile -t cimg/android:27.0-ndk .
docker build --file 28.0/Dockerfile -t cimg/android:28.0 .
docker build --file 28.0/ndk/Dockerfile -t cimg/android:28.0-ndk .
docker build --file 29.0/Dockerfile -t cimg/android:29.0 .
docker build --file 29.0/ndk/Dockerfile -t cimg/android:29.0-ndk .
docker build --file 30.0/Dockerfile -t cimg/android:30.0 .
docker build --file 30.0/ndk/Dockerfile -t cimg/android:30.0-ndk .
docker build --file 31.0/Dockerfile -t cimg/android:31.0 .
docker build --file 31.0/ndk/Dockerfile -t cimg/android:31.0-ndk .
