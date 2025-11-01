#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/android:2025.11
docker push cimg/android:2025.11.1
docker push cimg/android:2025.11-ndk
docker push cimg/android:2025.11.1-ndk
docker push cimg/android:2025.11-node
docker push cimg/android:2025.11.1-node
docker push cimg/android:2025.11-browsers
docker push cimg/android:2025.11.1-browsers
