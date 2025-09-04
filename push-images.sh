#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/android:2025.09
docker push cimg/android:2025.09.1
docker push cimg/android:2025.09-ndk
docker push cimg/android:2025.09.1-ndk
docker push cimg/android:2025.09-node
docker push cimg/android:2025.09.1-node
docker push cimg/android:2025.09-browsers
docker push cimg/android:2025.09.1-browsers
