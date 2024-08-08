#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/android:2024.08
docker push cimg/android:2024.08.1
docker push cimg/android:2024.08-ndk
docker push cimg/android:2024.08.1-ndk
docker push cimg/android:2024.08-node
docker push cimg/android:2024.08.1-node
docker push cimg/android:2024.08-browsers
docker push cimg/android:2024.08.1-browsers
