#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/android:2025.01
docker push cimg/android:2025.01.1
docker push cimg/android:2025.01-ndk
docker push cimg/android:2025.01.1-ndk
docker push cimg/android:2025.01-node
docker push cimg/android:2025.01.1-node
docker push cimg/android:2025.01-browsers
docker push cimg/android:2025.01.1-browsers
