#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/android:2025.02
docker push cimg/android:2025.02.1
docker push cimg/android:2025.02-ndk
docker push cimg/android:2025.02.1-ndk
docker push cimg/android:2025.02-node
docker push cimg/android:2025.02.1-node
docker push cimg/android:2025.02-browsers
docker push cimg/android:2025.02.1-browsers
