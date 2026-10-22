#!/bin/bash

echo "Initializing submodule..."
git submodule update --init --recursive
cd shared || exit && \
git checkout main
if [ -f automated-updates.sh ]; then
  source automated-updates.sh
else
  echo "Check if submodule was loaded; automated-updates.sh is missing"
  exit 1
fi
cd ..

generateDatedTags
RELEASE=$RELEASE.1

git checkout -b "release-v$RELEASE"

sdkmanager --update

CLT_VERSION=$(curl -s https://developer.android.com/studio#command-line-tools-only | grep "commandlinetools-linux" | grep -o '[0-9]\+'| tr -d '[:blank:]' | head -1)
echo "Command Line Tools version: $CLT_VERSION"

# keep on top of the latest gcloud CLI updates rather than relying on the in-use tag for the build
gcloud components update --quiet

GCLOUD_VERSION=$(gcloud version | head -1 | sed 's/[^0-9.]//g')
echo "Gcloud version: $GCLOUD_VERSION"

GRADLE_VERSION=$(curl --silent "https://api.github.com/repos/gradle/gradle/releases/latest" | jq -r .name | sed 's/^[^0-9]*//')
echo "Gradle version: $GRADLE_VERSION"

MAVEN_VERSION=$(curl --silent "https://api.github.com/repos/apache/maven/releases/latest" | jq -r .tag_name | sed 's/^[^0-9]*//')
echo "Maven version: $MAVEN_VERSION"

FASTLANE_VERSION=$(curl --silent "https://api.github.com/repos/fastlane/fastlane/releases/latest" | jq -r .tag_name)
echo "Fastlane version: $FASTLANE_VERSION"

# Unique stable Build Tools versions sorted in the descending order
NON_RC_BT=$(sdkmanager --list | grep "build-tools" | awk -F';' '{print $2}' | awk -F'|' '{print $1}' | tr -d '[:blank:]' | grep -v 'rc' | sort -Vru )
LATEST_STABLE_BT=$(echo "$NON_RC_BT" | head -1)
# Skipping the latest stable, as it can result in a duplicate
BASE_RELEASES_BT=$(echo "$NON_RC_BT" | tail -n +2 | grep '\.0$' | head -3)
# 1 latest stable + 3 base releases = 4 unique versions
BUILD_TOOLS_VERSIONS=$(printf '%s\n%s' "$LATEST_STABLE_BT" "$BASE_RELEASES_BT" )

readarray -t BUILD_TOOLS_ARRAY <<< "$BUILD_TOOLS_VERSIONS"

PLATFORMS=$(sdkmanager --list | grep "platforms;android" | cut -d'|' -f1 | grep -v 'Sandbox' | grep -v 'ext' | grep -vi 'beta\|canary' | sort -t- -nk2 | tr -d '[:blank:]' | awk -F- '!seen[$NF]++' | tail -7)

readarray -t PLATFORMS_ARRAY <<< "$PLATFORMS"

# Match on line content rather than fixed line numbers so template edits don't misplace updates
sed -i 's/^ENV MAVEN_VERSION=.*/ENV MAVEN_VERSION='"$MAVEN_VERSION"'/' Dockerfile.template
sed -i 's/^ENV GRADLE_VERSION=.*/ENV GRADLE_VERSION='"$GRADLE_VERSION"'/' Dockerfile.template
sed -i 's/commandlinetools-linux-[0-9]*_latest\.zip/commandlinetools-linux-'"$CLT_VERSION"'_latest.zip/' Dockerfile.template
sed -i 's/gem install fastlane --version [^ ]*/gem install fastlane --version '"$FASTLANE_VERSION"'/' Dockerfile.template
sed -i 's/^ENV GCLOUD_VERSION=.*/ENV GCLOUD_VERSION='"$GCLOUD_VERSION"'-0/' Dockerfile.template

# Build tools and platforms are multi-line blocks, so locate the first line of each block
BT_LINE=$(grep -n 'sdkmanager "build-tools;' Dockerfile.template | head -1 | cut -d: -f1)
PLATFORMS_LINE=$(grep -n 'sdkmanager "platforms;' Dockerfile.template | head -1 | cut -d: -f1)

sed -i "$((BT_LINE))"'c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "build-tools;'"${BUILD_TOOLS_ARRAY[0]}"'" && \\' Dockerfile.template
sed -i "$((BT_LINE + 1))"'c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "build-tools;'"${BUILD_TOOLS_ARRAY[1]}"'" && \\' Dockerfile.template
sed -i "$((BT_LINE + 2))"'c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "build-tools;'"${BUILD_TOOLS_ARRAY[2]}"'" && \\' Dockerfile.template
sed -i "$((BT_LINE + 3))"'c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "build-tools;'"${BUILD_TOOLS_ARRAY[3]}"'"' Dockerfile.template
sed -i "$((PLATFORMS_LINE))"'c\RUN echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "'"${PLATFORMS_ARRAY[0]}"'" && \\' Dockerfile.template
sed -i "$((PLATFORMS_LINE + 1))"'c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "'"${PLATFORMS_ARRAY[1]}"'" && \\' Dockerfile.template
sed -i "$((PLATFORMS_LINE + 2))"'c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "'"${PLATFORMS_ARRAY[2]}"'" && \\' Dockerfile.template
sed -i "$((PLATFORMS_LINE + 3))"'c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "'"${PLATFORMS_ARRAY[3]}"'" && \\' Dockerfile.template
sed -i "$((PLATFORMS_LINE + 4))"'c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "'"${PLATFORMS_ARRAY[4]}"'" && \\' Dockerfile.template
sed -i "$((PLATFORMS_LINE + 5))"'c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "'"${PLATFORMS_ARRAY[5]}"'" && \\' Dockerfile.template
sed -i "$((PLATFORMS_LINE + 6))"'c\    echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "'"${PLATFORMS_ARRAY[6]}"'"' Dockerfile.template

CMAKE_VERS=$(sdkmanager --list | grep cmake | cut -d'|' -f1 | sort -Vr | tr -d '[:blank:]' | head -2)

readarray -t CMAKE_ARRAY <<< "$CMAKE_VERS"

NDK_VERS=$(sdkmanager --list | grep ndk | grep -v 'rc[[:digit:]]' | cut -d'|' -f1 | sort -Vr | tr -d '[:blank:]' | sed 's/ndk;//g' | awk -F. '!seen[$1"."]++' | head -2)

readarray -t NDK_ARRAY <<< "$NDK_VERS"
echo ${NDK_ARRAY[1]}

CMAKE_LINE=$(grep -n 'sdkmanager "cmake;' variants/ndk.Dockerfile.template | head -1 | cut -d: -f1)

sed -i "$((CMAKE_LINE))"'c\RUN echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "'"${CMAKE_ARRAY[1]}"'" && \\' variants/ndk.Dockerfile.template
sed -i "$((CMAKE_LINE + 1))"'c\	echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "'"${CMAKE_ARRAY[0]}"'"' variants/ndk.Dockerfile.template
sed -i 's/^ENV NDK_LTS_VERSION .*/ENV NDK_LTS_VERSION "'"${NDK_ARRAY[1]}"'"/' variants/ndk.Dockerfile.template
sed -i 's/^ENV NDK_STABLE_VERSION .*/ENV NDK_STABLE_VERSION "'"${NDK_ARRAY[0]}"'"/' variants/ndk.Dockerfile.template


shared/gen-dockerfiles.sh "$RELEASE"
git add .
git commit -m "Publish v$RELEASE. [release]"
git push -u origin "release-v$RELEASE"
gh pr create --title "Publish v$RELEASE. [release]" --head "release-v$RELEASE" --body "Publish v$RELEASE. [release]"
