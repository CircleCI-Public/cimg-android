!/usr/bin/env bash

if [ -f shared/automated-updates.sh ]; then
  source shared/automated-updates.sh
else
  echo "Check if submodule was loaded; automated-updates.sh is missing"
  exit 1
fi
cd ..

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/circleci/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

GCLOUD_VERSION=$(gcloud version | head -1 | sed 's/[^0-9.]//g')
echo "Gcloud version: "$GCLOUD_VERSION

GRADLE_VERSION=$(brew info gradle | head -1 | sed 's/[^0-9.]//g')
echo "Gradle version: "$GRADLE_VERSION

MAVEN_VERSION=$(brew info maven | head -1 | sed 's/[^0-9.]//g')
echo "Maven version: "$MAVEN_VERSION

BUILD_TOOLS=$(sdkmanager --list | grep "build-tools" | tail -1 | sed 's/.*|\(.*\)|.*/\1/' | sed 's/^[[:space:]]*//' | sed 's/ *$//' | sed -e 's/\s\+/-/g' | sed 's/ /-/g')
echo "Build tools version: "$BUILD_TOOLS

CHANGES=0
generateVersions $GCLOUD_VERSION
generateSearchTerms "GCLOUD_VERSION" "2023.03/Dockerfile"
# shellcheck disable=SC2154
directoryCheck "2023.03" "$SEARCH_TERM"
if [[ $(echo $?) == 0 ]]; then
    sed -i "s/GCLOUD_VERSION=.*/ENV GCLOUD_VERSION=${GCLOUD_VERSION}/g" Dockerfile.template
    CHANGES=$(($CHANGES + 1))
fi
generateVersions $GRADLE_VERSION
generateSearchTerms "GRADLE_VERSION" "2023.03/Dockerfile"
# shellcheck disable=SC2154
directoryCheck "2023.03" "$SEARCH_TERM"
if [[ $(echo $?) == 0 ]]; then
    sed -i "s/GRADLE_VERSION=.*/ENV GRADLE_VERSION=${GRADLE_VERSION}/g" Dockerfile.template
    CHANGES=$(($CHANGES + 1))
fi
generateVersions $MAVEN_VERSION
generateSearchTerms "MAVEN_VERSION" "2023.03/Dockerfile"
# shellcheck disable=SC2154
directoryCheck "2023.03" "$SEARCH_TERM"
if [[ $(echo $?) == 0 ]]; then
    sed -i "s/MAVEN_VERSION=.*/ENV MAVEN_VERSION=${MAVEN_VERSION}/g" Dockerfile.template
    CHANGES=$(($CHANGES + 1))
fi

CURRENT_BUILD_TOOLS=$(cat Dockerfile.template | grep -o "build-tools;.*" | sed -r 's/^build-tools;//' |  rev | cut -c2- | rev)
echo $CURRENT_BUILD_TOOLS
if [[ $CURRENT_BUILD_TOOLS != $BUILD_TOOLS ]]; then
    BUILD_TOOLS=$BUILD_TOOLS\"
    sed -i "s/build-tools.*/build-tools;${BUILD_TOOLS}/g" Dockerfile.template
    CHANGES=$(($CHANGES + 1))
fi

PLATFORMS_LIST=$(cat Dockerfile.template | grep -o ".*platforms;android-.*")
echo $PLATFORMS_LIST


if [[ $CHANGES -ge 1 ]]; then
    generateDatedTags
    ./shared/release.sh $RELEASE
fi

echo "DONE"