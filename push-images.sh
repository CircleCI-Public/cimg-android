#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/android:2024.07
docker push cimg/android:2024.07.1
docker push cimg/android:2024.07-ndk
docker push cimg/android:2024.07.1-ndk
docker push cimg/android:2024.07-node
docker push cimg/android:2024.07.1-node
docker push cimg/android:2024.07-browsers
docker push cimg/android:2024.07.1-browsers
