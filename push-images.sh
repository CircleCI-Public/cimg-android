#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/android:2025.03
docker push cimg/android:2025.03.1
docker push cimg/android:2025.03-ndk
docker push cimg/android:2025.03.1-ndk
docker push cimg/android:2025.03-node
docker push cimg/android:2025.03.1-node
docker push cimg/android:2025.03-browsers
docker push cimg/android:2025.03.1-browsers
