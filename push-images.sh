#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/android:2025.08
docker push cimg/android:2025.08.1
docker push cimg/android:2025.08-ndk
docker push cimg/android:2025.08.1-ndk
docker push cimg/android:2025.08-node
docker push cimg/android:2025.08.1-node
docker push cimg/android:2025.08-browsers
docker push cimg/android:2025.08.1-browsers
