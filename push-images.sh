#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/android:2024.09
docker push cimg/android:2024.09.1
docker push cimg/android:2024.09-ndk
docker push cimg/android:2024.09.1-ndk
docker push cimg/android:2024.09-node
docker push cimg/android:2024.09.1-node
docker push cimg/android:2024.09-browsers
docker push cimg/android:2024.09.1-browsers
