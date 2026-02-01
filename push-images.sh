#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/android:2026.02
docker push cimg/android:2026.02.1
docker push cimg/android:2026.02-ndk
docker push cimg/android:2026.02.1-ndk
docker push cimg/android:2026.02-node
docker push cimg/android:2026.02.1-node
docker push cimg/android:2026.02-browsers
docker push cimg/android:2026.02.1-browsers
