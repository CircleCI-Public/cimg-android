#!/usr/bin/env bash

docker build --file 30.0/Dockerfile -t cimg/android:30.0  -t cimg/android:priceline .
docker build --file 29.0/Dockerfile -t cimg/android:29.0  -t cimg/android:priceline .
docker build --file 28.0/Dockerfile -t cimg/android:28.0  -t cimg/android:priceline .
docker build --file 27.0/Dockerfile -t cimg/android:27.0  -t cimg/android:priceline .
