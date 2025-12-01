#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/android:2025.12
docker push cimg/android:2025.12.1
docker push cimg/android:2025.12-ndk
docker push cimg/android:2025.12.1-ndk
docker push cimg/android:2025.12-node
docker push cimg/android:2025.12.1-node
docker push cimg/android:2025.12-browsers
docker push cimg/android:2025.12.1-browsers
