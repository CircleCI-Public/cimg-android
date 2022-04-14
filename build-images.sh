#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes

docker build --file 2022.04/Dockerfile -t cimg/android:2022.04 .
docker build --file 2022.04/ndk/Dockerfile -t cimg/android:2022.04-ndk .
docker build --file 2022.04/node/Dockerfile -t cimg/android:2022.04-node .
docker build --file 2022.04/browsers/Dockerfile -t cimg/android:2022.04-browsers .
