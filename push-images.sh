#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail
docker push cimg/android:2026.11
docker push cimg/android:2026.11.4
docker push cimg/android:2026.11-ndk
docker push cimg/android:2026.11.4-ndk
docker push cimg/android:2026.11-node
docker push cimg/android:2026.11.4-node
docker push cimg/android:2026.11-browsers
docker push cimg/android:2026.11.4-browsers
