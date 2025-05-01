#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/android:2025.05
docker push cimg/android:2025.05.1
docker push cimg/android:2025.05-ndk
docker push cimg/android:2025.05.1-ndk
docker push cimg/android:2025.05-node
docker push cimg/android:2025.05.1-node
docker push cimg/android:2025.05-browsers
docker push cimg/android:2025.05.1-browsers
