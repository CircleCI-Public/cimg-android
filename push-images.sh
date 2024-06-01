#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/android:2024.06
docker push cimg/android:2024.06.1
docker push cimg/android:2024.06-ndk
docker push cimg/android:2024.06.1-ndk
docker push cimg/android:2024.06-node
docker push cimg/android:2024.06.1-node
docker push cimg/android:2024.06-browsers
docker push cimg/android:2024.06.1-browsers
