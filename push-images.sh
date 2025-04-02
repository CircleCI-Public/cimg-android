#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/android:2025.04
docker push cimg/android:2025.04.1
docker push cimg/android:2025.04-ndk
docker push cimg/android:2025.04.1-ndk
docker push cimg/android:2025.04-node
docker push cimg/android:2025.04.1-node
docker push cimg/android:2025.04-browsers
docker push cimg/android:2025.04.1-browsers
