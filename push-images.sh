#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/android:2024.10
docker push cimg/android:2024.10.1
docker push cimg/android:2024.10-ndk
docker push cimg/android:2024.10.1-ndk
docker push cimg/android:2024.10-node
docker push cimg/android:2024.10.1-node
docker push cimg/android:2024.10-browsers
docker push cimg/android:2024.10.1-browsers
